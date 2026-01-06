Create database car;
use car;
-- ==============================
-- Customers Table
-- ==============================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(200)
);
desc Customers;

-- ==============================
-- Cars Table
-- ==============================
CREATE TABLE Cars (
    car_id INT PRIMARY KEY AUTO_INCREMENT,
    model VARCHAR(50),
    brand VARCHAR(50),
    year INT,
    daily_rate DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'Available',
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  -- link to Customers
);
desc Cars;
-- ==============================
-- Rentals Table
-- ==============================
CREATE TABLE Rentals (
    rental_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    car_id INT,
    rental_date DATE,
    return_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);
desc Rentals;

-- ==============================
-- Payments Table
-- ==============================
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    rental_id INT,
    customer_id INT,
    car_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (car_id) REFERENCES Cars(car_id)
);
desc Payments;

CREATE TABLE Insurance (
    insurance_id INT PRIMARY KEY AUTO_INCREMENT,
    car_id INT,
    customer_id INT,
    rental_id INT,
    insurance_company VARCHAR(100),
    policy_number VARCHAR(50) UNIQUE,
    coverage_details TEXT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (car_id) REFERENCES Cars(car_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);
desc Insurance;


INSERT INTO Customers (customer_id, first_name, last_name, email, phone, address) VALUES
(1, 'Ramesh', 'Patil', 'ramesh@gmail.com', '9876543210', 'Pune'),
(2, 'Sneha', 'Deshmukh', 'sneha@gmail.com', '9876501234', 'Mumbai'),
(3, 'Aarav', 'Kulkarni', 'aarav@gmail.com', '9867009876', 'Nashik'),
(4, 'Priya', 'Shinde', 'priya@gmail.com', '9823456789', 'Nagpur'),
(5, 'Rahul', 'Jadhav', 'rahul@gmail.com', '9812345678', 'Aurangabad'),
(6, 'Meera', 'Joshi', 'meera@gmail.com', '9834567890', 'Solapur'),
(7, 'Karan', 'More', 'karan@gmail.com', '9845678901', 'Satara'),
(8, 'Anjali', 'Kale', 'anjali@gmail.com', '9856789012', 'Kolhapur'),
(9, 'Sagar', 'Lokhande', 'sagar@gmail.com', '9867890123', 'Amravati'),
(10, 'Neha', 'Sawant', 'neha@gmail.com', '9878901234', 'Thane'),
(11, 'Vikram', 'Chavan', 'vikram@gmail.com', '9889012345', 'Latur'),
(12, 'Pooja', 'Gore', 'pooja@gmail.com', '9890123456', 'Nanded'),
(13, 'Omkar', 'Mali', 'omkar@gmail.com', '9901234567', 'Beed'),
(14, 'Shruti', 'Bhosale', 'shruti@gmail.com', '9912345678', 'Jalgaon'),
(15, 'Akash', 'Pawar', 'akash@gmail.com', '9923456789', 'Dhule');

select*from Customers;



INSERT INTO Cars (car_id, model, brand, year, daily_rate, status, customer_id) VALUES
(1, 'Swift', 'Maruti', 2021, 1200.00, 'Available', NULL),
(2, 'Creta', 'Hyundai', 2022, 2500.00, 'Rented', 1),
(3, 'Fortuner', 'Toyota', 2023, 4000.00, 'Available', NULL),
(4, 'i20', 'Hyundai', 2020, 1500.00, 'Rented', 2),
(5, 'Ertiga', 'Maruti', 2021, 2000.00, 'Available', NULL),
(6, 'Baleno', 'Maruti', 2022, 1600.00, 'Rented', 3),
(7, 'XUV500', 'Mahindra', 2021, 3000.00, 'Available', NULL),
(8, 'Verna', 'Hyundai', 2019, 1800.00, 'Rented', 4),
(9, 'Ciaz', 'Maruti', 2020, 1700.00, 'Available', NULL),
(10, 'Innova', 'Toyota', 2021, 3500.00, 'Rented', 5),
(11, 'Seltos', 'Kia', 2022, 2800.00, 'Available', NULL),
(12, 'Altroz', 'Tata', 2020, 1400.00, 'Rented', 6),
(13, 'Thar', 'Mahindra', 2023, 3200.00, 'Available', NULL),
(14, 'City', 'Honda', 2021, 2200.00, 'Rented', 7),
(15, 'Venue', 'Hyundai', 2022, 2100.00, 'Available', NULL);
 
 SELECT*FRom Cars;
 
 INSERT INTO Rentals (rental_id, customer_id, car_id, rental_date, return_date, total_amount) VALUES
(1, 1, 2, '2025-09-01', '2025-09-05', 10000.00),
(2, 2, 4, '2025-09-03', '2025-09-04', 1500.00),
(3, 3, 6, '2025-09-06', '2025-09-08', 3200.00),
(4, 4, 8, '2025-09-10', '2025-09-12', 3600.00),
(5, 5, 10, '2025-09-12', '2025-09-14', 7000.00),
(6, 6, 12, '2025-09-15', '2025-09-16', 1400.00),
(7, 7, 14, '2025-09-17', '2025-09-19', 4400.00),
(8, 8, 2, '2025-09-20', '2025-09-22', 5000.00),
(9, 9, 4, '2025-09-23', '2025-09-24', 1500.00),
(10, 10, 6, '2025-09-25', '2025-09-27', 3200.00),
(11, 11, 8, '2025-09-28', '2025-09-29', 1800.00),
(12, 12, 10, '2025-09-30', '2025-10-02', 7000.00),
(13, 13, 12, '2025-10-03', '2025-10-04', 1400.00),
(14, 14, 14, '2025-10-05', '2025-10-07', 4400.00),
(15, 15, 2, '2025-10-08', '2025-10-10', 5000.00);

select*from Rentals;

INSERT INTO Payments (payment_id, rental_id, customer_id, car_id, payment_date, amount, payment_method) VALUES
(1, 1, 1, 2, '2025-09-01', 5000.00, 'UPI'),
(2, 1, 1, 2, '2025-09-05', 5000.00, 'Cash'),
(3, 2, 2, 4, '2025-09-03', 1500.00, 'Card'),
(4, 3, 3, 6, '2025-09-06', 1600.00, 'UPI'),
(5, 3, 3, 6, '2025-09-08', 1600.00, 'Cash'),
(6, 4, 4, 8, '2025-09-10', 1800.00, 'Card'),
(7, 4, 4, 8, '2025-09-12', 1800.00, 'UPI'),
(8, 5, 5, 10, '2025-09-12', 3500.00, 'Cash'),
(9, 5, 5, 10, '2025-09-14', 3500.00, 'UPI'),
(10, 6, 6, 12, '2025-09-15', 1400.00, 'Card'),
(11, 7, 7, 14, '2025-09-17', 2200.00, 'UPI'),
(12, 7, 7, 14, '2025-09-19', 2200.00, 'Cash'),
(13, 8, 8, 2, '2025-09-20', 2500.00, 'Card'),
(14, 8, 8, 2, '2025-09-22', 2500.00, 'UPI'),
(15, 9, 9, 4, '2025-09-23', 1500.00, 'Cash');

select * from Rentals;

INSERT INTO Insurance (insurance_id, car_id, customer_id, rental_id, insurance_company, policy_number, coverage_details, start_date, end_date) VALUES
(1, 2, 1, 1, 'ICICI Lombard', 'POL12345', 'Full coverage', '2025-09-01', '2026-09-01'),
(2, 4, 2, 2, 'HDFC Ergo', 'POL67890', 'Third-party coverage', '2025-09-03', '2026-09-03'),
(3, 6, 3, 3, 'Tata AIG', 'POL11111', 'Full coverage', '2025-09-06', '2026-09-06'),
(4, 8, 4, 4, 'Reliance General', 'POL22222', 'Comprehensive coverage', '2025-09-10', '2026-09-10'),
(5, 10, 5, 5, 'Bajaj Allianz', 'POL33333', 'Third-party coverage', '2025-09-12', '2026-09-12'),
(6, 12, 6, 6, 'ICICI Lombard', 'POL44444', 'Full coverage', '2025-09-15', '2026-09-15'),
(7, 14, 7, 7, 'HDFC Ergo', 'POL55555', 'Third-party coverage', '2025-09-17', '2026-09-17'),
(8, 2, 8, 8, 'Tata AIG', 'POL66666', 'Full coverage', '2025-09-20', '2026-09-20'),
(9, 4, 9, 9, 'Reliance General', 'POL77777', 'Third-party coverage', '2025-09-23', '2026-09-23'),
(10, 6, 10, 10, 'Bajaj Allianz', 'POL88888', 'Comprehensive coverage', '2025-09-25', '2026-09-25'),
(11, 8, 11, 11, 'ICICI Lombard', 'POL99999', 'Full coverage', '2025-09-28', '2026-09-28'),
(12, 10, 12, 12, 'HDFC Ergo', 'POL11223', 'Third-party coverage', '2025-09-30', '2026-09-30'),
(13, 12, 13, 13, 'Tata AIG', 'POL44556', 'Full coverage', '2025-10-03', '2026-10-03'),
(14, 14, 14, 14, 'Reliance General', 'POL77889', 'Comprehensive coverage', '2025-10-05', '2026-10-05'),
(15, 2, 15, 15, 'Bajaj Allianz', 'POL99001', 'Third-party coverage', '2025-10-08', '2026-10-08');

select * from Insurance;

SELECT model, brand, daily_rate
FROM Cars
WHERE daily_rate > (SELECT daily_rate FROM Cars WHERE car_id = 2);

SELECT rental_id, customer_id, total_amount
FROM Rentals
WHERE total_amount > (SELECT total_amount FROM Rentals WHERE rental_id = 3);

SELECT rental_id, customer_id, car_id, total_amount
FROM Rentals
WHERE total_amount > (SELECT AVG(total_amount) FROM Rentals);

SELECT model, brand, daily_rate
FROM Cars
WHERE daily_rate < (
    SELECT AVG(daily_rate)
    FROM Cars
    WHERE brand = 'Hyundai'
);

SELECT first_name, last_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Rentals
    WHERE rental_date > '2025-09-10'
);


SELECT car.car_id, car.model, car.brand, r.rental_id
FROM Cars car
LEFT JOIN Rentals r ON car.car_id = r.car_id;


-- JOINS

SELECT car.model, car.brand, i.insurance_id, i.start_date, i.end_date
FROM Cars car
INNER JOIN Insurance i ON car.car_id = i.car_id;

SELECT r.rental_id, r.total_amount, c.first_name, c.last_name
FROM Customers c
RIGHT JOIN Rentals r ON c.customer_id = r.customer_id;

SELECT car.car_id, car.model, r.rental_id, r.total_amount
FROM Rentals r
RIGHT JOIN Cars car ON r.car_id = car.car_id;


SELECT c.first_name, c.last_name, r.rental_id
FROM Customers c
CROSS JOIN Rentals r;

SELECT c.customer_id, c.first_name, p.payment_id, p.amount
FROM Customers c
CROSS JOIN Payments p;


SELECT car.car_id, car.model, i.insurance_id
FROM Cars car
LEFT JOIN Insurance i ON car.car_id = i.car_id
WHERE i.insurance_id IS NULL;


SELECT payment_id, amount, payment_method 
FROM Payments WHERE payment_method = 'Cash'
UNION
SELECT payment_id, amount, payment_method 
FROM Payments WHERE payment_method = 'Credit Card';

CREATE VIEW High_Value_Rentals AS
SELECT rental_id, customer_id, car_id, total_amount
FROM Rentals
WHERE total_amount > 5000;

SELECT * FROM High_Value_Rentals;


use t348;
SHOW VARIABLES LIKE 'lower_case_table_names';
use car;
select*from payments;