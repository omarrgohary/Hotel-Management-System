# Hotel Management System Web Application

---

## Overview

The Hotel Management System is a web-based application designed to streamline hotel operations by efficiently managing employee roles, room bookings, and customer interactions.
The system provides role-based access control for employees and a seamless booking and review experience for hotel guests.

---

## Technologies Used

* **Frontend:** HTML, CSS
* **Backend:** C#, ASP.NET
* **Database:** SQL, MySQL Workbench

---

## Features

### 1. Home Page

* Serves as the entry point to the application
* Provides an overview of the system and navigation to key sections

---

### 2. Employee Authentication and Role-Based Access

Employees authenticate using secure credentials and are redirected to dashboards based on their assigned roles.

#### Admin Role

* View and manage employee records
* Manage departments and customer reviews
* View and manage booked and available rooms
* Book rooms or cancel reservations on behalf of customers

#### Employee Role

* View customer reviews
* View available rooms

---

### 3. User Registration and Login

* New users can register through the sign-up page
* Existing users can log in using the user login page

---

### 4. Password Reset Functionality

* Users can request a password reset using their registered email address
* If the email exists in the database:

  * A verification token is generated and stored
  * The token remains valid for one hour
  * A password reset link is sent via email

---

### 5. User Dashboard

After successful login:

* Users are redirected to the Room Gallery
* Navigation options include:

  * **Booking Page:** Book available rooms
  * **Review Page:** Submit feedback about their stay

---

## Database Setup

* Import the provided SQL database file into **MySQL Workbench**
* Configure the database connection settings within the application

---

## Running the Application

* Open the project in **Visual Studio**
* Build and run the application

---

## Future Enhancements

* Implement an administrative reporting dashboard
* Improve user interface and overall user experience
* Integrate a payment gateway for online room bookings

---

## License

This project is open-source and licensed under the **MIT License**.

---

## Authors : 
Omar EL Gohary
- **LinkedIn:** [linkedin.com/in/omarelgohary2003](https://www.linkedin.com/in/omarelgohary2003/)
* **Email:** [omarrmgohary@gmail.com](mailto:omarrmgohary@gmail.com)

Youssef Azmy
- **LinkedIn:** [linkedin.com/in/omarelgohary2003](https://www.linkedin.com/in/youssef-azmy/)

-----------------------------------------------------------------------------------------------------------------------
