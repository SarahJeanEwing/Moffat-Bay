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
DROP TABLE IF EXISTS boat_slip;
DROP TABLE IF EXISTS reservation;
DROP TABLE IF EXISTS waitlist;

-- create the customer table
CREATE TABLE customer (
);

-- create the boat_slip table
CREATE TABLE boat_slip (
);

-- create the reservation table
CREATE TABLE reservation (
);

-- create the waitlist table
CREATE TABLE waitlist (
    waitlist_id     INT         NOT NULL    AUTO_INCREMENT,
    customer_id     INT         NOT NULL,
    date_of_request DATETIME    NOT NULL,
    active          BOOLEAN     NOT NULL,
    slip_size       INT         NOT NULL    CHECK (slip_size IN (26, 40, 50)),

    PRIMARY KEY(waitlist_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);



-- insert customer records
INSERT INTO customer()
VALUES
;

-- insert boat_slip records
INSERT INTO boat_slip ()
VALUES
;

-- insert reservation records
INSERT INTO reservation ()
VALUES
;

-- insert waitlist records
INSERT INTO waitlist (customer_id, date_of_request, active, slip_size)
VALUES
    (10064, '2025-01-15 09:00:00', TRUE, 50), 
    (10302, '2025-01-16 11:15:00', FALSE, 50), 
    (10358, '2025-01-17 10:30:00', TRUE, 50), 
    (10402, '2025-01-18 14:45:00', FALSE, 50), 
    (10456, '2025-01-19 16:00:00', TRUE, 50)
;





