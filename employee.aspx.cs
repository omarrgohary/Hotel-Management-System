using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReviews_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM review";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);

                            gvReviews.DataSource = dt;
                            gvReviews.DataBind();
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                ShowMessage("Error");
            }
        }
        protected void btnAvailableRooms_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM room WHERE availability =1";
                    using (MySqlCommand command = new MySqlCommand(query, connection))
                    {
                        using (MySqlDataAdapter adapter = new MySqlDataAdapter(command))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);

                            gvReviews.DataSource = dt;
                            gvReviews.DataBind();
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                ShowMessage("Error");
            }
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
        private void ShowMessage(string message)
        {
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
    }
}