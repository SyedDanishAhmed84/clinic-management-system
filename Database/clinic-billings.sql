CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_status ENUM('Paid','Unpaid'),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Billing (appointment_id,amount,payment_date,payment_status)
VALUES
(1,1500.00,'2025-10-09','Paid'),
(2,2000.00,'2024-12-10','Paid'),
(3,2500.00,'2024-11-02','Paid'),
(4,1500.00,'2024-06-17','Unpaid'),
(5,3000.00,'2024-05-05','Unpaid'),
(6,3000.00,'2024-01-01','Paid'),
(7,2000.00,'2024-02-27','Unpaid'),
(8,1500.00,'2025-07-20','Unpaid'),
(9,1000.00,'2025-09-06','Unpaid'),
(10,2000.00,'2025-10-15','Paid');

SELECT * FROM Billing;