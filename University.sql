create database University;
use University;
create table university (
    university_id int,
    name varchar(100),
    location varchar(100)
);
create table department (
    department_id int,
    university_id int,
    name varchar(100)
);
create table course (
    course_id int,
    department_id int,
    title varchar(100),
    credits int
);
create table student (
    student_id int,
    name varchar(100),
    university_id int,
    department_id int
);