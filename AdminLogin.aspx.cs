using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using BCrypt.Net;
using System.Security.Cryptography;
using System.Text;

namespace PROJECT
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (empid.Text == "" || txtPassword.Text == "")
            {
                ShowMessage("Please enter the data required");
            }
            string empidd = empid.Text;
            string password = txtPassword.Text;
            string adminid1 = "1";
            string adminid0 = "0";
            string hashedPassword = null;
            string hashedEnteredPassword = GetSHA256Hash(password);


            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";
            if (chkAdmin.Checked==false)
            {
                try
                {
                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "SELECT pass FROM employee WHERE empid = @empid  AND adminn= @adminid0";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {

                            cmd.Parameters.AddWithValue("@empid", empidd);
                            cmd.Parameters.AddWithValue("@adminid0", adminid0);


                            MySqlDataReader reader = cmd.ExecuteReader();


                            if (reader.Read())
                            {
                                hashedPassword = reader["pass"].ToString();
                            }
                            else
                            {
                                ShowMessage("Invalid email or password.");
                                return;
                            }
                            if (hashedPassword==hashedEnteredPassword)
                            {
                                Response.Redirect("employee.aspx");
                            }
                            else
                            {
                                ShowMessage("Invalid email or password.");
                            }
                        }

                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("Error: " + ex.Message);
                }
            }
            else
            {
                try
                {
                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();
                        string query = "SELECT pass FROM employee WHERE empid = @empid AND adminn= @adminid1";

                        using (MySqlCommand cmd = new MySqlCommand(query, conn))
                        {

                            cmd.Parameters.AddWithValue("@empid", empidd);
                            cmd.Parameters.AddWithValue("@adminid1", adminid1);


                            MySqlDataReader reader = cmd.ExecuteReader();

                            if (reader.Read())
                            {
                                hashedPassword = reader["pass"].ToString();
                            }
                            else
                            {
                                ShowMessage("Invalid email or password.");
                                return;
                            }
                            if (hashedPassword==hashedEnteredPassword)
                            {
                                Response.Redirect("adminpage.aspx");
                            }
                            else
                            {
                                ShowMessage("Invalid email or password.");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("Error: " + ex.Message);
                }
            }
        }

        
        public static string GetSHA256Hash(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash returns a byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                foreach (byte byteValue in bytes)
                {
                    builder.Append(byteValue.ToString("x2")); // x2 formats the byte as a hexadecimal string
                }
                return builder.ToString();
            }
        }
        

        private void ShowMessage(string message)
        {
            // Register JavaScript to show the alert in the browser
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}