using MySql.Data.MySqlClient;
using SendGrid;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class Reviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnback_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomGallery.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtEmail.Text == "")
            {
                ShowMessage("Please enter the data required");
            }
            else if (txtdesc.Text == "")
            {
                ShowMessage("Please enter the data required");
            }
            else
            {
                string d = txtdesc.Text;
                string em = txtEmail.Text;

                string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

                try
                {
                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();


                        string query = "INSERT INTO review (descriptions,id) " +
                                       "VALUES (@description, @id)";

                        string query2 = "SELECT id FROM user WHERE email = @Email ";

                        using (MySqlCommand cmd1 = new MySqlCommand(query2, conn))
                        {

                            cmd1.Parameters.AddWithValue("@Email", em);
                            object idd = cmd1.ExecuteScalar();

                            if (idd == null)
                            {
                                ShowMessage("Invalid Email");
                            }
                            else
                            {
                                using (MySqlCommand cmd2 = new MySqlCommand(query, conn))
                                {

                                    cmd2.Parameters.AddWithValue("@description", d);
                                    cmd2.Parameters.AddWithValue("@id", idd);
                                    cmd2.ExecuteNonQuery();

                                }
                                ShowMessage("Your response has been submitted");
                                
                            }
                            Response.Redirect("RoomGallery.aspx");
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
            // Display alert with the message
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}