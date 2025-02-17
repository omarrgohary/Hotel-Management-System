<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PROJECT.Home" %>

 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Deluxe Hotel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f4f4f4;
            color: #333;
        }

        header {
            background-color: navy;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .hero {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px;
        }

        .hero img {
            width: 300px;
            height: 200px;
            margin: 10px;
            border-radius: 10px;
            object-fit: cover;
            transition: transform 0.3s ease; /* Smooth transition effect */
        }

        .hero img:hover {
            transform: scale(1.1); /* Increases the size by 10% */
        }

        .about {
            text-align: center;
            padding: 20px;
            margin: 20px auto;
            max-width: 800px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .buttons {
            text-align: center;
            margin: 20px 0;
        }

        .buttons a {
            text-decoration: none;
            color: white;
            background-color: navy;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .buttons a:hover {
            background-color: #000080;
        }

        footer {
            background-color: navy;
            color: white;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to THE DELUXE HOTEL</h1>
    </header>

    <div class="hero">
        <!-- Replace the src values with your image links -->
        <img src="https://th.bing.com/th/id/R.b169ef7dcc364b53d19c4dfce37bdbc6?rik=YAaa3rNQq%2fkW1w&pid=ImgRaw&r=0" alt="Hotel View">
        <img src="https://www.worldrainbowhotels.com/wp-content/uploads/2019/11/Hotel-deLuxe-1600x1067.jpg" alt="Luxury Suite">
        <img src="https://hoteldeluxe.al/wp-content/uploads/2017/12/res2.jpg" alt="Dining Area">
    </div>

    <div class="about">
        <p>
            At THE DELUXE HOTEL, we offer a luxurious and unforgettable experience for all our guests. 
            From our elegant rooms to our exquisite dining options, every detail is designed to provide 
            comfort and sophistication. Join us for a stay that exceeds your expectations.
        </p>
    </div>

    <div class="buttons">
        <a href="AdminLogin.aspx">Employee Login</a>
        <a href="UserLogin.aspx">User Login</a>
        <a href="SignUp.aspx">Sign Up</a>
    </div>

    <footer>
        <p>&copy; 2025 THE DELUXE HOTEL. All rights reserved.</p>
    </footer>
</body>
</html>
