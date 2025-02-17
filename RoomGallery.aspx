<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomGallery.aspx.cs" Inherits="PROJECT.RoomGallery" %>

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
            opacity: 0;
            transform: translateY(20px);
            animation: fadeIn 1s forwards;
        }

        .hero img:nth-child(1) {
            animation-delay: 0.2s;
        }

        .hero img:nth-child(2) {
            animation-delay: 0.4s;
        }

        .hero img:nth-child(3) {
            animation-delay: 0.6s;
        }

        .hero img:nth-child(4) {
            animation-delay: 0.8s;
        }

        .hero img:nth-child(5) {
            animation-delay: 1s;
        }

        .hero img:nth-child(6) {
            animation-delay: 1.2s;
        }

        .hero img:nth-child(7) {
            animation-delay: 1.4s;
        }

        .hero img:nth-child(8) {
            animation-delay: 1.6s;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
        <h1>Explore Our Luxurious Rooms</h1>
    </header>

    <div class="hero">
        <!-- Replace the src values with your image links -->
        <img src="https://th.bing.com/th/id/R.25c66e6c5bcf5e384542d87800cd6b90?rik=5KaovDM3YO2oXA&pid=ImgRaw&r=0" alt="RoomView1">
        <img src="https://th.bing.com/th/id/R.814373596376818bdb2f664b91cbd951?rik=ov9q4SSoMI3%2fLQ&pid=ImgRaw&r=0" alt="RoomView2">
        <img src="https://photos.mandarinoriental.com/is/image/MandarinOriental/dmo-The-worlds-most-romantic-hotel-suites-dubai-royal-penthouse-bedroom" alt="RoomView3">
        <img src="https://th.bing.com/th/id/R.b1b6dca39e1f839c2fc6146928a15bb2?rik=LtQ61KhInSDSgw&pid=ImgRaw&r=0" alt="RoomView4">
        <img src="https://cdn.blastness.info/media/558/top/thumbs/full/1600-camera412-03.jpg" alt="RoomView5">
        <img src="https://www.spahotel.co.uk/wp-content/uploads/2024/09/indulgent-room-gallery-5.jpg" alt="RoomView6">
        <img src="https://static.vecteezy.com/system/resources/previews/036/326/412/non_2x/ai-generated-luxury-condo-facing-scenic-ocean-view-and-a-beach-photo.jpg" alt="RoomView7">
        <img src="https://img.freepik.com/premium-photo/japanese-style-house-architecture-sunset-by-sea_150234-2417.jpg" alt="RoomView8">
    </div>

    <div class="about">
        <p>
            Welcome to the Room Gallery of THE DELUXE HOTEL! Discover the perfect room that suits your needs and style. 
            From elegant suites with breathtaking views to cozy single rooms with all the essential amenities, 
            each of our accommodations is designed to provide comfort, luxury, and a sense of home. Explore our gallery 
            to get a glimpse of the exceptional hospitality awaiting you. Whether you're traveling for business or leisure, 
            we ensure a stay that exceeds your expectations.
        </p>
    </div>

    <div class="buttons">
        <a href="Booking.aspx">Book Now</a>
        <a href="Reviews.aspx">Review</a>
        <a href="Home.aspx">Logout</a>
    </div>

    

   <%-- <footer>
        <p>&copy; 2025 THE DELUXE HOTEL. All rights reserved.</p>
    </footer>--%>
</body>
</html>

