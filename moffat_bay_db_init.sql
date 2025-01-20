/*
    Title: moffat_bay_db_init.sql
    Author: <Team Name>
    Date: 23 Jan 2025
    Description: moffat-bay database initialization script.
*/

-- drop database moffat-bay if exists
DROP DATABASE moffat-bay;

-- create database moffat-bay
CREATE DATABASE moffat-bay;

-- use the database
USE moffat-bay;

-- drop database user if exists
DROP USER IF EXISTS 'dbadmin'@'localhost';

-- create dbadmin and grant them all privileges to the moffat-bay database
CREATE USER 'dbadmin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'master01';

-- grant all privileges to the moffat-bay database to user dbadmin on localhost
GRANT ALL PRIVILEGES ON moffat-bay.* TO 'dbadmin'@'localhost';

-- drop tables if they are present
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS waitlist;
DROP TABLE IF EXISTS boat_slip;
DROP TABLE IF EXISTS slip_size;

-- create the customer table
CREATE TABLE customer (
);

-- create the reservation table
CREATE TABLE reservation (
);

-- create the waitlist table
CREATE TABLE waitlist (
);

-- create the boat_slip table
CREATE TABLE boat_slip (
);

-- create the slip_size table
CREATE TABLE slip_size (
);

-- insert customer records
INSERT INTO customer()
VALUES
;

-- insert reservation records
INSERT INTO reservation ()
VALUES
;

-- insert waitlist records
INSERT INTO waitlist ()
VALUES
;

-- insert boat_slip records
INSERT INTO boat_slip ()
VALUES
;

-- insert slip_size records
INSERT INTO slip_size ()
VALUES
;

