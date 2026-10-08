# CS157AirlineBooking

  Presentation Slides: https://docs.google.com/presentation/d/1KP2xjKcG9aU14-yY6W4IKUbwKJZ5RXg7_oFSmQGiwR0/edit?usp=sharing
  
  Final Report: https://docs.google.com/document/d/1O9VKc7QhMhoUjUUT8QpSxxM-9soXSgh1fPDN5e8RuHw/edit?usp=sharing

# Division of Work

Ryuji:

  Assisted with double checking Normalization
  
  Made Checkout.fxml and Home.fxml, Made Profile and ProfileDAO

  Worked on ProfileController.java

  Populated Personal Information and Booked Flights, Baggage Status, & Flight History Tables

  Made minor adjustments to CustomerDAO and LoginController

Alejandro:

  Normalized relations
  
  Implemented flight search functionality in controller and FlightDAO
  
  Designed and populated search results in for both oneway and roundtrip flights
  
  Populated summary page with selected flights and set up seat/baggage selection
  
  Populate reservation table and implemented checkin functionality in profile reservation tab

Dong: 
  
  Desgined the UI Figma and connected their relationship.
  
  Created the Database table.
  
  Created, connected, and organized the User Interface application and files.

  Worked on project report, project presentation.

Guneet:

  Setup all base folders and files for JavaFX project for the team. 

  Worked on ER diagram, Challenges section of the presentation, and Project Final Report.

  Created and/or Implemented the following files: Main.java, DB.Util.java, Baggage.java, BaggageDAO.jva, Books.java, BooksDAO.java, Profile.java, ProfileDAO.java, Seat.java, SeatDAO.java, TicketDAO.java.

  User Interface Work: BookingForm.fxml, ReservedFlights.fxml, ThankYou.fxml

  Controllers: Implemented functionality & logic in BookingFormController.java, ReservedFlightsController.java, ThankYouController.java

  Delivered Functionality: Connected some UI pages. Added code and queries to populate the Baggage, Seats, Tickets, and Books tables and display this information in other pages such 
  as user profile. Added restrictions to ensure users can only select open seats on a flight. Made changes to code to improve UI experience (button redirection, naming, etc.) and
  fixed minor bugs.

Willy: 

Updated Airline.sql DB file with normalization and inserted data.

Updated ER Diagram for changes.

Made Login.fxml and Signup.FXML, Made Account, AccountDAO, Insert.sql

Worked on LoginController, Signup Controller, CustomerDAO.

Worked on measuring query performance, project presentation, project report and recorded demo.

# Instructions for Running:
Ensure you have JavaFX 23 and Java SDK 21 or later, and MySQL Connector/J 9.1.0

Clone to Eclipse

Right click on project folder: Select properties

Select Java Build Path: 

Select Libraries 

Select Classpath 

Click Add External Jars

Add Javajfx.base.jar, javafx.controls.jar, javafx.fxml.jar, javafx.graphics.jar, javafx.media.jar, javafx.swing.jar, javafx.web.jar, javafx-swt.jar, to classpath

Select Add Jar: Look for lib folder of probject and select my-sql-connector-j-9.1.0.jar. Paths should be set up.

Click Run at the top of screen: Select Run Configurations

Make sure main class is src.Main

Click on arguments tab: add vmargs: replace quotes of module path with javafx lib folder path

"--module-path "Your/Path/To/JavaFX/lib" --add-modules javafx.controls,javafx.graphics,javafx.fxml"

Go to the DBUtil file under src.Util package: Change the database name, user, and password to match your MySQL information

In MySQL: Run Airline.sql file, and then run Insert.sql

Run Main.java file to run desktop application
