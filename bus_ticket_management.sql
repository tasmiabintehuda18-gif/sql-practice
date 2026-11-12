-- Step 1: Drop old database if exists
DROP DATABASE IF EXISTS bus_ticket;

-- Step 2: Create new database
CREATE DATABASE bus_ticket;

-- Step 3: Use the database
USE bus_ticket;

-- Step 4: Create tables

-- 1. Passengers Table
CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    address VARCHAR(200)
);

-- 2. Buses Table
CREATE TABLE buses (
    bus_id INT AUTO_INCREMENT PRIMARY KEY,
    bus_name VARCHAR(100) NOT NULL,
    source VARCHAR(100),
    destination VARCHAR(100),
    departure_time TIME,
    arrival_time TIME,
    total_seats INT
);

-- 3. Drivers Table
CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_name VARCHAR(100),
    phone VARCHAR(20),
    license_no VARCHAR(50),
    experience_years INT
);

-- 4. Routes Table
CREATE TABLE routes (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    source VARCHAR(100),
    destination VARCHAR(100),
    distance_km DECIMAL(6,2),
    approx_time VARCHAR(50)
);

-- 5. Tickets Table
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    bus_id INT,
    driver_id INT,
    route_id INT,
    seat_no INT,
    fare DECIMAL(10,2),
    booking_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (bus_id) REFERENCES buses(bus_id),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id),
    FOREIGN KEY (route_id) REFERENCES routes(route_id)
);

-- Step 5: Insert data into passengers table
INSERT INTO passengers (full_name, gender, phone, email, address) VALUES
('Rafi Ahmed', 'Male', '01710000001', 'rafi@gmail.com', 'Dhaka'),
('Tasmiah Binte Huda', 'Female', '01710000002', 'tasmiah@gmail.com', 'Chittagong'),
('Nusrat Jahan', 'Female', '01710000003', 'nusrat@gmail.com', 'Rajshahi'),
('Abir Hasan', 'Male', '01710000004', 'abir@gmail.com', 'Khulna'),
('Samiul Islam', 'Male', '01710000005', 'samiul@gmail.com', 'Sylhet'),
('Tanvir Khan', 'Male', '01710000006', 'tanvir@gmail.com', 'Dhaka'),
('Sadia Rahman', 'Female', '01710000007', 'sadia@gmail.com', 'Barisal'),
('Riad Chowdhury', 'Male', '01710000008', 'riad@gmail.com', 'Comilla'),
('Rashida Akter', 'Female', '01710000009', 'rashida@gmail.com', 'Rangpur'),
('Sabbir Hossain', 'Male', '01710000010', 'sabbir@gmail.com', 'Dhaka');

-- Step 6: Insert data into buses table
INSERT INTO buses (bus_name, source, destination, departure_time, arrival_time, total_seats) VALUES
('Green Line', 'Dhaka', 'Chittagong', '07:00:00', '13:00:00', 40),
('Ena Transport', 'Dhaka', 'Sylhet', '08:30:00', '14:00:00', 45),
('Hanif Paribahan', 'Dhaka', 'Khulna', '06:00:00', '12:00:00', 50),
('Shohagh', 'Dhaka', 'Barisal', '09:00:00', '15:00:00', 35),
('Soudia', 'Dhaka', 'Rajshahi', '10:00:00', '16:00:00', 40);

-- Step 7: Insert data into drivers table
INSERT INTO drivers (driver_name, phone, license_no, experience_years) VALUES
('Arman Hossain', '01720000011', 'LIC1234', 8),
('Babul Khan', '01720000012', 'LIC2234', 6),
('Shafiqul Islam', '01720000013', 'LIC3234', 10),
('Monirul Alam', '01720000014', 'LIC4234', 5),
('Nasir Uddin', '01720000015', 'LIC5234', 7);

-- Step 8: Insert data into routes table
INSERT INTO routes (source, destination, distance_km, approx_time) VALUES
('Dhaka', 'Chittagong', 250.50, '6 hours'),
('Dhaka', 'Sylhet', 220.75, '5 hours'),
('Dhaka', 'Khulna', 300.00, '7 hours'),
('Dhaka', 'Barisal', 280.60, '6.5 hours'),
('Dhaka', 'Rajshahi', 260.80, '6 hours');

-- Step 9: Insert data into tickets table
INSERT INTO tickets (passenger_id, bus_id, driver_id, route_id, seat_no, fare, booking_date) VALUES
(1, 1, 1, 1, 5, 800.00, '2025-10-01'),
(2, 1, 1, 1, 6, 800.00, '2025-10-01'),
(3, 2, 2, 2, 10, 700.00, '2025-10-02'),
(4, 3, 3, 3, 15, 900.00, '2025-10-03'),
(5, 4, 4, 4, 20, 750.00, '2025-10-04'),
(6, 2, 2, 2, 12, 700.00, '2025-10-05'),
(7, 5, 5, 5, 8, 650.00, '2025-10-05'),
(8, 3, 3, 3, 14, 900.00, '2025-10-06'),
(9, 1, 1, 1, 9, 800.00, '2025-10-07'),
(10, 4, 4, 4, 21, 750.00, '2025-10-08');

-- Step 10: Update example
UPDATE passengers
SET phone = '01710000999', address = 'Gazipur'
WHERE passenger_id = 1;

-- Step 11: Show queries (view all)
SELECT * FROM passengers;
SELECT * FROM buses;
SELECT * FROM drivers;
SELECT * FROM routes;
SELECT * FROM tickets;

-- Step 12: Show specific data
SELECT full_name, phone FROM passengers WHERE passenger_id = 3;
SELECT passenger_id, seat_no, fare FROM tickets WHERE bus_id = 1;

-- Step 13: Delete examples
DELETE FROM passengers WHERE passenger_id = 9;        -- single delete
DELETE FROM tickets WHERE booking_date < '2025-10-05'; -- multiple delete
-- Step 14: Show final data
SELECT * FROM passengers;
SELECT * FROM tickets;
USE bus_ticket;

SHOW TABLES;