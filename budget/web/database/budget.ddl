/*
CREATOR: Ju Hong Kim
RDBMS: MYSQL 

NOTES: 
-Check constraints may not work since they are not enforced in MYSQL
-To fix check constraints, it would be good to create a trigger but seems to
	be an unneeded operation since the front end can deal with the problem
-I am more familiar with Postgres so there may be syntaxes that compile 
	but does nothing in postgres
*/

/* For postgres
CREATE DOMAIN email_format AS VARCHAR(320) 
	CHECK (value ~ '.+@.+\..+');

CREATE DOMAIN first_name_format AS VARCHAR(25) 
	CHECK (value ~ '[A-Za-z]+')

CREATE DOMAIN last_name_format AS VARCHAR(25) 
	CHECK (value ~ '[A-Za-z]+')
*/

CREATE DATABASE IF NOT EXISTS budget;


/*SET search_path TO budget; --postgres */

#mysql	
USE budget; 

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE, 
	last_name VARCHAR(25) NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	username VARCHAR(15) UNIQUE NOT NULL CHECK (len(VALUE) >= 3) 
);

CREATE TABLE email (
	email_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	email VARCHAR (320) NOT NULL
);


CREATE TABLE store (
	store_id SERIAL PRIMARY KEY,
	store_name VARCHAR(50) NOT NULL
);

CREATE TABLE report (
	report_id SERIAL PRIMARY KEY,
	user_id INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	store_id INT NOT NULL REFERENCES store(store_id) ON UPDATE CASCADE,
	date DATE NOT NULL
);

CREATE TABLE type (
	type_id SERIAL PRIMARY KEY,
	type VARCHAR(10) NOT NULL
);

CREATE TABLE um (
	um_id SERIAL PRIMARY KEY,
	um VARCHAR(15) NOT NULL
);

CREATE TABLE record (
	record_id SERIAL PRIMARY KEY,
	report_id INT NOT NULL REFERENCES report(report_id) ON DELETE CASCADE ON UPDATE CASCADE,
	item_name VARCHAR(50) NOT NULL,
	qty NUMERIC(7, 4) NOT NULL,
	um_id INT NOT NULL REFERENCES um(um_id) ON UPDATE CASCADE,
	type_id INT NOT NULL REFERENCES report(report_id) ON UPDATE CASCADE,
	unit_cost NUMERIC(5, 2) NOT NULL
);