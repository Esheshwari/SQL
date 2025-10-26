CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    city VARCHAR(30)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    fee DECIMAL(10,2)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(50),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- INSERT DATA
INSERT INTO Patients VALUES
(1,'Riya Sen','Female','1999-05-10','Delhi'),
(2,'Amit Verma','Male','1985-12-22','Mumbai'),
(3,'Sneha Iyer','Female','2000-01-14','Chennai');

INSERT INTO Doctors VALUES
(101,'Dr. Sharma','Cardiology',1000.00),
(102,'Dr. Mehta','Orthopedics',800.00),
(103,'Dr. Nair','Dermatology',600.00);

INSERT INTO Appointments VALUES
(1,1,101,'2025-01-10','Checkup'),
(2,2,103,'2025-01-12','Allergy'),
(3,3,102,'2025-01-15','Fracture');

-- AGGREGATE: Total patients per doctor
SELECT d.doctor_name, COUNT(a.patient_id) AS Total_Patients
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name;

-- JOIN: Patient with doctor details
SELECT p.patient_name, d.doctor_name, a.diagnosis
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- PROCEDURES
DELIMITER //
CREATE PROCEDURE InsertAppointment(IN aid INT, IN pid INT, IN did INT, IN adate DATE, IN diag VARCHAR(50))
BEGIN
    INSERT INTO Appointments VALUES (aid, pid, did, adate, diag);
END //
DELIMITER ;

CALL InsertAppointment(4,1,102,'2025-02-01','Follow-up');

DELIMITER //
CREATE PROCEDURE UpdateAppointmentDate(IN aid INT, IN new_date DATE)
BEGIN
    UPDATE Appointments SET appointment_date=new_date WHERE appointment_id=aid;
END //
DELIMITER ;

CALL UpdateAppointmentDate(2,'2025-02-10');
