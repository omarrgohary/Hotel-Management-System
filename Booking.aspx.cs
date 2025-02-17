using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PROJECT
{
    public partial class Booking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            string em = txtEmail.Text;
            string phone = txtPhone.Text;
            string r = txtRooms.Text;
            string n = txtCheckIn.Text;
            string o = txtCheckOut.Text;
            DateTime checkInDate;
            DateTime checkOutDate;

            if (em == "" || phone == " " || r == " " || n == " " || o == "")
            {
                string invalid = "Please enter the data required";
                ShowMessage(invalid);
            }


            if (DateTime.TryParse(txtCheckIn.Text, out checkInDate) && DateTime.TryParse(txtCheckOut.Text, out checkOutDate))
            {
                // Calculate the difference
                int daysDifference = (checkOutDate - checkInDate).Days;
                string connectionString = "server=localhost;Database=hms;user=root;password=123456789";


                try
                {
                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();


                        string query = "INSERT INTO book (id,room_num,check_in, check_out, email,  phone, no_of_rooms, days) " +
                                       "VALUES (@id,@room_number,@checkin, @checkout, @Email,  @phone, @numofrooms, @days)";

                        string query2 = "SELECT id FROM user WHERE email = @Email ";

                        for (int i = 0; i < int.Parse(r); i++)
                        {
                            
                            using (MySqlCommand cmd1 = new MySqlCommand(query2, conn))
                            {

                                cmd1.Parameters.AddWithValue("@Email", em);
                                object idd = cmd1.ExecuteScalar();

                                if (idd == null)
                                {
                                    ShowMessage("Enter email used for sign up ");
                                }
                                else
                                {
                                    string query3 = "select room_num from room where availability='1' LIMIT 1";
                                    using (MySqlCommand cmd2 = new MySqlCommand(query3, conn))
                                    {
                                        object num = cmd2.ExecuteScalar();
                                        if ( num == null )
                                        {
                                            ShowMessage("No rooms available");
                                        }
                                        else
                                        {
                                            using (MySqlCommand cmd = new MySqlCommand(query, conn))
                                            {
                                                cmd.Parameters.AddWithValue("@id", idd);
                                                cmd.Parameters.AddWithValue("@room_number", num);
                                                cmd.Parameters.AddWithValue("@checkin", n);
                                                cmd.Parameters.AddWithValue("@checkout", o);
                                                cmd.Parameters.AddWithValue("@Email", em);
                                                cmd.Parameters.AddWithValue("@phone", phone);
                                                cmd.Parameters.AddWithValue("@numofrooms", r);
                                                cmd.Parameters.AddWithValue("@days", daysDifference);

                                                cmd.ExecuteNonQuery();
                                            }
                                            string query4 = "UPDATE room SET availability = '0' WHERE room_num = @RoomNum1";
                                            using (MySqlCommand cmd4 = new MySqlCommand(query4, conn))
                                            {
                                                cmd4.Parameters.AddWithValue("@RoomNum1", num);
                                                cmd4.ExecuteNonQuery();
                                            }
                                            ShowMessage("Your room has been successfully booked! We look forward to welcoming you.");
                                        }
                                       
                                    }
                                  
                                }
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
            else
            {
                ShowMessage("Please enter valid dates.");
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
