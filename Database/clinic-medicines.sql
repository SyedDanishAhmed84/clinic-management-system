CREATE TABLE Medicines (
    medicine_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dosage VARCHAR(50),
    duration VARCHAR(100)
);

CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    medicine_id INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);

INSERT INTO Medicines (name,dosage,duration)
VALUES
('Paracetamol','2 tablets per day','5 days'),
('Augmentin','1 tablet after meal','1 week'),
('Panadol','2 tablets in the evening','2 weeks'),
('Ibuprofin','3 tablets after night dinner','4 days'),
('Brufin','2 tablets in the morning','4 days'),
('Amaryl','1 tablet after afternoon dinner','6 days'),
('Ambien','2 tablets after night dinner','4 days'),
('Ciprofloxacin','1 tablet per day','5 days'),
('Cefixime','2 tablets per day','4 days'),
('Tamsulosin','2 tablets per day','3 days');

INSERT INTO Prescriptions (appointment_id, medicine_id)
VALUES
(1, 1),
(2, 2),
(3, 3),  
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

SELECT 
    a.appointment_id,
    CONCAT(u.first_name, ' ', u.last_name) AS patient_name,
    d.name AS doctor_name,
    m.name AS medicine_name,
    m.dosage,
    m.duration
FROM Prescriptions p
JOIN Appointments a ON p.appointment_id=a.appointment_id
JOIN Users u ON a.user_id=u.user_id
JOIN Doctor d ON d.doctor_id=a.doctor_id
JOIN Medicines m ON p.medicine_id=m.medicine_id
ORDER BY a.appointment_id;