CREATE DATABASE IF NOT EXISTS medicare_db;
USE medicare_db;

DROP TABLE IF EXISTS Doctor_History;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Doctors;

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    consultation_fee DECIMAL(10,2),
    email VARCHAR(100) UNIQUE,
    CHECK (consultation_fee > 0)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Doctors
(doctor_id, doctor_name, specialization, consultation_fee, email)
VALUES
(201, 'Dr. Neha Kapoor', 'Cardiology', 900.00, 'neha.kapoor@medicare.com'),
(202, 'Dr. Arvind Rao', 'Dermatology', 650.00, 'arvind.rao@medicare.com'),
(203, 'Dr. Kavya Nair', 'Pediatrics', 600.00, 'kavya.nair@medicare.com'),
(204, 'Dr. Rohit Mehta', 'Orthopedics', 750.00, 'rohit.mehta@medicare.com'),
(205, 'Dr. Sneha Iyer', 'Neurology', 1100.00, 'sneha.iyer@medicare.com'),
(206, 'Dr. Varun Sharma', 'Cardiology', 950.00, 'varun.sharma@medicare.com'),
(207, 'Dr. Ananya Reddy', 'Dermatology', 700.00, 'ananya.reddy@medicare.com'),
(208, 'Dr. Kiran Joshi', 'Pediatrics', 550.00, 'kiran.joshi@medicare.com'),
(209, 'Dr. Meera Verma', 'Orthopedics', 800.00, 'meera.verma@medicare.com'),
(210, 'Dr. Aditya Rao', 'Neurology', 1050.00, 'aditya.rao@medicare.com');

SELECT * FROM Doctors;

INSERT INTO Patients
(patient_id, patient_name, email)
VALUES
(301, 'Aarav Singh', 'aarav.singh@patientmail.com'),
(302, 'Diya Patel', 'diya.patel@patientmail.com'),
(303, 'Rohan Kumar', 'rohan.kumar@patientmail.com'),
(304, 'Ishita Menon', 'ishita.menon@patientmail.com'),
(305, 'Kabir Das', 'kabir.das@patientmail.com'),
(306, 'Meera Shah', 'meera.shah@patientmail.com'),
(307, 'Vihaan Reddy', 'vihaan.reddy@patientmail.com'),
(308, 'Ananya Bose', 'ananya.bose@patientmail.com'),
(309, 'Arjun Nair', 'arjun.nair@patientmail.com'),
(310, 'Saanvi Rao', 'saanvi.rao@patientmail.com');

SELECT * FROM Patients;

INSERT INTO Appointments
(appointment_id, doctor_id, patient_id, appointment_date)
VALUES
(4001, 201, 301, '2026-08-20'),
(4002, 202, 302, '2026-08-21'),
(4003, 203, 303, '2026-08-21'),
(4004, 204, 304, '2026-08-22'),
(4005, 205, 305, '2026-08-22'),
(4006, 206, 306, '2026-08-23'),
(4007, 207, 307, '2026-08-23'),
(4008, 208, 308, '2026-08-24'),
(4009, 209, 309, '2026-08-24'),
(4010, 210, 310, '2026-08-25');

SELECT * FROM Appointments;


SELECT
    p.patient_name,
    d.doctor_name,
    d.specialization,
    a.appointment_date
FROM Appointments a
INNER JOIN Doctors d
    ON a.doctor_id = d.doctor_id
INNER JOIN Patients p
    ON a.patient_id = p.patient_id;

SELECT
    specialization,
    COUNT(doctor_id) AS total_doctors
FROM Doctors
GROUP BY specialization
ORDER BY specialization;

CREATE TABLE Doctor_History (
    history_id INT PRIMARY KEY,
    doctor_id INT,
    action_type VARCHAR(50),
    action_date DATE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

START TRANSACTION;

INSERT INTO Doctors
(doctor_id, doctor_name, specialization, consultation_fee, email)
VALUES
(211, 'Dr. Nikhil Rao', 'ENT', 700.00, 'nikhil.rao@medicare.com');

INSERT INTO Doctor_History
(history_id, doctor_id, action_type, action_date)
VALUES
(1, 211, 'NEW DOCTOR REGISTERED', CURDATE());

COMMIT;

SELECT * FROM Doctors
WHERE doctor_id = 211;

SELECT * FROM Doctor_History;

CREATE INDEX idx_specialization
ON Doctors(specialization);

SELECT *
FROM Doctors
WHERE specialization = 'ENT';


SELECT * FROM Doctors;
SELECT * FROM Patients;
SELECT * FROM Appointments;
SELECT * FROM Doctor_History;
