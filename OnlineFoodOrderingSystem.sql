create database Online_Food_Ordering_System;
use Online_Food_Ordering_System;
create table customer
( name varchar(100),
  phone_num INT,
  location varchar(100));
create table Restaurant
( name varchar(100),
  location varchar(100),
  restaurant_ID INT);
create table Item
( name varchar(100),
  Item_ID INT,
  price INT);
create table Payment
( method varchar(100),
  amount INT,
  Payment_ID INT);
create table Order_made
( Item varchar(100),
  price INT,
  Customer_ID varchar(100));
Alter table customer Add customer_ID varchar(100);
drop table Order_made;
desc customer;
desc Restaurant;
desc Item;
desc Payment;
desc Order_made;

  

 

