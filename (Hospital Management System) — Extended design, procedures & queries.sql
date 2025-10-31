-- DB already created earlier; demonstrate extra required queries/procedures for hospital_db
USE hospital_db;

-- Procedure to add appointment
DROP PROCEDURE add_appointment;
DELIMITER $$
CREATE PROCEDURE add_appointment(IN p_doc INT, IN p_pat INT, IN p_date DATE, IN p_bill DECIMAL(10,2))
BEGIN
  INSERT INTO appointments (doctor_id,patient_id,appt_date,bill_amount) VALUES (p_doc,p_pat,p_date,p_bill);
END$$
DELIMITER ;

-- Procedure to update appointment date
DROP PROCEDURE update_appointment_date;
DELIMITER $$
CREATE PROCEDURE update_appointment_date(IN p_appt INT, IN new_date DATE)
BEGIN
  UPDATE appointments SET appt_date = new_date WHERE appt_id = p_appt;
END$$
DELIMITER ;

-- Query: total patients per doctor
SELECT d.name, COUNT(DISTINCT a.patient_id) AS patient_count
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id;

-- Appointments by date
SELECT appt_date, COUNT(*) AS appointments FROM appointments GROUP BY appt_date;
