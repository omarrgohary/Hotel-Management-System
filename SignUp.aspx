<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="PROJECT.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style>
        
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://i.pinimg.com/originals/b9/cf/40/b9cf40d13866364a28f1528e51cc6348.jpg'); 
            background-size: cover;
            background-position: center;
            height: 100vh;
        }

        /* Container for the sign-up form */
        .signup-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* The sign-up form style */
        .signup-form {
            background-color: rgba(255, 255, 255, 0.8); /* White background with some transparency */
            padding: 30px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        /* Heading style */
        .signup-form h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        /* Input labels */
        .signup-form label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
            color: #333;
        }

        /* Asterisk for required fields */
        .signup-form label span {
            color: red; /* Make the asterisk red */
            font-weight: bold;
        }

        /* Input fields */
        .signup-form input[type="text"], .signup-form input[type="password"], .signup-form input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        /* Button styling */
        .signup-form button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .signup-form button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-container">
            <div class="signup-form">
                <h2>Create Your Account</h2>

                <!-- First Name -->
                <label for="txtFirstName">First Name <span>*</span></label>
                <asp:TextBox ID="txtFirstName" runat="server" placeholder="Enter your first name"></asp:TextBox>

                <!-- Last Name -->
                <label for="txtLastName">Last Name <span>*</span></label>
                <asp:TextBox ID="txtLastName" runat="server" placeholder="Enter your last name"></asp:TextBox>

                <!-- Phone -->
                <label for="txtPhone">Phone <span>*</span></label>
                <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your phone number"></asp:TextBox>

                <!-- Phone 2 -->
                <label for="txtPhone2">Phone 2</label>
                <asp:TextBox ID="txtPhone2" runat="server" placeholder="Enter your second phone number"></asp:TextBox>

                <!-- Email -->
                <label for="txtEmail">Email <span>*</span></label>
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email"></asp:TextBox>

                <!-- ID Proof -->
                <label for="txtIdProof">ID Proof (e.g., passport, ID card) <span>*</span></label>
                <asp:TextBox ID="txtIdProof" runat="server" placeholder="Enter your ID proof number"></asp:TextBox>

                <!-- Date of Birth -->
                <label for="txtDOB">Date of Birth <span>*</span></label>
                <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" placeholder="Enter your date of birth"></asp:TextBox>

                <!-- Password -->
                <label for="txtPassword">Password <span>*</span></label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

                <!-- Retype Password -->
                <label for="txtRetypePassword">Retype your password <span>*</span></label>
                <asp:TextBox ID="txtRetypePassword" runat="server" TextMode="Password" placeholder="Confirm password"></asp:TextBox>

                <!-- Sign Up Button -->
                <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" OnClick="btnSignUp_Click" />
                <asp:Button ID="btnback" runat="server" Text="Back"  OnClick="btnback_Click" />
            </div>
        </div>
    </form>
</body>
</html>
