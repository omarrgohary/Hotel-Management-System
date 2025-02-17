<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="PROJECT.Booking" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Room Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://thehoteljournal.com/wp-content/uploads/2020/04/best-hotel-swimming-pools-in-Bali-Hotel-Kommune.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh; /* Full viewport height */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .booking-form {
            background-color: rgba(255, 255, 255, 0.5); /* Adjust transparency */
            border-radius: 10px;
            padding: 20px;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        .booking-form label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .booking-form input[type="text"], 
        .booking-form input[type="email"],
        .booking-form input[type="date"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .booking-form button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .booking-form button:hover {
            background-color: #0056b3;
        }
        #add-delete-container {
        position: fixed;
        bottom: 20px;
        right: 20px;
        display: flex;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="booking-form">
            <h2>Room Booking</h2>

            <!-- Email -->
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" CssClass="form-control"></asp:TextBox>

            <!-- Phone -->
            <label for="txtPhone">Phone</label>
            <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your phone number" CssClass="form-control"></asp:TextBox>

            <!-- Number of Rooms -->
            <label for="txtRooms">Number of Rooms</label>
            <asp:TextBox ID="txtRooms" runat="server" placeholder="Enter the number of rooms" CssClass="form-control"></asp:TextBox>

            <!-- Check-in Date -->
            <label for="txtCheckIn">Check-in Date</label>
            <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

            <!-- Check-out Date -->
            <label for="txtCheckOut">Check-out Date</label>
            <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>

            <!-- Submit Button -->
            <asp:Button ID="btnBookNow" runat="server" Text="Book Now" OnClick="btnBookNow_Click" />
            <asp:Button ID="btnlogout" runat="server" Text="Log out" CssClass="add-delete-container" OnClick="btnlogout_Click" />
        </div>
    </form>
</body>
</html>