-- ************************************************************
-- Database: alx_book_store
-- Description: Online Bookstore Database Schema
-- Author: Gabriel Nkrumah-Antiedu
-- ************************************************************

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- 2. USE DATABASE
USE alx_book_store;

-- 3. CREATE TABLE: AUTHORS
CREATE TABLE AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 4. CREATE TABLE: BOOKS
CREATE TABLE BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 5. CREATE TABLE: CUSTOMERS
CREATE TABLE CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- 6. CREATE TABLE: ORDERS
CREATE TABLE ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. CREATE TABLE: ORDER_DETAILS
CREATE TABLE ORDER_DETAILS (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ************************************************************
-- ✅ Database successfully created: alx_book_store
-- ************************************************************
