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
CREATE TABLE customers ( 
    customer_id INT PRIMARY KEY, 
    email VARCHAR(50), 
    first_name VARCHAR(50), 
    last_name VARCHAR(50), 
    telephone VARCHAR(20), 
    boat_name VARCHAR(50), 
    boat_length INT, 
    password VARCHAR(64) 
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
INSERT INTO customer (customer_id, email, first_name, last_name, telephone, boat_name, boat_length, password) 
VALUES
(10015, 'sponge@hmail.com', 'SpongeBob', 'SquarePants', '123-456-7890', 'Pineapple Express', 25, 'SqP@25Xx'), 
(10027, 'patrick@coldmail.com', 'Patrick', 'Star', '234-567-8901', 'Starfish Cruiser', 30, 'PaSt@30Z!'), 
(10039, 'sandy@hmail.com', 'Sandy', 'Cheeks', '345-678-9012', 'Texas Rider', 35, 'S@ndC35#'), 
(10052, 'squidward@coldmail.com', 'Squidward', 'Tentacles', '456-789-0123', 'Clarinet Clipper', 40, 'SqTEnt40*'), 
(10064, 'mrkrabs@hmail.com', 'Eugene', 'Krabs', '567-890-1234', 'Sand Dollar', 45, 'MrKr@b45'), 
(10078, 'plankton@coldmail.com', 'Sheldon', 'Plankton', '678-901-2345', 'Chum Bucket', 22, 'Pl@nk22!!'), 
(10085, 'gary@hmail.com', 'Gary', 'Snail', '789-012-3456', 'Meow Schooner', 28, 'G@Sn@l28'), 
(10092, 'pearl@coldmail.com', 'Pearl', 'Krabs', '890-123-4567', 'Whale Wave', 32, 'Pe@r*l32'), 
(10106, 'larry@hmail.com', 'Larry', 'Lobster', '901-234-5678', 'Muscle Mariner', 38, 'L@rLob38'), 
(10302, 'mrs.puff@coldmail.com', 'Poppy', 'Puff', '012-345-6789', 'Safety Sailor', 44, 'P0p@44yy'), 
(10312, 'bubbles@hmail.com', 'Bubbles', 'Fish', '123-654-7890', 'Bubble Blower', 24, 'BubbFish24!'), 
(10324, 'harold@coldmail.com', 'Harold', 'SquarePants', '234-576-8901', 'Barnacle Boat', 28, 'Har@SqP288'), 
(10337, 'mrs.square@hmail.com', 'Margaret', 'SquarePants', '345-687-9012', 'Anchor Away', 33, 'MQSqP33#'), 
(10345, 'nat@coldmail.com', 'Nat', 'Peterson', '456-798-0123', 'Reef Runner', 38, 'N@Ptr383'), 
(10358, 'oldman@hmail.com', 'Old Man', 'Walker', '567-809-1234', 'Waverider', 41, 'OldMW@41!'), 
(10365, 'fred@coldmail.com', 'Fred', 'Rechid', '678-910-2345', 'Tough Guy Tug', 35, 'FrRe35$$'), 
(10379, 'carpenter@hmail.com', 'Tom', 'Carpenter', '789-123-3456', 'Ship Shape', 26, '$T@rC26*'), 
(10386, 'noodles@coldmail.com', 'Tom', 'Noodles', '890-234-4567', 'Noodle Navigator', 30, 'T@Nood3l@'), 
(10391, 'jack@hmail.com', 'Jack', 'Kahuna', '901-345-5678', 'Big Kahuna', 37, 'J@cKH374'), 
(10402, 'bubblebass@coldmail.com', 'Bubble', 'Bass', '012-456-6789', 'Bubble Boss', 44, 'BB@ub44b'), 
(10417, 'nancy@hmail.com', 'Nancy', 'Supe', '123-567-7890', 'Sea Supe', 21, 'N@cSu21&'), 
(10429, 'carl@coldmail.com', 'Carl', 'Sadie', '234-678-8901', 'Sadie Sailor', 27, 'C@rS@227'), 
(10436, 'jimmy@hmail.com', 'Jimmy', 'Johnny', '345-789-9012', 'Johnny Jumper', 32, 'JiJo32##'), 
(10447, 'martha@coldmail.com', 'Martha', 'Man', '456-890-0123', 'Man-O-War', 37, 'M@rMan37!'), 
(10456, 'monroe@hmail.com', 'Monroe', 'Timmins', '567-901-1234', 'Timmins Tug', 44, 'MR@nn444'), 
(10468, 'ed@coldmail.com', 'Ed', 'Fish', '678-012-2345', 'Fish Fryer', 25, 'EdF@sh25#'), 
(10473, 'mary@hmail.com', 'Mary', 'Laundry', '789-123-3456', 'Laundry Liner', 34, 'M@rLa34@'), 
(10486, 'ralph@coldmail.com', 'Ralph', 'Ears', '890-234-4567', 'Ears Explorer', 28, 'R@lEa28!'), 
(10503, 'perch@hmail.com', 'Perch', 'Perkins', '901-345-5678', 'Perch Patrol', 31, 'Perk31%!'), 
(10517, 'whyfish@coldmail.com', 'Why', 'Fish', '012-456-6789', 'Whale Rider', 29, 'Wh@Fi299'), 
(10325, 'mindy@hmail.com', 'Mindy', 'Shell', '345-567-7809', 'Royal Seashell', 24, 'M!ndy24Sh'), 
(10338, 'potty@coldmail.com', 'Potty', 'Parrot', '456-678-8910', 'Parrot Perch', 29, 'P@ttyP29'), 
(10349, 'patchy@hmail.com', 'Patchy', 'Pirate', '567-789-9021', 'Pirate Plunder', 39, 'PaP!rat39'), 
(10354, 'dennis@coldmail.com', 'Dennis', 'Menace', '678-890-0132', 'Menace Sailor', 34, 'DMenace!@34S'), 
(10366, 'kevin@hmail.com', 'Kevin', 'Cucumber', '789-901-1243', 'Cucumber Cruiser', 33, 'KeviCu33@'), 
(10375, 'flats@coldmail.com', 'Flats', 'Flounder', '890-012-2354', 'Flounder Flyer', 25, 'FF@nd25!'), 
(10385, 'richard@hmail.com', 'Richard', 'A. Bottomfeeder', '901-123-3465', 'Bottomfeeder Boat', 48, 'R@AFbottom48'), 
(10399, 'nick@coldmail.com', 'Nick', 'Fishkins', '123-234-4576', 'Fishkins Fishing', 28, 'N!kFish28!'), 
(10413, 'squidette@hmail.com', 'Squidette', 'Ink', '234-345-5687', 'Ink Inc.', 35, 'S@idInk35'), 
(10425, 'buster@coldmail.com', 'Buster', 'Bluth', '345-456-6798', 'Bluth Boat', 42, 'BB!u42th')
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





