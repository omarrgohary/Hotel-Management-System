Hotel Management System Web Application 
-----------------------------------------------------------------------------------------------------------------------

Overview : 
The Hotel Management System is a web application designed to streamline hotel operations by providing efficient management of employee roles, room bookings, and customer interactions. The system allows employees to access relevant functionalities based on their roles and provides users with a seamless experience for booking rooms and submitting reviews.

-----------------------------------------------------------------------------------------------------------------------

Technologies :
UsedFrontend: HTML, CSS
Backend: C#, ASP.NET
Database: SQL, MySQL Workbench

-----------------------------------------------------------------------------------------------------------------------

Features
1. Home PageServes as the entry point to the application, providing an overview and navigation to different sections.
2. Employee LoginEmployees can log in with their credentials and access different dashboards based on their roles:
  Admin Role :
    View and manage all employee data in the database.
    Manage departments and reviews.
    View and manage booked and available rooms.
    Cancel bookings or book rooms for customers.
  Employee Role :
    View customer reviews.
    View available rooms.
-----------------------------------------------------------------------------------------------------------------------
   
3. User Login & Sign-Up :
    New users can register using the SignUp page.
    Existing users can log in with their credentials through the UserLogin page.
 -----------------------------------------------------------------------------------------------------------------------
    
4. Password Reset :
  Users can reset their password by entering their registered email in the forgotpass page.
  If the email exists in the database:
    A verification token is generated and stored in the database, valid for one hour.
    An email with a password reset link is sent to the user.
-----------------------------------------------------------------------------------------------------------------------

5. User Dashboard After login :
  The user is redirected to the Room Gallery.
  Users can navigate to:
    Booking Page: To book a room.
    Review Page: To submit a review about their stay.


-----------------------------------------------------------------------------------------------------------------------

Setup the Database:
  Import the provided SQL database file into MySQL Workbench.
  Configure the database connection settings in the application.

-----------------------------------------------------------------------------------------------------------------------

Run the Application:
  Open the project in Visual Studio.
  Build and run the application.

-----------------------------------------------------------------------------------------------------------------------

Future Enhancements :
  Implement a reporting dashboard for admins.
  Enhance user experience with an improved UI/UX.
  Integrate payment gateway for room bookings.

-----------------------------------------------------------------------------------------------------------------------

License :
  This project is open-source and available under the MIT License.

-----------------------------------------------------------------------------------------------------------------------

ContactFor any inquiries or contributions :
  please contact Omar El Gohary at omarrmgohary@gmail.com .

-----------------------------------------------------------------------------------------------------------------------
