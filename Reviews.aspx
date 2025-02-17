<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="PROJECT.Reviews" %>

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

        /* Add spacing between the buttons */
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 10px; /* Space between buttons */
        }
    </style>
</head>
<body>
    <form id="reviewForm" runat="server">
        <h2>Submit Your Review</h2>
        <div>
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>

            <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            <asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine"></asp:TextBox>

            <div class="button-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Review" CssClass="submitButton" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnback" runat="server" Text="Back" CssClass="submitButton" OnClick="btnback_Click" />
            </div>
        </div>
    </form>
</body>
</html>

