<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="PROJECT.AdminLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Login</title>
    <style>
        /* Style for the entire page */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://th.bing.com/th/id/R.4072dfe37b2a8ba5e0b421c8982c4f30?rik=gvHq194kJoGzRQ&pid=ImgRaw&r=0'); /* Replace with the path to your image */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            height: 100vh; /* Full viewport height */
        }

        /* Optional: Style the form container */
        #form1 {
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white */
            max-width: 400px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            top: 50%;
            transform: translateY(-50%);
        }

        /* Style for labels and inputs */
        label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
        }

        label span {
            color: red; /* Color the asterisk red */
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* Style for the Submit button */
        button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Style for the checkbox */
        .checkbox-label {
            display: flex;
            align-items: center;
        }

        .checkbox-label input {
            width: auto;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Employee ID Field -->
            <label for="empid">Employee ID <span>*</span></label>
            <asp:TextBox ID="empid" runat="server" placeholder="Enter your emp id "></asp:TextBox>

            <!-- Password Field -->
            <label for="txtPassword">Password <span>*</span></label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

        
            <!-- Admin Checkbox -->
            <div class="checkbox-label">
                <input type="checkbox" id="chkAdmin" runat="server" />
                <label for="chkAdmin">Admin</label>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnLogin_Click" />
            <asp:Button ID="btnback" runat="server" Text="Back"  OnClick="btnback_Click" />
        </div>
    </form>
</body>
</html>

