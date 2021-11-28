--   ______  __  .__   __.  _______  ____    ____     _______       ___      .___________.     ___      .______        ___           _______. _______ 
--  /      ||  | |  \ |  | |       \ \   \  /   /    |       \     /   \     |           |    /   \     |   _  \      /   \         /       ||   ____|
-- |  ,----'|  | |   \|  | |  .--.  | \   \/   /     |  .--.  |   /  ^  \    `---|  |----`   /  ^  \    |  |_)  |    /  ^  \       |   (----`|  |__   
-- |  |     |  | |  . `  | |  |  |  |  \_    _/      |  |  |  |  /  /_\  \       |  |       /  /_\  \   |   _  <    /  /_\  \       \   \    |   __|  
-- |  `----.|  | |  |\   | |  '--'  |    |  |        |  '--'  | /  _____  \      |  |      /  _____  \  |  |_)  |  /  _____  \  .----)   |   |  |____ 
--  \______||__| |__| \__| |_______/     |__|        |_______/ /__/     \__\     |__|     /__/     \__\ |______/  /__/     \__\ |_______/    |_______|

-- create database cindyDB;
use cindyDB;

-------------------------------------------------------------------------------
-- variable entity:
-- this entity can be customized according to the needs of the fork,
-- it assumes the role of the product or service to be provided
CREATE TABLE IF NOT EXISTS variable_entity (
    id INT AUTO_INCREMENT PRIMARY KEY,
    default_data VARCHAR(100) NOT NULL
)  ENGINE=INNODB;
-------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS warehouse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    address VARCHAR(500) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS stock (
    id INT AUTO_INCREMENT PRIMARY KEY,
    instock int NOT NULL,
    warehouseID VARCHAR(500) NOT NULL,
    variableentityID VARCHAR(500) NOT NULL,
    FOREIGN KEY (variableentityID) REFERENCES variable_entity (id),
    FOREIGN KEY (warehouseID) REFERENCES warehouse (id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(500) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS permission (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    rolID int NOT NULL,
    FOREIGN KEY (rolID) REFERENCES rol (id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS store (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    address VARCHAR(500) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user VARCHAR(500) NOT NULL,
    password VARCHAR(1500) NOT NULL,
    rolID int NOT NULL,
    storeID int NOT NULL,
    FOREIGN KEY (rolID) REFERENCES rol (id),
    FOREIGN KEY (storeID) REFERENCES store (id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS payment_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(500) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(1000) NOT NULL,
    NIT VARCHAR(500) NULL,
    phonenumber VARCHAR(500) NULL,
    email VARCHAR(500) NULL,
    address VARCHAR(500) NULL
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS invoice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoce_date date NOT NULL,
    correlative VARCHAR(1000) NOT NULL,
    clientID int NOT NULL,
    userID int NOT NULL,
    payment_typeID int NOT NULL,
    FOREIGN KEY (clientID) REFERENCES client (id),
    FOREIGN KEY (userID) REFERENCES user (id),
    FOREIGN KEY (payment_typeID) REFERENCES payment_type (id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount int NOT NULL,
    discount int NOT NULL,
    stockID int NOT NULL,
    invoiceID int NOT NULL,
    FOREIGN KEY (stockID) REFERENCES stock (id),
    FOREIGN KEY (invoiceID) REFERENCES invoice (id)
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS delivery (
    id INT AUTO_INCREMENT PRIMARY KEY,
    delivery_date date not null,
    delivery_time time not null,
    shipping int NOT NULL,
    alternativeAddress VARCHAR(1000) null,
    invoiceID int NOT NULL,
    userID int NOT NULL,
    FOREIGN KEY (invoiceID) REFERENCES invoice (id),
    FOREIGN KEY (userID) REFERENCES user (id)
)  ENGINE=INNODB;