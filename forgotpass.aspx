<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpass.aspx.cs" Inherits="PROJECT.forgotpass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Review</title>
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
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="email"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* Include padding and border in element's total width and height */
        }

        textarea {
            height: 100px; /* Set a reasonable height for the text area */
            resize: vertical; /* Allow vertical resizing */
        }

        .submitButton {
            background-color: navy;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .submitButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="reviewForm" runat="server">
        <h2>Find your account</h2>
        <div>

            <asp:Label ID="lblEmail" runat="server" Text="Enter your email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
            <p>
            You will receive an email from us for security and login purposes.
            </p>
            <asp:Button ID="btncontinue" runat="server" Text="Continue" CssClass="submitButton" OnClick="btncontinue_Click" />
        </div>
    </form>
</body>
</html>
