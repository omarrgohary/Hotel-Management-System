using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Web.Configuration;
using MySql.Data.MySqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Data.SqlClient;


namespace PROJECT
{
    public partial class forgotpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btncontinue_Click(object sender, EventArgs e)
        {
            if(txtEmail.Text=="")
            {
                ShowMessage("Please enter your email");
            }
            else
            {
                string em=txtEmail.Text;
                string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

                string query = "Select count(*) from user WHERE email=@email";

                try
                {
                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();
                        using (MySqlCommand cmd3 = new MySqlCommand(query, conn))
                        {
                            cmd3.Parameters.AddWithValue("@email", em);
                            cmd3.ExecuteNonQuery();

                            int userCount = Convert.ToInt32(cmd3.ExecuteScalar());

                            if (userCount == 0)
                            {
                                ShowMessage("This email is not registered");
                            }
                            else
                            {
                                string resetToken = Guid.NewGuid().ToString(); 
                                SaveResetTokenToDatabase(em, resetToken);

                                // Construct the reset link
                                string resetLink = $"{Request.Url.GetLeftPart(UriPartial.Authority)}/resetpass.aspx?token={resetToken}";

                                // Send the email
                                SendResetEmail(em, resetLink);

                                ShowMessage( "An email with reset instructions has been sent to your email address.");
                                Response.Redirect("UserLogin.aspx");


                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    string err = "Error: " + ex.Message;
                    ShowMessage(err);
                }
            }
        }

        private void SaveResetTokenToDatabase(string email, string token)
        {
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            var query = "UPDATE user SET token = @Token, TokenExpiry = @TokenExpiry WHERE Email = @Email";

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.AddWithValue("@Token", token);
                    command.Parameters.AddWithValue("@TokenExpiry", DateTime.Now.AddHours(1)); 
                    command.Parameters.AddWithValue("@Email", email);
                    command.ExecuteNonQuery();
                }
            }
        }

        private void SendResetEmail(string email, string resetLink)
        {
            var smtpClient = new SmtpClient
            {
                Host = "smtp.gmail.com", 
                Port = 587, 
                Credentials = new NetworkCredential("thedeluxehotel@gmail.com", "dbyu krbv zngo yuuz"),
                EnableSsl = true
            };

            var mailMessage = new MailMessage
            {
                From = new MailAddress("thedeluxehotel@gmail.com"),
                Subject = "Password Reset",
                IsBodyHtml = true,
                Body = $@"
            <html>
                <head>
                    <style>
                        body {{ font-family: Arial, sans-serif; color: #333; }}
                        .button {{ background-color: #007BFF; color: white; padding: 10px 20px; text-decoration: none; border-radius: 5px; }}
                        .button:hover {{ background-color: #0056b3; }}
                    </style>
                </head>
                <body>
                    <p>Dear User,</p>
                    <p>We received a request to reset your password for your account. To proceed, please click the link below to reset your password:</p>
                    <p><a href='{resetLink}' class='button'>Reset Your Password</a></p>
                    <p>If you did not request this password reset, please ignore this email. Your password will remain unchanged.</p>
                    <p>Best regards,<br/>The Deluxe Hotel Team</p>
                </body>
            </html>"               
            
            };

            mailMessage.To.Add(email);

            smtpClient.Send(mailMessage);
        }


        private void ShowMessage(string message)
        {
            //Register JavaScript to show the alert in the browser

            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}