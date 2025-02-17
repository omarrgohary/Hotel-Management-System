using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using System.Security.Claims;
using System.Text;
using System.Data.SqlClient;
using Microsoft.Ajax.Utilities;


namespace PROJECT
{
    public partial class resetpass : System.Web.UI.Page
    {
        protected string resetToken = string.Empty;
        protected string userEmail = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }
        private bool ValidateResetToken(string token)
        {
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            string query = "Select email, TokenExpiry from user where token=@token";

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd3 = new MySqlCommand(query, conn))
                {
                    conn.Open();
                    cmd3.Parameters.AddWithValue("@token", token);

                    MySqlDataReader reader = cmd3.ExecuteReader();
                    if (reader.Read())
                    {
                        var expiryTime = Convert.ToDateTime(reader["TokenExpiry"]);
                        if (expiryTime > DateTime.Now)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        // If no record was found for the token, return false (invalid token)
                        return false;
                    }
                }
            }
        }
        private string Validatemail(string token)
        {
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            string query = "Select email from user where token=@token";

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                using (MySqlCommand cmd3 = new MySqlCommand(query, conn))
                {
                    conn.Open();
                    cmd3.Parameters.AddWithValue("@token", token);

                    MySqlDataReader reader = cmd3.ExecuteReader();
                    if (reader.Read())
                    {
                        string em = Convert.ToString(reader["email"]);
                        if (em!=null )
                        {
                            return em;
                        }
                        else
                        {
                            ShowMessage("Error");
                            return null;
                        }
                    }
                    else
                    {
                        // If no record was found for the token, return false (invalid token)
                        ShowMessage("Email is not registered");
                        return null;
                    }
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtconfirm.Text == "" || txtpass.Text == "")
            {
                ShowMessage("Please enter the data required");
            }
            else if(txtconfirm.Text != txtpass.Text)
            {
                ShowMessage("Please make sure that passwords are identical");
            }
            else
            {
                string resetToken = Request.QueryString["token"];

                // Check if the resetToken is empty
                if (resetToken == null)
                {
                    ShowMessage("Invalid reset token.");
                    return;
                }

                // Validate the reset token
                bool isValid = ValidateResetToken(resetToken);

                if (!isValid)
                {
                    ShowMessage("Invalid or expired token.");
                }
                else
                {
                    string p = txtpass.Text;
                    string connectionString = "server=localhost;Database=hms;user=root;password=123456789";
                    string query = "UPDATE user SET password = @pass WHERE email = @Email";
                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(p);

                    string emailss = Validatemail(resetToken);
                    if (emailss != null)
                    {
                        try
                        {
                            using (MySqlConnection conn = new MySqlConnection(connectionString))
                            {
                                conn.Open();
                                using (MySqlCommand cmd1 = new MySqlCommand(query, conn))
                                {
                                    cmd1.Parameters.AddWithValue("@pass", hashedPassword);
                                    cmd1.Parameters.AddWithValue("@Email", emailss);
                                    int rowsAffected = cmd1.ExecuteNonQuery();
                                    if (rowsAffected > 0)
                                    {   
                                        ShowMessage("Password updated successfully.");
                                    }
                                    else
                                    {
                                        ShowMessage("Password update failed.");
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
            }
        }
        private void ShowMessage(string message)
        {
            // Display alert with the message
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}