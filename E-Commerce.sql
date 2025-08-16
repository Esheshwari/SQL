create database E_Commerce;
use E_Commerce;
create table User (
    user_id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);
create table Product (
    product_id INT,
    name VARCHAR(100),
    price DECIMAL(10,2),
    seller_id INT
);
create table Seller (
    seller_id INT,
    name VARCHAR(100),
    contact VARCHAR(100)
);
create table Cart (
    cart_id INT,
    user_id INT,
    product_id INT,
    quantity INT
);
create table OrderTable (
    order_id INT,
    user_id INT,
    order_date DATE
);
create table Payment (
    payment_id INT,
    order_id INT,
    amount DECIMAL(10,2),
    method VARCHAR(50)
);
ALTER TABLE Product ADD stock INT;
DROP TABLE Cart;