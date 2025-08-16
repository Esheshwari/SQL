create database Hospital_Management_System;
use Hospital_Management_System;
create table Hospital
( Hospital_ID INT,
  name varchar(100),
  location varchar(100));
create table Department
( name varchar(100),
  Depart_ID INT,
  location varchar(100));
create table Doctor
( Doctor_ID INT,
  Depart_ID INT,
  name varchar(100));
create table Patient
( name varchar(100),
  age INT,
  Patient_ID INT);
create table Appointment
( Appointment_ID INT,
  Patient_name varchar(100),
  Doctor_Name varchar(100));
Alter table Appointment Add Hospital_ID INT;
desc table Hospital;
desc table Patient;
desc table Doctor;
desc table Appointment;
desc table Department;
drop table Hospital;


