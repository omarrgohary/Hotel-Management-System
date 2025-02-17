using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Helpers;
using System.Security.Cryptography;
using System.Text;
using BCrypt.Net;

namespace PROJECT
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (txtFirstName.Text == "" || txtLastName.Text == "" || txtEmail.Text == "" || txtPassword.Text == "" || txtRetypePassword.Text == "" || txtIdProof.Text == "" || txtDOB.Text == "" || txtPhone.Text == "" || txtPhone2.Text == "")
            {
                string invalid = "Please enter the data required";
                ShowMessage(invalid);
            }
            else if (txtPassword.Text != txtRetypePassword.Text)
            {
                string error = "Please re enter your password ";
                ShowMessage(error);
            }
            else if (txtPhone.Text == txtPhone2.Text)
            {
                string error = "Please entter different phone numbers ";
                ShowMessage(error);
            }
            else
            {
                string firstname = txtFirstName.Text;
                string lastname = txtLastName.Text;
                string email = txtEmail.Text;
                string password = txtPassword.Text;
                string idproof = txtIdProof.Text;
                string dob = txtDOB.Text;
                string phone = txtPhone.Text;
                string phone2 = txtPhone2.Text;

                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);


                string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

                string query = "INSERT INTO user (fname, lname, email,  password, Dob, ssn) " +
                                       "VALUES (@FirstName, @LastName, @Email,  @Password, @DOB, @ssn)";

                string phoneQuery = "INSERT INTO user_phone (id, phone) VALUES (@Id, @Phone)";

                string query1 = "Select count(*) from user WHERE email=@email  or ssn=@ssn";

                try
                {
                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();
                        using (MySqlCommand cmd3 = new MySqlCommand(query1, conn))
                        {
                            cmd3.Parameters.AddWithValue("@email", email);
                            cmd3.Parameters.AddWithValue("@ssn", idproof);
                            cmd3.ExecuteNonQuery();

                            int userCount = Convert.ToInt32(cmd3.ExecuteScalar());

                            if (userCount > 0)
                            {
                                ShowMessage("You already have an account");
                            }
                            else
                            {
                                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                                {
                                    cmd.Parameters.AddWithValue("@FirstName", firstname);
                                    cmd.Parameters.AddWithValue("@LastName", lastname);
                                    cmd.Parameters.AddWithValue("@Email", email);
                                    cmd.Parameters.AddWithValue("@Password", hashedPassword);
                                    cmd.Parameters.AddWithValue("@DOB", dob);
                                    cmd.Parameters.AddWithValue("@ssn", idproof);



                                    cmd.ExecuteNonQuery();
                                }
                                string getLastIdQuery = "SELECT LAST_INSERT_ID()";
                                long userId;


                                using (MySqlCommand getIdCmd = new MySqlCommand(getLastIdQuery, conn))
                                {
                                    userId = Convert.ToInt64(getIdCmd.ExecuteScalar());
                                }
                                using (MySqlCommand phoneCmd = new MySqlCommand(phoneQuery, conn))
                                {
                                    // Insert phone1
                                    phoneCmd.Parameters.AddWithValue("@Id", userId);
                                    phoneCmd.Parameters.AddWithValue("@Phone", phone);
                                    phoneCmd.ExecuteNonQuery();

                                    // Clear parameters for phone2
                                    phoneCmd.Parameters.Clear();

                                    // Insert phone2
                                    phoneCmd.Parameters.AddWithValue("@Id", userId);
                                    phoneCmd.Parameters.AddWithValue("@Phone", phone2);
                                    phoneCmd.ExecuteNonQuery();
                                }
                                string s = "Sign-up successful!";
                                ShowMessage(s);
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

                
        
        private void ShowMessage(string message)
        {
            //Register JavaScript to show the alert in the browser

            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}