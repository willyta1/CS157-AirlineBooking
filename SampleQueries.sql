USE AIRLINERESERVATIONSYSTEM;
set profiling=1;
SELECT * FROM Customer WHERE customer_id > 2;
SELECT * FROM ACCOUNT;
SELECT * FROM Account WHERE email = "johnsmith@gmail.com" AND account_password = "PASSWORD";
SELECT * FROM Account WHERE email = "davidb@gmail.com" AND account_password = "PASSWORD";
SELECT Account.email FROM Account WHERE email = "davidb@gmail.com";
SELECT Account.email FROM Account WHERE email = "bobdole@gmail.com";

SELECT customer_id FROM Account WHERE email = "bobdole@gmail.com";
SELECT customer_id FROM Account WHERE email = "johnsmith@gmail.com";

SELECT * FROM Aircraft WHERE aircraft_id = 20;
SELECT * FROM Aircraft WHERE aircraft_id = 3;

SELECT MAX(baggage_id) AS max_id FROM Baggage;
SELECT * FROM credit_card;

SELECT C.customer_id FROM Customer C WHERE C.birth_date = "2001-01-01" AND C.first_name = "John" AND C.last_name = "Cena" AND C.passport_number = 112 AND C.visa_number = 222;
SELECT C.customer_id FROM Customer C WHERE C.birth_date = "1947-01-08" AND C.first_name = "David" AND C.last_name = "Bowie" AND C.passport_number = 307 AND C.visa_number = 307;

SELECT Customer.visa_number FROM Customer WHERE visa_number = 307;
SELECT Customer.visa_number FROM Customer WHERE visa_number = 112;

SELECT Customer.passport_number FROM Customer WHERE passport_number = 307;
SELECT Customer.passport_number FROM Customer WHERE passport_number = 112;
SELECT F.*, A.airline_name  FROM Flight F, Airline A  WHERE F.airline_id = A.airline_id AND F.departure_location = "Osaka, Japan" 
AND F.arrival_location = "New York, NY" AND F.departure_date = "2025-01-14" AND F.trip_type = "One-Way";

SELECT F.*, A.airline_name  FROM Flight F, Airline A  WHERE F.airline_id = A.airline_id AND F.departure_location = "Madrid, Spain" 
AND F.arrival_location = "Arlington, VA" AND F.departure_date = "2025-04-16" AND F.trip_type = "One-Way";

SELECT F.*, A.airline_name FROM Flight F INNER JOIN Airline A ON F.airline_id = A.airline_id WHERE F.flight_id = 160;
SELECT F.*, A.airline_name FROM Flight F INNER JOIN Airline A ON F.airline_id = A.airline_id WHERE F.flight_id = 135;

SELECT c.first_name, c.last_name, c.birth_date, a.email FROM customer c INNER JOIN account a ON c.customer_id = a.customer_id
WHERE c.customer_id = 50;

SELECT c.first_name, c.last_name, c.birth_date, a.email FROM customer c INNER JOIN account a ON c.customer_id = a.customer_id
WHERE c.customer_id = 25;


SELECT f.flight_id, f.departure_date, f.arrival_date, f.departure_time, f.arrival_time, f.flight_status, t.ticket_id, a.airline_name
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.flight_id
INNER JOIN airline a ON f.airline_id = a.airline_id WHERE t.customer_id = 1 AND TIMESTAMP(f.departure_date, f.departure_time) > NOW();

SELECT f.flight_id, f.departure_date, f.arrival_date, f.departure_time, f.arrival_time, f.flight_status, t.ticket_id, a.airline_name
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.flight_id
INNER JOIN airline a ON f.airline_id = a.airline_id WHERE t.customer_id = 25 AND TIMESTAMP(f.departure_date, f.departure_time) > NOW();

SELECT f.flight_id, f.departure_date, f.arrival_date, f.departure_time, f.arrival_time, f.flight_status, t.ticket_id, a.airline_name
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.flight_id
INNER JOIN airline a ON f.airline_id = a.airline_id WHERE t.customer_id = 45 AND TIMESTAMP(f.departure_date, f.departure_time) > NOW();

SELECT b.baggage_id, bo.flight_id, bo.baggage_status
FROM Baggage b
INNER JOIN BaggageOn bo ON b.baggage_id = bo.baggage_id
INNER JOIN Flight f ON bo.flight_id = f.flight_id
WHERE b.customer_id = 3;

SELECT b.baggage_id, bo.flight_id, bo.baggage_status
FROM Baggage b
INNER JOIN BaggageOn bo ON b.baggage_id = bo.baggage_id
INNER JOIN Flight f ON bo.flight_id = f.flight_id
WHERE b.customer_id = 1;

SELECT b.baggage_id, bo.flight_id, bo.baggage_status
FROM Baggage b
INNER JOIN BaggageOn bo ON b.baggage_id = bo.baggage_id
INNER JOIN Flight f ON bo.flight_id = f.flight_id
WHERE b.customer_id = 50;

SELECT b.baggage_id, bo.flight_id, bo.baggage_status
FROM Baggage b
INNER JOIN BaggageOn bo ON b.baggage_id = bo.baggage_id
INNER JOIN Flight f ON bo.flight_id = f.flight_id
WHERE b.customer_id = 25;

SELECT f.flight_id, f.departure_date, f.arrival_date, f.trip_type, f.flight_trip_type, f.arrival_location, t.ticket_id, a.airline_name
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.flight_id
INNER JOIN airline a ON f.airline_id = a.airline_id
WHERE t.customer_id = 1;

SELECT f.flight_id, f.departure_date, f.arrival_date, f.trip_type, f.flight_trip_type, f.arrival_location, t.ticket_id, a.airline_name
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.flight_id
INNER JOIN airline a ON f.airline_id = a.airline_id
WHERE t.customer_id = 50;

SELECT f.flight_id, f.departure_date, f.arrival_date, f.trip_type, f.flight_trip_type, f.arrival_location, t.ticket_id, a.airline_name
FROM ticket t
INNER JOIN flight f ON t.flight_id = f.flight_id
INNER JOIN airline a ON f.airline_id = a.airline_id
WHERE t.customer_id = 25;

SELECT f.flight_id, t.ticket_id, a.airline_name, f.departure_date, f.arrival_date, f.departure_time, f.arrival_time
FROM Books b
JOIN Flight f ON b.flight_id = f.flight_id
JOIN Ticket t ON b.ticket_id = t.ticket_id
JOIN Airline a ON f.airline_id = a.airline_id
WHERE b.customer_id = 1 AND b.checkin_status = 'No' AND TIMESTAMP(f.departure_date, f.departure_time) > NOW();

SELECT COUNT(*) AS count FROM Seat WHERE seat_number = 1 AND aircraft_id = 20;
SELECT COUNT(*) AS count FROM Seat WHERE seat_number = 16 AND aircraft_id = 12;
SELECT COUNT(*) AS count FROM Seat WHERE seat_number = 1 AND aircraft_id = 2;

SELECT * FROM Ticket WHERE airline_id = 2 AND ticket_id = 21;
SELECT * FROM Ticket WHERE airline_id = 3  AND ticket_id = 44;
SELECT * FROM Ticket WHERE airline_id = 10  AND ticket_id = 47;

SELECT * FROM Ticket WHERE flight_id = 160;
SELECT * FROM Ticket WHERE flight_id = 135;

SELECT MAX(ticket_id) AS max_id FROM Ticket FOR UPDATE;

show profiles;