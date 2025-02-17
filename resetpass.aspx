<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetpass.aspx.cs" Inherits="PROJECT.resetpass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        #reviewForm {
            background-color: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: bold;
            color: #333;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Include padding and border in element's total width and height */
            font-size: 14px;
        }

        .submitButton {
            background-color: navy;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        .submitButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="reviewForm" runat="server">
        <div>
            <!-- Label and Input for New Password -->
            <asp:Label ID="lblpass" runat="server" Text="Create New Password:"></asp:Label>
            <asp:TextBox ID="txtpass" runat="server" TextMode="Password" placeholder="Enter new password"></asp:TextBox>

            <!-- Label and Input for Confirm Password -->
            <asp:Label ID="lblconfirm" runat="server" Text="Confirm Password:"></asp:Label>
            <asp:TextBox ID="txtconfirm" runat="server" TextMode="Password" placeholder="Confirm new password"></asp:TextBox>

            <!-- Submit Button -->
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="submitButton" OnClick="btnSubmit_Click" />
        </div>
    </form>
</body>
</html>

