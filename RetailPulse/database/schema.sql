-- ============================================================
-- RetailPulse Database Schema
-- Project: Sales Performance Dashboard
-- Author:  Prathamesh Chaumwal (SOE24201030044)
-- School:  Pimpri Chinchwad University
-- Course:  SQL and Database Management Systems
--          EduSkills Academy Virtual Internship
-- ============================================================

-- Create and connect to the database
-- Run: CREATE DATABASE retailpulse_db;
-- Then: \c retailpulse_db

-- ─────────────────────────────────────────────────────────────
-- Drop tables in reverse order (children before parents)
-- to avoid foreign key conflicts on re-run
-- ─────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS Order_Items CASCADE;
DROP TABLE IF EXISTS Orders     CASCADE;
DROP TABLE IF EXISTS Customers  CASCADE;
DROP TABLE IF EXISTS Products   CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Regions    CASCADE;

-- ─────────────────────────────────────────────────────────────
-- Table 1: Regions
-- Stores global sales regions
-- ─────────────────────────────────────────────────────────────
CREATE TABLE Regions (
    region_id   SERIAL PRIMARY KEY,
    region_name VARCHAR(100) NOT NULL,
    country     VARCHAR(100) NOT NULL,
    city        VARCHAR(100) NOT NULL
);

-- ─────────────────────────────────────────────────────────────
-- Table 2: Categories
-- Stores product categories
-- ─────────────────────────────────────────────────────────────
CREATE TABLE Categories (
    category_id   SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    description   TEXT
);

-- ─────────────────────────────────────────────────────────────
-- Table 3: Products
-- Stores product details linked to categories
-- ─────────────────────────────────────────────────────────────
CREATE TABLE Products (
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(255) NOT NULL,
    category_id    INT NOT NULL,
    price          NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    cost           NUMERIC(10,2) NOT NULL CHECK (cost >= 0),
    stock_quantity INT NOT NULL DEFAULT 0,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES Categories(category_id)
        ON DELETE RESTRICT
);

-- ─────────────────────────────────────────────────────────────
-- Table 4: Customers
-- Stores registered customer information
-- ─────────────────────────────────────────────────────────────
CREATE TABLE Customers (
    customer_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR(100) NOT NULL,
    last_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(255) UNIQUE NOT NULL,
    region_id     INT NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_customers_region
        FOREIGN KEY (region_id)
        REFERENCES Regions(region_id)
        ON DELETE RESTRICT
);

-- ─────────────────────────────────────────────────────────────
-- Table 5: Orders
-- Stores order headers linked to customers and regions
-- ─────────────────────────────────────────────────────────────
CREATE TABLE Orders (
    order_id    SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    region_id   INT NOT NULL,
    order_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status      VARCHAR(50) DEFAULT 'Completed',
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_orders_region
        FOREIGN KEY (region_id)
        REFERENCES Regions(region_id)
        ON DELETE RESTRICT
);

-- ─────────────────────────────────────────────────────────────
-- Table 6: Order_Items (Fact Table)
-- Stores individual line items per order
-- Central table in the star schema
-- ─────────────────────────────────────────────────────────────
CREATE TABLE Order_Items (
    order_item_id     SERIAL PRIMARY KEY,
    order_id          INT NOT NULL,
    product_id        INT NOT NULL,
    quantity          INT NOT NULL CHECK (quantity > 0),
    price_at_purchase NUMERIC(10,2) NOT NULL CHECK (price_at_purchase >= 0),
    CONSTRAINT fk_orderitems_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_orderitems_product
        FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
        ON DELETE RESTRICT
);

-- ─────────────────────────────────────────────────────────────
-- Verification
-- Run after executing this script to confirm all tables exist
-- ─────────────────────────────────────────────────────────────
-- \dt
-- \d Regions
-- \d Categories
-- \d Products
-- \d Customers
-- \d Orders
-- \d Order_Items

-- ============================================================
-- End of schema.sql
-- ============================================================