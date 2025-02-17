using K4os.Compression.LZ4.Encoders;
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
    public partial class adminpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btndep_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = false;
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";
            string query = "SELECT * FROM department";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                   
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
            btnDelete.Visible = false;
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

        protected void btnEmployees_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = false;
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM employee";
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

        protected void btnReviews_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = false;
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

        protected void btnBookedRooms_Click(object sender, EventArgs e)
        {
            btnDelete.Visible = true;
            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";

            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();

                    string query = "SELECT * FROM book";
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

        protected void btnBookRoom_Click(object sender, EventArgs e)
        {
            Response.Redirect("Booking.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Simulate the checkout process (replace with your actual logic)
            // Show the modal for checkout
            ScriptManager.RegisterStartupScript(this, this.GetType(), "openCheckoutModal", "document.getElementById('checkoutModal').style.display = 'block';", true);
        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtRoomNumber.Text, out int roomNumber))
            {
                bool success = CheckOutRoom(roomNumber);
                string connectionString = "server=localhost;Database=hms;user=root;password=123456789";
                string query = "UPDATE room SET availability = '1' WHERE room_num = @num";
                string query2 = "DELETE FROM book WHERE room_num = @num;";
                try
                {
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        connection.Open();
                        using (MySqlCommand cmd = new MySqlCommand(query, connection))
                        {
                            cmd.Parameters.AddWithValue("@num",roomNumber);
                            cmd.ExecuteNonQuery();
                        }
                        using (MySqlCommand cmd1 = new MySqlCommand(query2, connection))
                        {
                            cmd1.Parameters.AddWithValue("@num", roomNumber);
                            cmd1.ExecuteNonQuery();
                        }
                    }
                }
                catch (Exception ex)
                {
                    ShowMessage("Error");
                }
                
                string message = success ? $"Room {roomNumber} has been successfully checked out." : "Failed to check out the room.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid room number. Please try again.');", true);
            }
        }
        

        private bool CheckOutRoom(int roomNumber)
        {

            string connectionString = "server=localhost;Database=hms;user=root;password=123456789";
            string query = "select count(*) from book WHERE room_num = @num";
            try
            {
                using (MySqlConnection connection = new MySqlConnection(connectionString))
                {
                    connection.Open();
                    using (MySqlCommand cmd = new MySqlCommand(query, connection))
                    {
                        cmd.Parameters.AddWithValue("@num", roomNumber);
                        cmd.ExecuteNonQuery();

                        int userCount = Convert.ToInt32(cmd.ExecuteScalar());

                        if (userCount ==1)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error");
            }
            return true; // Assume success for now
        }

        private void ShowMessage(string message)
        {
            string script = $"alert('{message.Replace("'", "\\'")}');";
            ClientScript.RegisterStartupScript(this.GetType(), "MessageBox", script, true);
        }
        
    }
}
