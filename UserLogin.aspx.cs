using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;
using System.Data.SqlClient;
using BCrypt.Net;

namespace PROJECT
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        protected void btncreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(txtEmail.Text =="" || txtPassword.Text=="")
            {
                string n = "Please enter the data required";
                ShowMessage(n);
            }

            string em= txtEmail.Text;
            string pass= txtPassword.Text;
            string hashedPassword = null;


            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            try
            {
                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();

                    
                    string query = "SELECT password FROM user WHERE email = @Email ";

                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        
                        cmd.Parameters.AddWithValue("@Email", em);

                        MySqlDataReader reader = cmd.ExecuteReader();


                        if (reader.Read())
                        {
                           hashedPassword= reader["password"].ToString();
                        }
                        else
                        {
                            ShowMessage("Invalid email or password.");
                            return;
                        }
                        if (BCrypt.Net.BCrypt.Verify(pass, hashedPassword))
                        {
                            Response.Redirect("RoomGallery.aspx");
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

        
        private void ShowMessage(string message)
        {
            //Register JavaScript to show the alert in the browser

            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}