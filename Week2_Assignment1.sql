CREATE DATABASE IF NOT EXISTS skytrack_db;
USE skytrack_db;

DROP TABLE IF EXISTS Flight_History;
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Flights;

CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(20) UNIQUE,
    source VARCHAR(50),
    destination VARCHAR(50),
    departure_date DATE,
    ticket_price DECIMAL(10,2),
    CHECK (ticket_price > 0)
);


CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    flight_id INT,
    booking_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Flights
(flight_id, flight_number, source, destination, departure_date, ticket_price)
VALUES
(1, 'SK101', 'Hyderabad', 'Delhi', '2026-08-20', 5200.00),
(2, 'SK102', 'Mumbai', 'Bengaluru', '2026-08-21', 4100.00),
(3, 'SK103', 'Chennai', 'Hyderabad', '2026-08-22', 3600.00),
(4, 'SK104', 'Delhi', 'Kolkata', '2026-08-23', 5800.00),
(5, 'SK105', 'Pune', 'Mumbai', '2026-08-24', 2800.00),
(6, 'SK106', 'Bengaluru', 'Goa', '2026-08-25', 3300.00),
(7, 'SK107', 'Hyderabad', 'Pune', '2026-08-26', 3900.00),
(8, 'SK108', 'Kolkata', 'Delhi', '2026-08-27', 6100.00),
(9, 'SK109', 'Mumbai', 'Chennai', '2026-08-28', 4700.00),
(10, 'SK110', 'Delhi', 'Hyderabad', '2026-08-29', 5400.00);

SELECT * FROM Flights;

INSERT INTO Passengers
(passenger_id, passenger_name, email)
VALUES
(101, 'Aarav Mehta', 'aarav.mehta@skytrack.com'),
(102, 'Diya Sharma', 'diya.sharma@skytrack.com'),
(103, 'Rohan Verma', 'rohan.verma@skytrack.com'),
(104, 'Anika Rao', 'anika.rao@skytrack.com'),
(105, 'Kabir Nair', 'kabir.nair@skytrack.com'),
(106, 'Ishita Reddy', 'ishita.reddy@skytrack.com'),
(107, 'Vihaan Kapoor', 'vihaan.kapoor@skytrack.com'),
(108, 'Meera Iyer', 'meera.iyer@skytrack.com'),
(109, 'Arjun Malhotra', 'arjun.malhotra@skytrack.com'),
(110, 'Saanvi Joshi', 'saanvi.joshi@skytrack.com');

SELECT * FROM Passengers;

INSERT INTO Bookings
(booking_id, passenger_id, flight_id, booking_date)
VALUES
(1001, 101, 1, '2026-08-10'),
(1002, 102, 2, '2026-08-11'),
(1003, 103, 3, '2026-08-11'),
(1004, 104, 4, '2026-08-12'),
(1005, 105, 5, '2026-08-12'),
(1006, 106, 6, '2026-08-13'),
(1007, 107, 7, '2026-08-13'),
(1008, 108, 8, '2026-08-14'),
(1009, 109, 9, '2026-08-14'),
(1010, 110, 10, '2026-08-15');

SELECT * FROM Bookings;

SELECT
    p.passenger_name,
    f.flight_number,
    f.source,
    f.destination
FROM Bookings b
INNER JOIN Passengers p
    ON b.passenger_id = p.passenger_id
INNER JOIN Flights f
    ON b.flight_id = f.flight_id;

SELECT
    destination,
    COUNT(flight_id) AS total_flights
FROM Flights
GROUP BY destination
ORDER BY destination;

CREATE TABLE Flight_History (
    history_id INT PRIMARY KEY,
    flight_id INT,
    action_type VARCHAR(50),
    action_date DATE,
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

START TRANSACTION;

INSERT INTO Flights
(flight_id, flight_number, source, destination, departure_date, ticket_price)
VALUES
(11, 'SK111', 'Hyderabad', 'Jaipur', '2026-09-01', 4950.00);

INSERT INTO Flight_History
(history_id, flight_id, action_type, action_date)
VALUES
(1, 11, 'NEW FLIGHT ADDED', CURDATE());

COMMIT;

SELECT * FROM Flights
WHERE flight_id = 11;

SELECT * FROM Flight_History;

CREATE INDEX idx_flight_number
ON Flights(flight_number);


SELECT *
FROM Flights
WHERE flight_number = 'SK111';


SELECT * FROM Flights;
SELECT * FROM Passengers;
SELECT * FROM Bookings;
SELECT * FROM Flight_History;
