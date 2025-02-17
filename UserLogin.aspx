<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="PROJECT.UserLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://images7.alphacoders.com/362/362619.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh;
        }
        #form1 {
            background-color: rgba(255, 255, 255, 0.8);
            max-width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }
        label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
        }
        label span {
            color: red;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .action-links {
            text-align: center;
            margin-top: 10px;
        }
        .action-links a {
            font-size: 14px;
            color: #007BFF;
            text-decoration: none;
            margin: 0 10px;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
        button, .asp-button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: transparent;
            color: black;
            border: 1px solid black;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover, .asp-button:hover {
            background-color: rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="txtEmail">Email <span>*</span></label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>
            <label for="txtPassword">Password <span>*</span></label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
            <asp:Button ID="btnsubmit" runat="server" Text="Login" CssClass="asp-button" OnClick="btnSubmit_Click" />
            <div class="action-links">
                <asp:HyperLink ID="ForgotPasswordLink" runat="server" NavigateUrl="forgotpass.aspx" Text="Forgot Password?" />
                <asp:HyperLink ID="SignUpLink" runat="server" NavigateUrl="SignUp.aspx" Text="Create New Account" />
            </div>
            <asp:Button ID="btnback" runat="server" Text="Back" CssClass="asp-button" OnClick="btnback_Click" />
        </div>
    </form>
</body>
</html>

