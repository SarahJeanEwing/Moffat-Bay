/*
    Title: moffat_bay_db_init.sql
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
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS boat_slips;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS waitlist;

-- create the customers table
CREATE TABLE customers ( 
    customer_id     INT             NOT NULL    AUTO_INCREMENT,
    email           VARCHAR(50)     NOT NULL, 
    first_name      VARCHAR(50)     NOT NULL, 
    last_name       VARCHAR(50)     NOT NULL, 
    telephone       VARCHAR(20)     NOT NULL, 
    boat_name       VARCHAR(50), 
    boat_length     INT, 
    password        VARCHAR(64)     NOT NULL,

    PRIMARY KEY (customer_id)
);

-- create the boat_slips table
CREATE TABLE boat_slips (
    slip_id     INT         NOT NULL    AUTO_INCREMENT,
    in_use      BOOLEAN     NOT NULL,
    slip_size   INT         NOT NULL    CHECK (slip_size IN (26, 40, 50)),

    PRIMARY KEY (slip_id)
);

-- create the reservations table
CREATE TABLE reservations (
    reservation_id  VARCHAR(8)  NOT NULL,
    customer_id     INT         NOT NULL,
    slip_id         INT,
    checkin_date    DATE        NOT NULL,
    checkout_date   DATE,
    active          BOOLEAN     NOT NULL,
    power           BOOLEAN     NOT NULL,

    PRIMARY KEY(reservation_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (slip_id) REFERENCES boat_slips(slip_id)

);

-- create the waitlist table
CREATE TABLE waitlist (
    waitlist_id     INT         NOT NULL    AUTO_INCREMENT,
    customer_id     INT         NOT NULL,
    date_of_request DATETIME    NOT NULL,
    active          BOOLEAN     NOT NULL,
    slip_size       INT         NOT NULL    CHECK (slip_size IN (26, 40, 50)),

    PRIMARY KEY (waitlist_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

);



-- insert customers records
INSERT INTO customers (customer_id, email, first_name, last_name, telephone, boat_name, boat_length, password) 
VALUES
    (10015, 'sponge@hmail.com', 'SpongeBob', 'SquarePants', '123-456-7890', 'Pineapple Express', 25, '7a8a87bc5130410299a3700ee9cb6e3f60b610525bb1128d4c2dff1798dcea34'),
    (10027, 'patrick@coldmail.com', 'Patrick', 'Star', '234-567-8901', 'Starfish Cruiser', 30, 'abbbd0a043dab059e147649e96094eda6b4b6071a67fbcdceeafaec928aa5960'),
    (10039, 'sandy@hmail.com', 'Sandy', 'Cheeks', '345-678-9012', 'Texas Rider', 35, '5a9ebd71ea89c8927cd41f14c569a84c5507982fcb89044467271d5894bed4e0'),
    (10052, 'squidward@coldmail.com', 'Squidward', 'Tentacles', '456-789-0123', 'Clarinet Clipper', 40, '08c6b57c70a61db3f6a6400f20a4c531bea381113096970e6bf4b0c5e12dcf2f'),
    (10064, 'mrkrabs@hmail.com', 'Eugene', 'Krabs', '567-890-1234', 'Sand Dollar', 45, '2e2244786177fa177d1dde2038a9122d2cbc9d537b9a93f370df10abae6b4b67'),
    (10078, 'plankton@coldmail.com', 'Sheldon', 'Plankton', '678-901-2345', 'Chum Bucket', 22, '1b5330f1d6f31bf1cbafe7e99d4e7946b99a8d535da93a57b3db432e4625aed3'),
    (10085, 'gary@hmail.com', 'Gary', 'Snail', '789-012-3456', 'Meow Schooner', 28, '15bebeaf2c51430a3a1b420b133002b3008e27132b420f6cd576d30b1c647edd'),
    (10092, 'pearl@coldmail.com', 'Pearl', 'Krabs', '890-123-4567', 'Whale Wave', 32, 'cfc92b7188b419e045e6f17654db54bce30ba709ed2e2da32213291635d996ea'),
    (10106, 'larry@hmail.com', 'Larry', 'Lobster', '901-234-5678', 'Muscle Mariner', 38, '94247c129f6a1a017330c5b84fc7953c823dc92191e2febfe2c5ac1821218d3e'),
    (10302, 'mrs.puff@coldmail.com', 'Poppy', 'Puff', '012-345-6789', 'Safety Sailor', 44, 'dc2b6a57d674f451777e3b9d711ada205bb3a5a82dd5a4200719f79a532b2ddd'),
    (10312, 'bubbles@hmail.com', 'Bubbles', 'Fish', '123-654-7890', 'Bubble Blower', 24, 'fd8c2e420c8075d78da6a826cb6b3efe25f9b5295bb5da460083471c767e19e0'),
    (10324, 'harold@coldmail.com', 'Harold', 'SquarePants', '234-576-8901', 'Barnacle Boat', 28, 'd99dd38dbc2ea76b4afc68b9a799078465b9b73a4b2e3aca8ac6c393995759e7'),
    (10337, 'mrs.square@hmail.com', 'Margaret', 'SquarePants', '345-687-9012', 'Anchor Away', 33, 'fa0fe8239bf538d228423bf4f95442c731cddb65edd1a80a958cbf40f3ac38f6'),
    (10345, 'nat@coldmail.com', 'Nat', 'Peterson', '456-798-0123', 'Reef Runner', 38, '8ae952cf9b07fc772b23e6b2331e0844f16cc419aef85ec283cb35a201bfa6e6'),
    (10358, 'oldman@hmail.com', 'Old Man', 'Walker', '567-809-1234', 'Waverider', 41, '5de33e79f67c0452b49eaa705b47e77dd4e879344970d48431459a6389d5b8a3'),
    (10365, 'fred@coldmail.com', 'Fred', 'Rechid', '678-910-2345', 'Tough Guy Tug', 35, '3afcf1a3bbbf43c81a39a87239782da72f6996c36feae591d141894751ecc95d'),
    (10379, 'carpenter@hmail.com', 'Tom', 'Carpenter', '789-123-3456', 'Ship Shape', 26, 'c9a7c4399ae0193c31c8865a6a93f1cfe36d2787be2db76945e884920593d483'),
    (10386, 'noodles@coldmail.com', 'Tom', 'Noodles', '890-234-4567', 'Noodle Navigator', 30, '9867e2fe8e371c6d18e50c937939586056a897a81aeb3e9d3b93422cdcf35468'),
    (10391, 'jack@hmail.com', 'Jack', 'Kahuna', '901-345-5678', 'Big Kahuna', 37, '0f2b7b2dea327561f77db4a5a70d2fa6145438eff0e51e453af770dfe81a87ac'),
    (10402, 'bubblebass@coldmail.com', 'Bubble', 'Bass', '012-456-6789', 'Bubble Boss', 44, 'afcc66dd543112c038eefb9cca2f4b030c884a111ed89d25c62cad33d765fcf9'),
    (10417, 'nancy@hmail.com', 'Nancy', 'Supe', '123-567-7890', 'Sea Supe', 21, 'df164764b504494fa34361cc5a3a1afcb9fc01e123e236f215c2bb3f2e197ca5'),
    (10429, 'carl@coldmail.com', 'Carl', 'Sadie', '234-678-8901', 'Sadie Sailor', 27, 'a02d4f93c802c78629843fd119e380214cb058fa13701366e8a7600fb9fb82d2'),
    (10436, 'jimmy@hmail.com', 'Jimmy', 'Johnny', '345-789-9012', 'Johnny Jumper', 32, 'ead5f8d6276208b29cb6c0fda41e8af9f6aba559cf958337d202f42fc04195c1'),
    (10447, 'martha@coldmail.com', 'Martha', 'Man', '456-890-0123', 'Man-O-War', 37, '2dc9264a4ac8e4fc0bd1ec2011272d7c72d00651291fa10ef75e4cac932ac605'),
    (10456, 'monroe@hmail.com', 'Monroe', 'Timmins', '567-901-1234', 'Timmins Tug', 44, 'dc18985df4db0c3a1956206524bb91028db3b3fe0934659768dd840fe26ee89a'),
    (10468, 'ed@coldmail.com', 'Ed', 'Fish', '678-012-2345', 'Fish Fryer', 25, 'f57a2b4a6ee83dcb0f5de6d314465b0862075baa7eb5a38e3b1beb8d3166da77'),
    (10473, 'mary@hmail.com', 'Mary', 'Laundry', '789-123-3456', 'Laundry Liner', 34, 'aa10467a18ddfdf46f571f5d8f20655bbb049f7f58d811d359ca43b6e1e4035a'),
    (10486, 'ralph@coldmail.com', 'Ralph', 'Ears', '890-234-4567', 'Ears Explorer', 28, '0ef422a85d0b17253e911da6f0441c4cac8e4dae6e18b7bb405901af3a982c85'),
    (10503, 'perch@hmail.com', 'Perch', 'Perkins', '901-345-5678', 'Perch Patrol', 31, '0a90b8ef8f408abdde5ffed1c4826e7caa972ef5948d71545456faaf31468dd3'),
    (10517, 'whyfish@coldmail.com', 'Why', 'Fish', '012-456-6789', 'Whale Rider', 29, '0e92743068f1ddbe1a308e60a39daee34abcac1d4bc5a4d3c0ae8e215a69ca59'),
    (10325, 'mindy@hmail.com', 'Mindy', 'Shell', '345-567-7809', 'Royal Seashell', 24, 'e363bced79d269abbb26aff78190930e072028f2b1f739a9e0162f896b9b1bd4'),
    (10338, 'potty@coldmail.com', 'Potty', 'Parrot', '456-678-8910', 'Parrot Perch', 29, '1b1cf48db1d82c92de15a28d31f5858e83dd79ad4aff5ebe1e6064a39ca1cf9b'),
    (10349, 'patchy@hmail.com', 'Patchy', 'Pirate', '567-789-9021', 'Pirate Plunder', 39, '023ccb44da55918b9c9ab088fe53c5a8d57f44bcd321cd3a197eea63d447494b'),
    (10354, 'dennis@coldmail.com', 'Dennis', 'Menace', '678-890-0132', 'Menace Sailor', 34, '7519207de5028169d0f4ab5e745718ba64e1f764675d4165165361a527294159'),
    (10366, 'kevin@hmail.com', 'Kevin', 'Cucumber', '789-901-1243', 'Cucumber Cruiser', 33, 'd010b94b1e0718e2d141a66a02117b97212ada26ab938fa94e4bba174ab16eb9'),
    (10375, 'flats@coldmail.com', 'Flats', 'Flounder', '890-012-2354', 'Flounder Flyer', 25, '508559cf3d7a9dbf943b7b60cf5b811d38268c241915d991b33d9e3876723025'),
    (10385, 'richard@hmail.com', 'Richard', 'A. Bottomfeeder', '901-123-3465', 'Bottomfeeder Boat', 48, '9f2fae1f73c0b6085cb2395cbeba378ead0d352dd2ef9fef642a819ae36cea50'),
    (10399, 'nick@coldmail.com', 'Nick', 'Fishkins', '123-234-4576', 'Fishkins Fishing', 28, 'b835c3ede5927499486e271b6e230ee5323fb597760f9406bc72fcfe6775e061'),
    (10413, 'squidette@hmail.com', 'Squidette', 'Ink', '234-345-5687', 'Ink Inc.', 35, '15c7818017156164e0c1a04fd92beec07bc055693e0310d523c17126344e1a61'),
    (10425, 'buster@coldmail.com', 'Buster', 'Bluth', '345-456-6798', 'Bluth Boat', 42, '209d486bcd1b42e0ecb6cdc9e239e65f4f829f9327bc66c62ca4d76c72eb3e95')
;

-- insert boat_slips records
INSERT INTO boat_slips (in_use, slip_size)
VALUES
    (TRUE, 26),
    (TRUE, 26),
    (TRUE, 26),
    (TRUE, 26),
    (TRUE, 26),
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
    (TRUE, 40),
    (TRUE, 40),
    (TRUE, 40),
    (TRUE, 40),
    (TRUE, 40),
    (FALSE, 40),
    (FALSE, 40),
    (FALSE, 40),
    (FALSE, 40),
    (FALSE, 40),
    (TRUE, 50),
    (TRUE, 50),
    (TRUE, 50),
    (TRUE, 50),
    (TRUE, 50)
;

-- insert reservations records
INSERT INTO reservations (reservation_id, customer_id, slip_id, checkin_date, active, power)
VALUES
    ('k9D2T4yQ', 10425, 27, '2025-01-02', TRUE, TRUE),
    ('A7e3G5bH', 10413, 29, '2025-01-14', TRUE, FALSE),
    ('p6V1Z8mX', 10399, 28, '2025-01-01', TRUE, TRUE),
    ('F3c7K2jR', 10385, 30, '2025-01-09', TRUE, FALSE),
    ('N5y4B9wL', 10375, 26, '2025-01-06', TRUE, TRUE),
    ('Q1z8X6hM', 10366, 2, '2025-01-03', TRUE, TRUE),
    ('T2g5J7lP', 10354, 4, '2025-01-16', TRUE, FALSE),
    ('H8r3S1kF', 10349, 5, '2025-01-08', TRUE, TRUE),
    ('W6v9A2pD', 10338, 3, '2025-01-09', TRUE, FALSE),
    ('L4y7T8mQ', 10325, 1, '2025-01-10', TRUE, TRUE),
    ('M5k1G6zN', 10517, 17, '2025-01-04', TRUE, TRUE),
    ('X3h2Y9wV', 10468, 19, '2025-01-15', TRUE, FALSE),
    ('B7d4K5nR', 10015, 18, '2025-01-07', TRUE, TRUE),
    ('J2p8V6tQ', 10429, 20, '2025-01-11', TRUE, FALSE),
    ('Z9w1F3mL', 10106, 16, '2025-01-05', TRUE, TRUE)
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





