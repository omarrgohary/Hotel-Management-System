<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="PROJECT.adminpage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        #header {
            background-color: navy;
            color: white;
            padding: 15px;
            text-align: center;
        }

        #button-container {
            display: flex;
            justify-content: center;
            padding: 10px;
            background-color: #f8f8f8;
        }

        h2 {
            margin: 0;
            font-size: 24px;
        }

        .button {
            padding: 10px 15px;
            margin: 0 5px;
            background-color: navy;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            flex: 1;
            max-width: 150px;
        }

        .button:hover {
            background-color: #0056b3;
        }

        .gridview-container {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: auto;
        }

        .gridview table {
            border-collapse: collapse;
            width: 80%;
            max-height: 80vh;
        }

        .gridview th, .gridview td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .gridview th {
            background-color: #f2f2f2;
        }

        #add-delete-container {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
        }

        /* Modal Styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black with opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
            text-align: center;
        }

        .modal .close {
            color: #aaa;
            font-size: 28px;
            font-weight: bold;
        }

        .modal .close:hover,
        .modal .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Styling for dynamic elements */
        .dynamic-label,
        .dynamic-textbox,
        .dynamic-button {
            margin: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <h2>Admin Dashboard</h2>
        </div>
        <div id="button-container">
            <asp:Button ID="btnEmployees" runat="server" Text="Employees" CssClass="button" OnClick="btnEmployees_Click" />
            <asp:Button ID="btndep" runat="server" Text="Departments" CssClass="button" OnClick="btndep_Click" />
            <asp:Button ID="btnReviews" runat="server" Text="Reviews" CssClass="button" OnClick="btnReviews_Click" />
            <asp:Button ID="btnBookedRooms" runat="server" Text="Booked Rooms" CssClass="button" OnClick="btnBookedRooms_Click" />
            <asp:Button ID="btnAvailableRooms" runat="server" Text="Available Rooms" CssClass="button" OnClick="btnAvailableRooms_Click" />
            <asp:Button ID="btnBookRoom" runat="server" Text="Book Now" CssClass="button" OnClick="btnBookRoom_Click" />
        </div>

        <div class="gridview-container">
            <asp:GridView ID="gvReviews" runat="server" AutoGenerateColumns="true" CssClass="gridview">
            </asp:GridView>
        </div>

        <div id="add-delete-container">
            <asp:Button ID="btnDelete" runat="server" Text="Check Out" CssClass="button" OnClick="btnDelete_Click" Visible="False" />
             <asp:Button ID="btnlogout" runat="server" Text="Logout" CssClass="button" OnClick="btnlogout_Click" />

        </div>

        <!-- Modal for Room Checkout -->
        <div id="checkoutModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <label id="lblRoomNumber" runat="server" class="dynamic-label">Enter the room number to be checked out:</label>
                <br />
                <asp:TextBox ID="txtRoomNumber" runat="server" CssClass="dynamic-textbox" />
                <br />
                <asp:Button ID="btnSubmitRoom" runat="server" Text="Submit" CssClass="dynamic-button" OnClick="BtnSubmit_Click" />
            </div>
        </div>
    </form>

    <script>
        // Get the modal
        var modal = document.getElementById("checkoutModal");

        // Get the button that opens the modal
        var btn = document.getElementById("btnDelete");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on the button, open the modal
        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>