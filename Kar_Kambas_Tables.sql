CREATE TABLE customer(
customer_id SERIAL PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(50),
address VARCHAR(100),
email VARCHAR(50),
phone_number VARCHAR(15)
);

CREATE TABLE vendor(
vendor_id SERIAL PRIMARY KEY,
vendor_name VARCHAR(30),
phone_number VARCHAR(15),
address VARCHAR(100)
);

CREATE TABLE car(
vin VARCHAR(20) NOT NULL PRIMARY KEY,
vendor_id INTEGER NOT NULL,
FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id),
model VARCHAR(50),
year VARCHAR(4),
color VARCHAR(15),
amount NUMERIC(8,2)
);

CREATE TABLE salesperson(
salesperson_id SERIAL PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(50)
);

CREATE TABLE mechanic(
mechanic_id SERIAL PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(50)
);

CREATE TABLE part(
part_id SERIAL PRIMARY KEY,
name VARCHAR(50),
description VARCHAR(255),
amount NUMERIC(7,2),
vendor_id INTEGER NOT NULL,
FOREIGN KEY(vendor_id) REFERENCES vendor(vendor_id),
sku VARCHAR(20)
);

CREATE TABLE service(
service_id SERIAL PRIMARY KEY,
date DATE,
mechanic_id INTEGER NOT NULL,
FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
description VARCHAR(255),
amount NUMERIC(7,2)
);

CREATE TABLE invoice(
invoice_id SERIAL PRIMARY KEY,
date TIMESTAMP,
vin VARCHAR(20),
FOREIGN KEY(vin) REFERENCES car(vin),
total_amount NUMERIC(8,2),
service_id INTEGER,
FOREIGN KEY(service_id) REFERENCES service(service_id),
salesperson_id INTEGER NOT NULL,
FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
mechanic_id INTEGER,
FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
customer_id INTEGER,
FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
