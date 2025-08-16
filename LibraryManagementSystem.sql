create database Library_Management_System;
use Library_Management_System;
create table `library`
( library_ID INT,
  name varchar(20),
  location varchar(100));
create table Branch
( Branch_ID INT,
  location varchar(100),
  name varchar(100));
create table Book
( Book_ID INT,
  name varchar(100),
  author varchar(100));
create table issuer
( Issuer_ID INT,
  name varchar(100),
  date date);
create table borrower
( Borrow_ID INT,
  name varchar(100),
  date date);
Alter table Book Add publication_year INT;
drop table issuer;
desc `library`;
desc Branch;
desc Book;
desc issuer;
desc borrower;


