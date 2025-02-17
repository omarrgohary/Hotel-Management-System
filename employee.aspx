<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="PROJECT.employee" %>

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
        #add-delete-container {
        position: fixed;
        bottom: 20px;
        right: 20px;
        display: flex;
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
     
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="header">
            <h2>Employee Dashboard</h2>
        </div>
        <div id="button-container">
            
            <asp:Button ID="btnReviews" runat="server" Text="Reviews" CssClass="button" OnClick="btnReviews_Click" />
            <asp:Button ID="btnAvailableRooms" runat="server" Text="Available Rooms" CssClass="button" OnClick="btnAvailableRooms_Click" />
        </div>

        <div class="gridview-container">
            <asp:GridView ID="gvReviews" runat="server" AutoGenerateColumns="true" CssClass="gridview">
            </asp:GridView>
        </div>

        <div id="add-delete-container">
           
             <asp:Button ID="btnlogout" runat="server" Text="Logout" CssClass="button" OnClick="btnlogout_Click" />

        </div>
     </form>
 
</body>
</html>
