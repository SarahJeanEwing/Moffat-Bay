/*
    Title: moffat_bay_db_init.sql
    Author: <Team Name>
    Date: 23 Jan 2025
    Description: moffat-bay database initialization script.
*/

-- drop database moffat-bay if exists
DROP DATABASE `moffat-bay`;

-- create database moffat-bay
CREATE DATABASE `moffat-bay`;

-- use the database
USE `moffat-bay`;

-- drop database user if exists
DROP USER IF EXISTS 'dbadmin'@'localhost';

-- create dbadmin and grant them all privileges to the moffat-bay database
CREATE USER 'dbadmin'@'localhost' IDENTIFIED WITH mysql_native_password BY 'master01';

-- grant all privileges to the moffat-bay database to user dbadmin on localhost
GRANT ALL PRIVILEGES ON `moffat-bay`.* TO 'dbadmin'@'localhost';

-- drop tables if they are present
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS boat_slip;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS waitlist;

-- create the customer table
CREATE TABLE customer (
);

-- create the boat_slip table
CREATE TABLE boat_slip (
    slip_id     INT         NOT NULL    AUTO_INCREMENT,
    in_use      BOOLEAN     NOT NULL,
    slip_size   INT         NOT NULL    CHECK (slip_size IN (26, 40, 50)),

    PRIMARY KEY(slip_id)
);

-- create the reservation table
CREATE TABLE reservation (
);

-- create the waitlist table
CREATE TABLE waitlist (
);


-- insert customer records
INSERT INTO customer()
VALUES
;

-- insert boat_slip records
INSERT INTO boat_slip (in_use, slip_size)
VALUES
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 26),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 40),
(FALSE, 50),
(FALSE, 50),
(FALSE, 50),
(FALSE, 50),
(FALSE, 50)
;

-- insert reservation records
INSERT INTO reservation ()
VALUES
;

-- insert waitlist records
INSERT INTO waitlist ()
VALUES
;





