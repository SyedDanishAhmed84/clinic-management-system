CREATE DATABASE Clinic;

USE Clinic;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    specialization VARCHAR(100),
    available_days VARCHAR(50),
    available_time VARCHAR(100)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(50) DEFAULT 'Scheduled',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

INSERT INTO Users(first_name,last_name,email,password)
VALUES
('Syed Danish','Ahmed','daniahmed755@gmail.com','13579'),
('Shahzaib Khan','Niazi','shahzaibkn@gmail.com','12345'),
('Muhammad Sameer','Rafiq','sameerrafiq2@gmail.com','sameer12'),
('Sabeeh','Farooq','sabeeh47@gmail.com','123456'),
('Hasnain','Ahmed','hasnain13@gmail.com','23456'),
('Qasim','Khan','qasim@gmail.com','112233'),
('Ayaz','Khan','ayaz13@gmail.com','24589'),
('Hadi','Haider','hadihaider@gmail.com','123432'),
('Hareem','Noor','hareem@gmail.com','121212'),
('Nimra','Tariq','nimra@gmail.com','223123');

INSERT INTO Doctor (name,specialization,available_days,available_time)
VALUES
('Dr Ruqayya','Orthopedician','Mon-Thurs','12:00 PM - 5:00 PM'),
('Dr Ayesha','Theumatologist','Wed-Thurs','7:00 PM - 9:00 PM'),
('Dr Fahad','Dentist','Fri-Sun','11:00 AM - 3:00 PM'),
('Dr Hassaan','Physiologist','Mon-Tues','10:00 AM - 2:00 PM'),
('Dr Amna','Cardiologist','Fri','6:00 PM - 10:00 PM'),
('Dr Ali','Nephrologist','Tues-Thurs','1:00 PM - 5:00 PM'),
('Dr Masroor','Psychiatrist','Sun','1:00 PM - 6:00 PM'),
('Dr Areeba','Physiologist','Mon-Wed','2:00 PM - 7:00 PM'),
('Dr Arifa','Botanist','Tues-Thurs','7:00 PM - 10:00 PM'),
('Dr Aqeel','Surgeon','Tues-Fri','8:00 PM - 11:00 PM');

INSERT INTO Appointments (user_id,doctor_id,appointment_date,appointment_time)
VALUES
(1,1,'2025-10-09','19:30:00'),
(10,4,'2024-12-10','12:00:00'),
(9,3,'2024-11-02','13:00:00'),
(5,2,'2024-06-17','20:00:00'),
(7,10,'2024-05-05','19:00:00'),
(6,7,'2024-01-01','15:00:00'),
(4,5,'2024-02-27','18:00:00'),
(2,6,'2025-07-20','14:00:00'),
(3,8,'2025-09-06','16:00:00'),
(8,9,'2025-10-15','19:00:00');

SELECT
    a.appointment_id,
    CONCAT(u.first_name,' ',u.last_name) AS patient_name,
    u.email,
    a.appointment_date,
    a.appointment_time,
    d.name AS doctor_name
FROM Appointments a
JOIN Users u ON a.user_id=u.user_id
JOIN Doctor d ON a.doctor_id=d.doctor_id
ORDER BY a.appointment_id ASC;