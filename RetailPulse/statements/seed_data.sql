-- ============================================================
-- RetailPulse Seed Data
-- Project: Sales Performance Dashboard
-- Author:  Prathamesh Chaumwal (SOE24201030044)
-- School:  Pimpri Chinchwad University
-- Course:  SQL and Database Management Systems
--          EduSkills Academy Virtual Internship
--
-- Run schema.sql first before running this file
-- ============================================================

-- ─────────────────────────────────────────────────────────────
-- Regions (8 records)
-- Global sales regions across 7 countries
-- ─────────────────────────────────────────────────────────────
INSERT INTO Regions (region_name, country, city) VALUES
('North America East', 'USA',     'New York'),
('North America West', 'USA',     'Los Angeles'),
('Europe West',        'UK',      'London'),
('Europe Central',     'Germany', 'Berlin'),
('Asia Pacific',       'Japan',   'Tokyo'),
('South Asia',         'India',   'Mumbai'),
('Middle East',        'UAE',     'Dubai'),
('Latin America',      'Brazil',  'São Paulo');

-- ─────────────────────────────────────────────────────────────
-- Categories (8 records)
-- Product categories across the retail store
-- ─────────────────────────────────────────────────────────────
INSERT INTO Categories (category_name, description) VALUES
('Electronics',     'Gadgets, devices and accessories'),
('Clothing',        'Apparel and fashion items'),
('Home Goods',      'Furniture and household items'),
('Books',           'Fiction, non-fiction and educational'),
('Sports',          'Sporting goods and fitness equipment'),
('Beauty',          'Skincare, makeup and personal care'),
('Food & Beverage', 'Packaged food and drinks'),
('Toys',            'Children toys and games');

-- ─────────────────────────────────────────────────────────────
-- Products (40 records)
-- 5 products per category
-- ─────────────────────────────────────────────────────────────
INSERT INTO Products (product_name, category_id, price, cost, stock_quantity) VALUES
-- Electronics (category_id = 1)
('Wireless Headphones', 1, 199.99,  80.00, 150),
('Smartphone X12',      1, 899.99, 400.00,  80),
('Laptop Pro 15',       1, 1299.99,600.00,  50),
('USB-C Hub',           1,  49.99,  15.00, 200),
('Smart Watch',         1, 299.99, 120.00, 100),
-- Clothing (category_id = 2)
('Running Shoes',       2,  89.99,  35.00, 300),
('Denim Jacket',        2,  69.99,  25.00, 250),
('Yoga Pants',          2,  49.99,  18.00, 400),
('Winter Coat',         2, 149.99,  60.00, 150),
('Casual T-Shirt',      2,  24.99,   8.00, 500),
-- Home Goods (category_id = 3)
('Coffee Table',        3, 249.99, 100.00,  60),
('Bed Frame Queen',     3, 399.99, 160.00,  40),
('Desk Lamp',           3,  39.99,  12.00, 300),
('Wall Clock',          3,  29.99,  10.00, 200),
('Storage Shelf',       3,  89.99,  35.00, 120),
-- Books (category_id = 4)
('Python Programming',    4,  44.99, 12.00, 500),
('Data Science Handbook', 4,  54.99, 15.00, 400),
('Business Strategy',     4,  34.99, 10.00, 350),
('The Art of War',        4,  14.99,  4.00, 600),
('Fiction Novel Pack',    4,  29.99,  8.00, 450),
-- Sports (category_id = 5)
('Yoga Mat',            5,  34.99,  12.00, 400),
('Dumbbells Set',       5,  79.99,  30.00, 200),
('Running Tracker',     5, 129.99,  50.00, 150),
('Tennis Racket',       5,  59.99,  22.00, 180),
('Football',            5,  24.99,   8.00, 350),
-- Beauty (category_id = 6)
('Face Moisturizer',    6,  29.99,   8.00, 500),
('Lipstick Set',        6,  24.99,   7.00, 400),
('Hair Serum',          6,  19.99,   6.00, 600),
('Perfume Collection',  6,  79.99,  25.00, 200),
('Sunscreen SPF50',     6,  14.99,   4.00, 700),
-- Food & Beverage (category_id = 7)
('Organic Coffee',      7,  19.99,   6.00, 800),
('Green Tea Pack',      7,  12.99,   4.00, 900),
('Protein Bars Box',    7,  34.99,  12.00, 600),
('Olive Oil Premium',   7,  24.99,   8.00, 500),
('Mixed Nuts Pack',     7,  19.99,   6.00, 700),
-- Toys (category_id = 8)
('LEGO City Set',          8, 59.99, 22.00, 300),
('Board Game Classic',     8, 39.99, 14.00, 250),
('Remote Control Car',     8, 49.99, 18.00, 200),
('Puzzle 1000 Pieces',     8, 24.99,  8.00, 400),
('Stuffed Animal Bear',    8, 19.99,  6.00, 500);

-- ─────────────────────────────────────────────────────────────
-- Customers (20 records)
-- Registered customers across all 8 regions
-- ─────────────────────────────────────────────────────────────
INSERT INTO Customers (first_name, last_name, email, region_id, registered_at) VALUES
('Alice',   'Smith',    'alice.smith@email.com',    1, '2023-01-15'),
('Bob',     'Johnson',  'bob.johnson@email.com',    2, '2023-02-20'),
('Charlie', 'Williams', 'charlie.w@email.com',      3, '2023-01-10'),
('Diana',   'Brown',    'diana.brown@email.com',    4, '2023-03-05'),
('Ethan',   'Jones',    'ethan.jones@email.com',    5, '2023-02-14'),
('Fiona',   'Garcia',   'fiona.garcia@email.com',   6, '2023-04-01'),
('George',  'Martinez', 'george.m@email.com',       7, '2023-03-20'),
('Hannah',  'Lee',      'hannah.lee@email.com',     8, '2023-05-10'),
('Ivan',    'Taylor',   'ivan.taylor@email.com',    1, '2023-06-01'),
('Julia',   'Anderson', 'julia.a@email.com',        2, '2023-06-15'),
('Kevin',   'Thomas',   'kevin.t@email.com',        3, '2023-07-01'),
('Laura',   'Jackson',  'laura.j@email.com',        4, '2023-07-20'),
('Mike',    'White',    'mike.white@email.com',     5, '2023-08-05'),
('Nina',    'Harris',   'nina.harris@email.com',    6, '2023-08-20'),
('Oscar',   'Clark',    'oscar.clark@email.com',    7, '2023-09-01'),
('Paula',   'Lewis',    'paula.lewis@email.com',    8, '2023-09-15'),
('Quinn',   'Robinson', 'quinn.r@email.com',        1, '2023-10-01'),
('Rachel',  'Walker',   'rachel.w@email.com',       2, '2023-10-20'),
('Sam',     'Hall',     'sam.hall@email.com',       3, '2023-11-05'),
('Tina',    'Allen',    'tina.allen@email.com',     4, '2023-11-20');

-- ─────────────────────────────────────────────────────────────
-- Orders (40 records)
-- Sales orders from January 2023 to July 2024
-- ─────────────────────────────────────────────────────────────
INSERT INTO Orders (customer_id, region_id, order_date, status) VALUES
(1,  1, '2023-01-20', 'Completed'),
(2,  2, '2023-02-25', 'Completed'),
(3,  3, '2023-03-10', 'Completed'),
(4,  4, '2023-03-15', 'Completed'),
(5,  5, '2023-04-01', 'Completed'),
(6,  6, '2023-04-10', 'Completed'),
(7,  7, '2023-04-20', 'Completed'),
(8,  8, '2023-05-01', 'Completed'),
(9,  1, '2023-05-15', 'Completed'),
(10, 2, '2023-06-01', 'Completed'),
(11, 3, '2023-06-20', 'Completed'),
(12, 4, '2023-07-05', 'Completed'),
(13, 5, '2023-07-20', 'Completed'),
(14, 6, '2023-08-01', 'Completed'),
(15, 7, '2023-08-15', 'Completed'),
(16, 8, '2023-09-01', 'Completed'),
(17, 1, '2023-09-20', 'Completed'),
(18, 2, '2023-10-05', 'Completed'),
(19, 3, '2023-10-20', 'Completed'),
(20, 4, '2023-11-01', 'Completed'),
(1,  1, '2023-11-15', 'Completed'),
(2,  2, '2023-11-25', 'Completed'),
(3,  3, '2023-12-01', 'Completed'),
(4,  4, '2023-12-10', 'Completed'),
(5,  5, '2023-12-20', 'Completed'),
(6,  6, '2024-01-05', 'Completed'),
(7,  7, '2024-01-15', 'Completed'),
(8,  8, '2024-01-25', 'Completed'),
(9,  1, '2024-02-01', 'Completed'),
(10, 2, '2024-02-15', 'Completed'),
(11, 3, '2024-03-01', 'Completed'),
(12, 4, '2024-03-15', 'Completed'),
(13, 5, '2024-04-01', 'Completed'),
(14, 6, '2024-04-15', 'Completed'),
(15, 7, '2024-05-01', 'Completed'),
(16, 8, '2024-05-15', 'Completed'),
(17, 1, '2024-06-01', 'Completed'),
(18, 2, '2024-06-15', 'Completed'),
(19, 3, '2024-07-01', 'Completed'),
(20, 4, '2024-07-15', 'Completed');

-- ─────────────────────────────────────────────────────────────
-- Order_Items (80 records)
-- Individual line items per order — the fact table
-- ─────────────────────────────────────────────────────────────
INSERT INTO Order_Items (order_id, product_id, quantity, price_at_purchase) VALUES
(1,  1,  2, 199.99),
(1,  16, 1,  44.99),
(2,  2,  1, 899.99),
(2,  5,  1, 299.99),
(3,  6,  2,  89.99),
(3,  21, 1,  34.99),
(4,  11, 1, 249.99),
(4,  13, 2,  39.99),
(5,  3,  1, 1299.99),
(5,  4,  2,  49.99),
(6,  26, 3,  29.99),
(6,  28, 2,  19.99),
(7,  36, 1,  59.99),
(7,  37, 2,  39.99),
(8,  31, 2,  19.99),
(8,  32, 3,  12.99),
(9,  7,  1,  69.99),
(9,  8,  2,  49.99),
(10, 12, 1, 399.99),
(10, 14, 1,  29.99),
(11, 17, 2,  54.99),
(11, 18, 1,  34.99),
(12, 22, 1,  79.99),
(12, 23, 1, 129.99),
(13, 29, 2,  79.99),
(13, 30, 3,  14.99),
(14, 38, 1,  49.99),
(14, 39, 2,  24.99),
(15, 9,  1, 149.99),
(15, 10, 3,  24.99),
(16, 33, 2,  34.99),
(16, 34, 1,  24.99),
(17, 19, 1,  14.99),
(17, 20, 2,  29.99),
(18, 24, 1,  59.99),
(18, 25, 2,  24.99),
(19, 15, 1,  89.99),
(19, 35, 2,  19.99),
(20, 27, 2,  24.99),
(20, 40, 1,  19.99),
(21, 1,  1, 199.99),
(21, 5,  1, 299.99),
(22, 2,  1, 899.99),
(22, 4,  3,  49.99),
(23, 6,  2,  89.99),
(23, 22, 1,  79.99),
(24, 11, 1, 249.99),
(24, 13, 1,  39.99),
(25, 3,  1, 1299.99),
(25, 16, 2,  44.99),
(26, 26, 2,  29.99),
(26, 29, 1,  79.99),
(27, 36, 2,  59.99),
(27, 37, 1,  39.99),
(28, 31, 3,  19.99),
(28, 33, 2,  34.99),
(29, 7,  2,  69.99),
(29, 8,  1,  49.99),
(30, 12, 1, 399.99),
(30, 15, 1,  89.99),
(31, 17, 1,  54.99),
(31, 19, 2,  14.99),
(32, 22, 2,  79.99),
(32, 24, 1,  59.99),
(33, 28, 3,  19.99),
(33, 30, 2,  14.99),
(34, 38, 2,  49.99),
(34, 40, 3,  19.99),
(35, 9,  1, 149.99),
(35, 10, 2,  24.99),
(36, 32, 4,  12.99),
(36, 35, 2,  19.99),
(37, 20, 1,  29.99),
(37, 18, 2,  34.99),
(38, 23, 1, 129.99),
(38, 25, 3,  24.99),
(39, 14, 2,  29.99),
(39, 34, 1,  24.99),
(40, 27, 1,  24.99),
(40, 39, 2,  24.99);

-- ─────────────────────────────────────────────────────────────
-- Verification queries
-- Run after executing this script to confirm all records
-- ─────────────────────────────────────────────────────────────
SELECT 'Regions'     AS table_name, COUNT(*) AS records FROM Regions
UNION ALL
SELECT 'Categories'  AS table_name, COUNT(*) AS records FROM Categories
UNION ALL
SELECT 'Products'    AS table_name, COUNT(*) AS records FROM Products
UNION ALL
SELECT 'Customers'   AS table_name, COUNT(*) AS records FROM Customers
UNION ALL
SELECT 'Orders'      AS table_name, COUNT(*) AS records FROM Orders
UNION ALL
SELECT 'Order_Items' AS table_name, COUNT(*) AS records FROM Order_Items;

-- Expected output:
-- Regions     | 8
-- Categories  | 8
-- Products    | 40
-- Customers   | 20
-- Orders      | 40
-- Order_Items | 80

-- ============================================================
-- End of seed_data.sql
-- ============================================================