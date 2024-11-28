-- Create the database
CREATE DATABASE IF NOT EXISTS jcf_system;
USE jcf_system;

-- Create the 'users' table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'admin') DEFAULT 'student',
    full_name VARCHAR(100),
    student_number VARCHAR(20)
);

-- Create the 'fees' table
CREATE TABLE IF NOT EXISTS fees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fee_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    semester VARCHAR(20),
    year_level INT
);

-- Create the 'transactions' table
CREATE TABLE IF NOT EXISTS transactions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    fee_id INT,
    amount DECIMAL(10, 2),
    status ENUM('paid', 'unpaid') DEFAULT 'unpaid',
    reference_no VARCHAR(50) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (fee_id) REFERENCES fees(id)
);

-- Insert sample data into the 'users' table
INSERT INTO users (username, password, role, full_name, student_number)
VALUES
('admin@psu.palawan.edu.ph', '$2y$10$hash12345', 'admin', 'Admin User', NULL), 
('juandelacruz@psu.palawan.edu.ph', '$2y$10$hash67890', 'student', 'Juan Dela Cruz', '2024-02-0016');

-- Insert sample data into the 'fees' table
INSERT INTO fees (fee_name, amount, semester, year_level)
VALUES
('CSG Fee', 150.00, '2024-2025 1st Sem', 1),
('USG Fee', 120.00, '2024-2025 1st Sem', 1),
('Maintenance/Utilities Fee', 100.00, '2024-2025 1st Sem', NULL);

-- Insert sample data into the 'transactions' table
INSERT INTO transactions (user_id, fee_id, amount, status, reference_no)
VALUES
(2, 1, 150.00, 'paid', 'REF123456'),
(2, 2, 120.00, 'paid', 'REF789012'),
(2, 3, 100.00, 'unpaid', NULL);
