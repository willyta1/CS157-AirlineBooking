CREATE DATABASE AirlineReservationSystem;
USE AirlineReservationSystem;

-- Customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    birth_date DATE,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    passport_number VARCHAR(50) UNIQUE,
    visa_number VARCHAR(50) UNIQUE
    
);
-- Account Table
CREATE TABLE Account (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    account_password VARCHAR(50) NOT NULL,
    customer_id int UNIQUE,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Airport Table
CREATE TABLE Airport (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    airport_name VARCHAR(100),
	flight_type VARCHAR(50)
);

-- Airline Table
CREATE TABLE Airline (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    airline_name VARCHAR(100)
);

-- Aircraft Table
CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    model VARCHAR(50),
    capacity INT,
    airline_ID INT,
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Flight Table
-- flight_trip_type should be nonstop or stop
-- trip_type should be one-way or round trip
CREATE TABLE Flight (
    flight_id INT PRIMARY KEY,
    flight_status VARCHAR(50),
    departure_time TIME NOT NULL,
    arrival_time TIME NOT NULL,
    departure_date DATE NOT NULL,
    arrival_date DATE NOT NULL,
    trip_type VARCHAR(50),
    flight_trip_type VARCHAR(50),
    departure_location VARCHAR(50) NOT NULL,
    arrival_location VARCHAR(50) NOT NULL,
    airline_id INT,
    aircraft_id INT,
    cost DECIMAL(10, 2),
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id) ON DELETE NO ACTION ON UPDATE CASCADE
);

-- Baggage Table
CREATE TABLE Baggage (
    baggage_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE NO ACTION ON UPDATE CASCADE
    
);

-- Seat Table
CREATE TABLE Seat (
    seat_number INT,
    aircraft_id INT,
    flight_id INT,
    PRIMARY KEY (seat_number, aircraft_id),
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);
-- Ticket Table
CREATE TABLE Ticket (
    ticket_id INT,
    cost DECIMAL(10, 2),
    flight_class VARCHAR(50),
    customer_id INT,
    airline_id INT,
    seat_number INT,
    aircraft_id INT,
    flight_id INT,
    PRIMARY KEY (airline_id, ticket_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (seat_number, aircraft_id) REFERENCES Seat(seat_number, aircraft_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Credit_Card (
    card_number VARCHAR(20) PRIMARY KEY,
    card_type VARCHAR(20)
);

-- Payment Info Table
CREATE TABLE Payment_Info (
    transaction_id INT,
    airline_id INT,
    card_number VARCHAR(20),
	PRIMARY KEY (transaction_id, airline_id),
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (card_number) REFERENCES Credit_Card(card_number)
);


-- International Flights Table
CREATE TABLE International_Flights (
    flight_id INT PRIMARY KEY,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);
-- Domestic Flights Table
CREATE TABLE Domestic_Flights (
    flight_id INT PRIMARY KEY,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);
-- Relationships
-- Customer Books Ticket
CREATE TABLE Books (
    customer_id INT,
    ticket_id INT,
    airline_id INT,
    flight_id INT,
    checkin_status VARCHAR(10),
    special_requests VARCHAR(100),
    PRIMARY KEY (customer_id, airline_id, ticket_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)  ON DELETE NO ACTION ON UPDATE CASCADE, 
    FOREIGN KEY (airline_id, ticket_id) REFERENCES Ticket(airline_id, ticket_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id) ON DELETE NO ACTION ON UPDATE CASCADE
);
-- Ticket Receives Payment Info
CREATE TABLE Receives (
    ticket_id INT,
    transaction_id INT,
    airline_id INT,
    PRIMARY KEY (ticket_id, airline_id, transaction_id),
    FOREIGN KEY (airline_id, ticket_id) REFERENCES Ticket(airline_id, ticket_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (transaction_id, airline_id) REFERENCES Payment_Info(transaction_id, airline_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);
-- Airline stationed at Airport
CREATE TABLE Stationed (
	airline_id INT,
    airport_id INT,
    PRIMARY KEY (airline_id, airport_id),
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (airport_id) REFERENCES Airport(airport_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE BaggageOn(
	baggage_id INT,
    flight_id INT,
    baggage_status VARCHAR(50),
    PRIMARY KEY(flight_id,baggage_id),
    FOREIGN KEY (baggage_id) REFERENCES Baggage(baggage_id)  ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)  ON DELETE NO ACTION ON UPDATE CASCADE
);

INSERT INTO Customer(birth_date, first_name, last_name, passport_number, visa_number) VALUES ("2001-01-01", "John", "Smith", 112, 222);
INSERT INTO Account(email, account_password, customer_id) VALUES ("johnsmith@gmail.com","PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name, passport_number, visa_number) VALUES ("2001-01-01", "John", "Cena", 122, 232);
INSERT INTO Account(email, account_password, customer_id) VALUES ("johncena@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("2001-02-05", "John", "Tran");
INSERT INTO Account(email, account_password, customer_id) VALUES ("johntran@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("2001-01-09", "Jane", "Doe" );
INSERT INTO Account(email, account_password, customer_id) VALUES ("janedoe2@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("2001-02-05", "Jane", "Doe");
INSERT INTO Account(email, account_password, customer_id) VALUES ("janedoe3@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("1999-03-03", "Jane", "Smith");
INSERT INTO Account(email, account_password, customer_id) VALUES ("janesmith@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("2001-02-05", "Jane", "Doe");
INSERT INTO Account(email, account_password, customer_id) VALUES ("janedoe4@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("1949-09-12", "Elvis", "Presley");
INSERT INTO Account(email, account_password, customer_id) VALUES ("elvispresley@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Customer(birth_date, first_name, last_name) VALUES ("1999-03-03", "Albert", "Einstein");
INSERT INTO Account(email, account_password, customer_id) VALUES ("alberteinstein@gmail.com", "PASSWORD", LAST_INSERT_ID());

INSERT INTO Airport(airport_name, flight_type) VALUES ("JFK Airport", "Both");
INSERT INTO Airport(airport_name, flight_type) VALUES ("SFO Airport", "Both");
INSERT INTO Airport(airport_name, flight_type) VALUES ("Oakland", "Both");
INSERT INTO Airport(airport_name, flight_type) VALUES ("Fake Airport 1", "Domestic");
INSERT INTO Airport(airport_name, flight_type) VALUES ("Fake Airport 2", "International");

INSERT INTO Airline(airline_name) VALUES("Alaska Airlines");
INSERT INTO Airline(airline_name) VALUES("Allegiant Air");
INSERT INTO Airline(airline_name) VALUES("American Airlines");
INSERT INTO Airline(airline_name) VALUES("Avelo Airlines");
INSERT INTO Airline(airline_name) VALUES("Breeze Airways");
INSERT INTO Airline(airline_name) VALUES("Delta Airlines");
INSERT INTO Airline(airline_name) VALUES("Eastern Airlines");
INSERT INTO Airline(airline_name) VALUES("Frontier Airlines");
INSERT INTO Airline(airline_name) VALUES("Hawaiian Airlines");
INSERT INTO Airline(airline_name) VALUES("JetBlue");

INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 787", "80", 1);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 787", "80", 2);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 787", "80", 3);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 737", "80", 4);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 737", "80", 5);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 737", "80", 6);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 737", "80", 7);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Airbus A319", "80", 8);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Airbus A319", "80", 9);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Airbus A319", "80", 10);

INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Airbus A319", "80", 1);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Airbus A319", "80", 2);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 3);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 4);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 5);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 6);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 7);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 8);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 9);
INSERT INTO Aircraft(model, capacity, airline_id) VALUES ("Boeing 747", "80", 10);

INSERT INTO Flight(flight_id, flight_status, departure_time, arrival_time, departure_date, arrival_date, trip_type, flight_trip_type, departure_location, arrival_location, airline_id, aircraft_id, cost)
VALUES (111, "Scheduled", "08:30:00", "12:30:00", "2025-01-05", "2025-01-05", "One-way", "Nonstop", "San Francisco, CA", "Denver, CO", 1, 1, 150);
INSERT INTO Domestic_Flights VALUE (111);
INSERT INTO Flight(flight_id, flight_status, departure_time, arrival_time, departure_date, arrival_date, trip_type, flight_trip_type, departure_location, arrival_location, airline_id, aircraft_id, cost)
VALUES (112, "Scheduled", "08:30:00", "12:30:00", "2025-01-05", "2025-01-05", "One-way", "Stop", "San Francisco, CA", "Denver, CO", 1, 1, 130);
INSERT INTO Domestic_Flights VALUE (112);
INSERT INTO Flight(flight_id, flight_status, departure_time, arrival_time, departure_date, arrival_date, trip_type, flight_trip_type, departure_location, arrival_location, airline_id, aircraft_id, cost)
VALUES (113, "Scheduled", "08:30:00", "12:30:00", "2025-01-05", "2025-01-05", "Round-trip", "Nonstop", "New York, NY", "Denver, CO", 2, 2, 300);
INSERT INTO Domestic_Flights VALUE (113);
INSERT INTO Flight(flight_id, flight_status, departure_time, arrival_time, departure_date, arrival_date, trip_type, flight_trip_type, departure_location, arrival_location, airline_id, aircraft_id, cost)
VALUES (114, "Scheduled", "08:30:00", "22:47:00", "2025-01-05", "2025-01-05", "Round-trip", "Nonstop", "New York, NY", "Osaka, Japan", 2, 2, 1200);
INSERT INTO International_Flights VALUE (114);
INSERT INTO Flight(flight_id, flight_status, departure_time, arrival_time, departure_date, arrival_date, trip_type, flight_trip_type, departure_location, arrival_location, airline_id, aircraft_id, cost)
VALUES (115, "Scheduled", "08:30:00", "12:30:00", "2025-01-14", "2025-01-14", "One-way", "Nonstop", "Denver, CO", "New York, NY", 2, 2, 300);
INSERT INTO Domestic_Flights VALUE (115);
INSERT INTO Flight(flight_id, flight_status, departure_time, arrival_time, departure_date, arrival_date, trip_type, flight_trip_type, departure_location, arrival_location, airline_id, aircraft_id, cost)
VALUES (116, "Scheduled", "08:30:00", "22:47:00", "2025-01-14", "2025-01-14", "One-Way", "Nonstop", "Osaka, Japan", "New York, NY", 2, 2, 1100);
INSERT INTO International_Flights VALUE (116);


INSERT INTO Baggage VALUES(111, 1);
INSERT INTO Baggage VALUES(211, 2);
INSERT INTO Baggage VALUES(222, 3);
INSERT INTO Baggage VALUES(233, 4);

INSERT INTO BaggageOn(baggage_id, flight_id, baggage_status) VALUES (111, 111, "Loaded");
INSERT INTO BaggageOn(baggage_id, flight_id, baggage_status) VALUES (211, 112, "Loaded");
INSERT INTO BaggageOn(baggage_id, flight_id, baggage_status) VALUES (222, 113, "Loaded");
INSERT INTO BaggageOn(baggage_id, flight_id, baggage_status) VALUES (233, 111, "Loaded");

INSERT INTO Seat VALUES(1,1,111);
INSERT INTO Seat VALUES(2,1,111);
INSERT INTO Seat VALUES(3,1,111);
INSERT INTO Seat VALUES(3,2,111);

INSERT INTO Ticket(ticket_id, cost, flight_class, customer_id, airline_id, seat_number, aircraft_id, flight_id) VALUES (1, 899.99, "Economy", 1, 1, 2, 1,111);
INSERT INTO Books(customer_id, ticket_id, airline_id, flight_id, checkin_status, special_requests) VALUES (1,1,1, 111, "No", "Wheelchair");
INSERT INTO Payment_Info(transaction_id, airline_id) VALUES (1,1);
INSERT INTO Credit_card(card_number, card_type) VALUES ("1111222233334444", "VISA");
INSERT INTO Receives(ticket_id, transaction_id, airline_id) VALUES (1, 1, 1);

INSERT INTO Ticket VALUES (2, 899.99, "Economy", 1, 1, 3, 1,111);
INSERT INTO Books(customer_id, ticket_id, airline_id, flight_id, checkin_status, special_requests) VALUES (1,2,1, 111, "No", "Wheelchair");

INSERT INTO Payment_Info(transaction_id, airline_id, card_number) VALUES (2,1, 1111222233334444);
INSERT INTO Receives(ticket_id, transaction_id, airline_id) VALUES (2, 2, 1);

INSERT INTO Ticket VALUES (3, 899.99, "Economy", 2, 2, 3, 1,111);
INSERT INTO Books(customer_id, ticket_id, airline_id, flight_id, checkin_status, special_requests) VALUES (2,3,2, 111, "No", "Wheelchair");
INSERT INTO Payment_Info(transaction_id, airline_id, card_number) VALUES (3,2, 1111222233334444);
INSERT INTO Receives(ticket_id, transaction_id, airline_id) VALUES (3, 3, 2);
