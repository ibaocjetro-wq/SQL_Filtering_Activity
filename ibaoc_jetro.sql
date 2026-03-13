-- =========================================
-- SQL Filtering Activity
-- Database: ibaoc_jetro
-- =========================================

-- Create Database
CREATE DATABASE IF NOT EXISTS ibaoc_jetro;
USE ibaoc_jetro;

-- =========================================
-- Create Table
-- =========================================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    membership_level VARCHAR(20),
    join_date DATE
);

-- =========================================
-- Insert Records
-- =========================================
INSERT INTO Customers (customer_id, customer_name, city, membership_level, join_date) VALUES
(1,'Alice','Cebu','Gold','2025-01-10'),
(2,'Bob','Bohol','Silver','2025-01-15'),
(3,'Charlie','Cebu','Bronze','2025-02-10'),
(4,'Diana','Tagbilaran','Gold','2025-02-12'),
(5,'Ethan','Bohol','Silver','2025-03-01'),
(6,'Fiona','Cebu','Gold','2025-03-05'),
(7,'George','Tagbilaran','Bronze','2025-03-08'),
(8,'Hannah','Cebu','Silver','2025-04-01'),
(9,'Ian','Bohol','Gold','2025-04-10'),
(10,'Julia','Cebu','Bronze','2025-04-15');

-- =========================================
-- SQL Filtering Queries
-- =========================================

-- 1. List all customers from Cebu
SELECT * FROM Customers
WHERE city = 'Cebu';

-- 2. Find all Gold membership customers
SELECT * FROM Customers
WHERE membership_level = 'Gold';

-- 3. Names starting with A or D
SELECT * FROM Customers
WHERE customer_name LIKE 'A%'
OR customer_name LIKE 'D%';

-- 4. Cebu customers with Silver or Gold membership
SELECT * FROM Customers
WHERE city = 'Cebu'
AND membership_level IN ('Silver','Gold');

-- 5. Customers who joined between Feb 1 and March 31
SELECT * FROM Customers
WHERE join_date BETWEEN '2025-02-01' AND '2025-03-31';

-- 6. Customers from Bohol or Tagbilaran with Bronze membership
SELECT * FROM Customers
WHERE city IN ('Bohol','Tagbilaran')
AND membership_level = 'Bronze';

-- 7. Customers whose name contains letter "a"
SELECT * FROM Customers
WHERE customer_name LIKE '%a%';

-- 8. Cebu Gold members who joined before March 2025
SELECT * FROM Customers
WHERE city = 'Cebu'
AND membership_level = 'Gold'
AND join_date < '2025-03-01';

-- 9. Bohol or Tagbilaran customers who joined on or before Feb 2025 with Silver or Bronze
SELECT * FROM Customers
WHERE city IN ('Bohol','Tagbilaran')
AND join_date <= '2025-02-28'
AND membership_level IN ('Silver','Bronze');

-- 10. Customers except ID 1,4,6 and joined after Feb 2025
SELECT * FROM Customers
WHERE customer_id NOT IN (1,4,6)
AND join_date > '2025-02-28';

-- 11. Customers joined in April 2025 from Cebu or Bohol and not Bronze
SELECT * FROM Customers
WHERE join_date BETWEEN '2025-04-01' AND '2025-04-30'
AND city IN ('Cebu','Bohol')
AND membership_level != 'Bronze';