create Database Bank;
use Bank;
create table Bank1
( Bank1_ID INT,
  Bank1_Branch varchar(100),
  Headquarters varchar(100));
create table Branch
( Branch_ID varchar(100),
  Name varchar(100),
  Branch_Location varchar(100));
create table Customer(
  Customer_ID varchar(100),
  name varchar(100),
  Contact INT);
create table Account(
  Account_ID varchar(100),
  Account_Type varchar(100),
  Balance INT);
create table Transaction(
  Transaction_ID varchar(100),
  Date DATE,
  Amount INT);
desc Bank1;
desc Branch;
desc Customer;
desc Account;
desc Transaction;

  

  
  



  
