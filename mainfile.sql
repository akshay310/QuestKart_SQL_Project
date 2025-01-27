-- Contains the entire SQL Code. Involves creating tables, inserting rows, queries and views

CREATE SCHEMA IF NOT EXISTS NGO; 
CREATE TABLE NGO.Donors (
    donor_id SERIAL PRIMARY KEY,
    donor_name VARCHAR(255) NOT NULL,
    donor_type VARCHAR(20) CHECK (donor_type IN ('Individual', 'Business', 'Organization')) NOT NULL,
    contact_person VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255),
    address VARCHAR(255)
);
CREATE TABLE NGO.Food_Items (
    item_id SERIAL PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    item_type VARCHAR(255),
    storage_requirements VARCHAR(20) CHECK (storage_requirements IN ('Dry', 'Refrigerated', 'Frozen')) NOT NULL
);
CREATE TABLE NGO.Food_Banks (
    bank_id SERIAL PRIMARY KEY,
    bank_name VARCHAR(255) NOT NULL UNIQUE, -- Food bank names should be unique
    address VARCHAR(255),
    phone VARCHAR(20),
    contact_person VARCHAR(255),
    storage_capacity INTEGER CHECK (storage_capacity >= 0) -- Storage capacity cannot be negative
);
CREATE TABLE NGO.Donations (
    donation_id SERIAL PRIMARY KEY,
    donor_id INTEGER REFERENCES NGO.Donors(donor_id) NOT NULL,
    bank_id INTEGER REFERENCES NGO.Food_Banks(bank_id) NOT NULL,
    donation_date DATE NOT NULL
);
CREATE TABLE NGO.Donation_Items (
    donation_item_id SERIAL PRIMARY KEY,
    donation_id INTEGER REFERENCES NGO.Donations(donation_id) NOT NULL,
    item_id INTEGER REFERENCES NGO.Food_Items(item_id) NOT NULL,
    quantity INTEGER CHECK (quantity > 0) NOT NULL, -- Quantity must be positive
    expiration_date DATE
);
CREATE TABLE NGO.Distributions (
    distribution_id SERIAL PRIMARY KEY,
    bank_id INTEGER REFERENCES NGO.Food_Banks(bank_id) NOT NULL,
    distribution_date DATE NOT NULL
);
CREATE TABLE NGO.Distribution_Items (
    distribution_item_id SERIAL PRIMARY KEY,
    distribution_id INTEGER REFERENCES NGO.Distributions(distribution_id) NOT NULL,
    item_id INTEGER REFERENCES NGO.Food_Items(item_id) NOT NULL,
    quantity INTEGER CHECK (quantity > 0) NOT NULL -- Quantity must be positive
);
CREATE TABLE NGO.Volunteers (
    volunteer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255),
    skills TEXT
);
CREATE TABLE NGO.Volunteer_Shifts (
    shift_id SERIAL PRIMARY KEY,
    volunteer_id INTEGER REFERENCES NGO.Volunteers(volunteer_id) NOT NULL,
    bank_id INTEGER REFERENCES NGO.Food_Banks(bank_id) NOT NULL,
    shift_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    tasks TEXT
);
INSERT INTO NGO.Donors (donor_name, donor_type, contact_person, phone, email, address) VALUES
('Tata Foundation', 'Organization', 'Ravi Kumar', '+91-9876543210', 'info@tatafoundation.org', 'Mumbai, Maharashtra'),
('Reliance Industries', 'Business', 'Priya Sharma', '+91-9988776655', 'donations@reliance.com', 'Ahmedabad, Gujarat'),
('Infosys Foundation', 'Organization', 'Anika Patel', '+91-9765432109', 'contact@infosysfoundation.org', 'Bangalore, Karnataka'),
('Azim Premji Philanthropic Initiatives', 'Organization', 'Vikram Singh', '+91-9654321098', 'donations@azimpremjifoundation.org', 'Bangalore, Karnataka'),
('Godrej Group', 'Business', 'Meera Joshi', '+91-9543210987', 'csr@godrej.com', 'Mumbai, Maharashtra'),
('Mr. Rajesh Khanna', 'Individual', 'Rajesh Khanna', '+91-9432109876', 'rajesh.k@email.com', 'Delhi'),
('Mrs. Deepa Reddy', 'Individual', 'Deepa Reddy', '+91-9321098765', 'deepa.r@email.com', 'Hyderabad, Telangana'),
('Wipro Cares', 'Organization', 'Sunil Gupta', '+91-9210987654', 'info@wiprocares.org', 'Bangalore, Karnataka'),
('ITC Limited', 'Business', 'Anita Banerjee', '+91-9109876543', 'csr@itc.in', 'Kolkata, West Bengal'),
('Ms. Lakshmi Iyer', 'Individual', 'Lakshmi Iyer', '+91-9098765432', 'lakshmi.i@email.com', 'Chennai, Tamil Nadu');
select * from NGO.Donors;

INSERT INTO NGO.Food_Items(item_name, item_type, storage_requirements) VALUES
('Atta','Staple','Dry'),
('Basmati Rice','Staple','Dry'),
('Dal', 'Staple', 'Dry'),
('Parle-G Biscuits', 'Snacks', 'Dry'),
('Saffola Oil', 'Cooking Essentials', 'Dry'),
('Sugar', 'Sweetener', 'Dry'),
('Tea Leaves', 'Beverage', 'Dry'),
('Milk Powder', 'Dairy', 'Dry'),
('Potatoes', 'Vegetable', 'Dry'),
('Onions', 'Vegetable', 'Dry');
select * from NGO.Food_Items;

INSERT INTO NGO.Food_Banks (bank_name, address, phone, contact_person, storage_capacity) VALUES
('Anna Nagar Food Bank', 'Anna Nagar, Chennai', '+91-44-21234567', 'Kavitha Srinivasan', 2000),
('MG Road Food Bank', 'MG Road, Bangalore', '+91-80-22345678', 'Arun Kumar', 1800),
('Connaught Place Food Bank', 'Connaught Place, Delhi', '+91-11-23456789', 'Simran Kaur', 1500),
('Secunderabad Food Bank', 'Secunderabad, Telangana', '+91-40-24567890', 'Ramesh Rao', 1200),
('Andheri Food Bank', 'Andheri, Mumbai', '+91-22-25678901', 'Shalini Desai', 2500),
('Kolkata Central Food Bank', 'Kolkata, West Bengal', '+91-33-26789012', 'Debashish Chatterjee', 1600),
('Jaipur Food Bank', 'Jaipur, Rajasthan', '+91-141-27890123', 'Meena Agarwal', 1400),
('Lucknow Food Bank', 'Lucknow, Uttar Pradesh', '+91-522-28901234', 'Vivek Mishra', 1700),
('Pune Food Bank', 'Pune, Maharashtra', '+91-20-29012345', 'Smita Pawar', 1900),
('Chandigarh Food Bank', 'Chandigarh', '+91-172-20123456', 'Harpreet Singh', 1300);
select * from NGO.Food_Banks;

INSERT INTO NGO.Donations (donor_id, bank_id, donation_date) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-05'),
(3, 3, '2024-03-10'),
(4, 1, '2024-03-12'),
(5, 4, '2024-03-15'),
(6, 5, '2024-03-18'),
(7, 2, '2024-03-20'),
(8, 3, '2024-03-22'),
(9, 1, '2024-03-25'),
(10, 4, '2024-03-28');
select * from NGO.Donations

INSERT INTO NGO.Donation_Items (donation_id, item_id, quantity, expiration_date) VALUES
(1, 1, 500, '2025-03-01'),
(1, 3, 200, '2024-12-31'),
(2, 2, 300, '2024-09-30'),
(3, 4, 400, '2025-01-15'),
(4, 1, 250, '2024-11-30'),
(5, 5, 100, '2024-06-30'),
(6, 6, 150, '2025-02-28'),
(7, 7, 200, '2024-08-31'),
(8, 8, 100, '2024-10-31'),
(9, 9, 300, '2025-04-30');
select * from NGO.Donation_Items

INSERT INTO NGO.Distributions (bank_id, distribution_date) VALUES
(1, '2024-03-08'),
(2, '2024-03-12'),
(3, '2024-03-15'),
(1, '2024-03-19'),
(4, '2024-03-22'),
(5, '2024-03-26'),
(2, '2024-03-29'),
(3, '2024-04-02'),
(1, '2024-04-05'),
(4, '2024-04-09');
select * from NGO.Distributions

INSERT INTO NGO.Distribution_Items (distribution_id, item_id, quantity) VALUES
(1, 1, 200),
(1, 3, 100),
(2, 2, 150),
(3, 4, 200),
(4, 1, 100),
(5, 5, 50),
(6, 6, 75),
(7, 7, 100),
(8, 8, 50),
(9, 9, 150);
select * from NGO.Distribution_Items 

INSERT INTO NGO.Volunteers (first_name, last_name, phone, email, skills) VALUES
('Amit', 'Patel', '+91-9812345678', 'amit.p@email.com', 'Sorting, Packing, Distribution'),
('Geeta', 'Singh', '+91-9923456789', 'geeta.s@email.com', 'Data Entry, Inventory'),
('Rahul', 'Sharma', '+91-9734567890', 'rahul.sh@email.com', 'Sorting, Distribution'),
('Priya', 'Verma', '+91-9645678901', 'priya.v@email.com', 'Packing, Customer Service'),
('Vikram', 'Yadav', '+91-9556789012', 'vikram.y@email.com', 'Inventory, Data Entry'),
('Meera', 'Joshi', '+91-9467890123', 'meera.j@email.com', 'Sorting, Packing'),
('Sunil', 'Gupta', '+91-9378901234', 'sunil.g@email.com', 'Distribution, Driving'),
('Anita', 'Banerjee', '+91-9289012345', 'anita.b@email.com', 'Customer Service, Data Entry'),
('Rajesh', 'Khanna', '+91-9190123456', 'rajesh.k@email.com', 'Sorting'),
('Deepa', 'Reddy', '+91-9001234567', 'deepa.r@email.com', 'Packing, Inventory');
select * from NGO.Volunteers

INSERT INTO NGO.Volunteer_Shifts (volunteer_id, bank_id, shift_date, start_time, end_time, tasks) VALUES
(1, 1, '2024-03-01', '09:00', '12:00', 'Sorting donated items'),
(2, 2, '2024-03-05', '14:00', '17:00', 'Data entry of donations'),
(3, 3, '2024-03-10', '10:00', '13:00', 'Distributing food to recipients'),
(4, 1, '2024-03-12', '13:00', '16:00', 'Packing food boxes'),
(5, 4, '2024-03-15', '09:00', '12:00', 'Inventory management'), 
(6, 5, '2024-03-18', '11:00', '14:00', 'Sorting and packing'), 
(7, 2, '2024-03-20', '15:00', '18:00', 'Distribution assistance'), 
(8, 3, '2024-03-22', '09:30', '12:30', 'Data entry and filing'), 
(9, 1, '2024-03-25', '14:30', '17:30', 'Sorting and organizing'), 
(10, 4, '2024-03-28', '10:30', '13:30', 'Packing and labeling'),
(1,1,'2024-03-08','09:00','12:00','Distribution'), 
(3,2,'2024-03-12','10:00','13:00','Distribution'), 
(5,3,'2024-03-15','11:00','14:00','Distribution'), 
(7,1,'2024-03-19','12:00','15:00','Distribution'), 
(9,4,'2024-03-22','13:00','16:00','Distribution'), 
(2,5,'2024-03-26','14:00','17:00','Distribution'), 
(4,2,'2024-03-29','15:00','18:00','Distribution'), 
(6,3,'2024-04-02','09:00','12:00','Distribution'), 
(8,1,'2024-04-05','10:00','13:00','Distribution'), 
(10,4,'2024-04-09','11:00','14:00','Distribution'); 
select * from NGO.Volunteer_Shifts

select * from NGO.Donation_Items
INSERT INTO NGO.Donations (donor_id, bank_id, donation_date) VALUES
(10, 6, '2024-07-15'),
(10, 8, '2024-07-20'),
(1, 7, '2024-08-01'), 
(1, 9, '2024-08-05'), 
(1, 10, '2024-08-10'),
(2, 7, '2024-08-15'), 
(2, 9, '2024-08-20'), 
(2, 10, '2024-08-25');

INSERT INTO NGO.Donation_Items (donation_id, item_id, quantity, expiration_date) VALUES
(11, 2, 100, '2025-07-15'), (11, 4, 150, '2025-09-30'), (11, 6, 75, '2025-11-15'),
(12, 1, 120, '2025-08-20'), (12, 3, 180, '2025-10-05'), (12, 5, 90, '2025-12-20'),
(13, 3, 200, '2025-09-01'), (13, 5, 100, '2025-11-30'), (13, 1, 75, '2026-01-15'), 
(14, 2, 150, '2025-10-05'), (14, 4, 250, '2026-01-20'), (14, 6, 125, '2026-03-10'),
(15, 1, 180, '2025-11-10'), (15, 3, 300, '2026-02-25'), (15, 5, 150, '2026-04-20'),
(16, 2, 120, '2025-12-15'), (16, 4, 200, '2026-03-30'), (16, 6, 100, '2026-05-15'),
(17, 1, 150, '2026-01-20'), (17, 3, 250, '2026-05-05'), (17, 5, 125, '2026-06-20'),
(18, 2, 100, '2026-02-25'), (18, 4, 150, '2026-06-10'), (18, 6, 75, '2026-07-25'); 

INSERT INTO NGO.Volunteer_Shifts (volunteer_id, bank_id, shift_date, start_time, end_time, tasks) VALUES
(1, 6, '2024-07-15', '09:00', '12:00', 'Receiving and sorting donation'),
(2, 8, '2024-07-20', '14:00', '17:00', 'Inventory and data entry'), 
(3, 7, '2024-08-01', '10:00', '13:00', 'Unloading and organizing'), 
(4, 9, '2024-08-05', '13:00', '16:00', 'Packing and labeling'),
(5, 10, '2024-08-10', '09:30', '12:30', 'Inventory management'), 
(6, 7, '2024-08-15', '14:30', '17:30', 'Receiving and sorting'), 
(7, 9, '2024-08-20', '11:00', '14:00', 'Unloading and organizing'), 
(8, 10, '2024-08-25', '15:30', '18:30', 'Packing and labeling'); 

INSERT INTO NGO.Distributions (bank_id, distribution_date) VALUES
(6, '2024-07-22'), 
(8, '2024-07-27'); 
select * from NGO.Distributions

INSERT INTO NGO.Distribution_Items (distribution_id, item_id, quantity) VALUES
(13, 2, 50), (13, 4, 75), (13, 6, 35), 
(14, 1, 60), (14, 3, 90), (14, 5, 45); 

INSERT INTO NGO.Distributions (bank_id, distribution_date) VALUES
(7, '2024-08-08'),
(9, '2024-08-12'), 
(10, '2024-08-17'),
(7, '2024-08-22'), 
(9, '2024-08-27'), 
(10, '2024-09-01'); 

INSERT INTO NGO.Distribution_Items (distribution_id, item_id, quantity) VALUES
(15, 3, 100), (15, 5, 50), (15, 1, 30), 
(16, 2, 75), (16, 4, 125), (16, 6, 60), 
(17, 1, 90), (17, 3, 150), (17, 5, 75), 
(18, 2, 60), (18, 4, 100), (18, 6, 50), 
(19, 1, 75), (19, 3, 125), (19, 5, 60), 
(20, 2, 50), (20, 4, 75), (20, 6, 35);
select * from NGO.Distribution_Items

INSERT INTO NGO.Volunteer_Shifts (volunteer_id, bank_id, shift_date, start_time, end_time, tasks) VALUES
(1, 6, '2024-07-15', '09:00', '12:00', 'Receiving and sorting donation'),
(2, 8, '2024-07-20', '14:00', '17:00', 'Inventory and data entry'),
(3, 7, '2024-08-01', '10:00', '13:00', 'Unloading and organizing'),
(4, 9, '2024-08-05', '13:00', '16:00', 'Packing and labeling'),
(5, 10, '2024-08-10', '09:30', '12:30', 'Inventory management'),
(6, 7, '2024-08-15', '14:30', '17:30', 'Receiving and sorting'),
(7, 9, '2024-08-20', '11:00', '14:00', 'Unloading and organizing'),
(8, 10, '2024-08-25', '15:30', '18:30', 'Packing and labeling'),
(9, 6, '2024-07-22', '09:00', '12:00', 'Assisting with distribution'),
(10, 8, '2024-07-27', '10:00', '13:00', 'Managing distribution lines'),
(1, 7, '2024-08-08', '11:00', '14:00', 'Distributing food items'),
(2, 9, '2024-08-12', '12:00', '15:00', 'Assisting with distribution'),
(3, 10, '2024-08-17', '13:00', '16:00', 'Managing distribution flow'),
(4, 7, '2024-08-22', '14:00', '17:00', 'Distributing food items'),
(5, 9, '2024-08-27', '15:00', '18:00', 'Assisting with distribution'),
(6, 10, '2024-09-01', '09:00', '12:00', 'Managing distribution flow'),
(7, 1, '2024-07-29', '10:00', '13:00', 'Sorting'),
(8, 2, '2024-08-02', '11:00', '14:00', 'Packing'),
(9, 3, '2024-08-09', '12:00', '15:00', 'Distribution'),
(10, 4, '2024-08-16', '13:00', '16:00', 'Inventory'),
(1, 5, '2024-08-23', '14:00', '17:00', 'Data Entry'),
(2, 6, '2024-08-30', '09:00', '12:00', 'Sorting');


INSERT INTO NGO.Donation_Items (donation_id, item_id, quantity, expiration_date)
VALUES (3, 2, 75, '2025-02-15');

--Query to get the current inventory for each food bank
SELECT fb.bank_name, fi.item_name, SUM(di.quantity) AS current_inventory
FROM NGO.Food_Banks fb
JOIN NGO.Donations d ON fb.bank_id = d.bank_id
JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
JOIN NGO.Food_Items fi ON di.item_id = fi.item_id
GROUP BY fb.bank_name, fi.item_name
ORDER BY fb.bank_name, fi.item_name;

--Find the total quantity of each food item donated to each food bank in March 2024
SELECT fb.bank_name, fi.item_name, SUM(di.quantity) AS total_quantity
FROM NGO.Food_Banks fb
JOIN NGO.Donations d ON fb.bank_id = d.bank_id
JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
JOIN NGO.Food_Items fi ON di.item_id = fi.item_id
WHERE EXTRACT(MONTH FROM d.donation_date) = 3 AND EXTRACT(YEAR FROM d.donation_date) = 2024 -- Filter for March 2024
GROUP BY fb.bank_name, fi.item_name
ORDER BY fb.bank_name, total_quantity DESC;

--Find the top 3 donors who have donated the largest total quantity of food items:
SELECT don.donor_name, SUM(di.quantity) AS total_donated_quantity
FROM NGO.Donors don
JOIN NGO.Donations d ON don.donor_id = d.donor_id
JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
GROUP BY don.donor_name
ORDER BY total_donated_quantity DESC
LIMIT 3;

--Find the food bank with the highest quantity of donations
SELECT fb.bank_name, SUM(di.quantity) AS total_donated_quantity
FROM NGO.Food_Banks fb
JOIN NGO.Donations d ON fb.bank_id = d.bank_id
JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
GROUP BY fb.bank_name
ORDER BY total_donated_quantity DESC
LIMIT 1;

--Find the average quantity of each food item donated across all donations:
SELECT fi.item_name, COALESCE(AVG(di.quantity), 0) AS average_donated_quantity
FROM NGO.Food_Items fi
LEFT OUTER JOIN NGO.Donation_Items di ON fi.item_id = di.item_id
GROUP BY fi.item_name
ORDER BY average_donated_quantity DESC;

--Find the total number of volunteer hours worked at each food bank 
SELECT fb.bank_name, COALESCE(SUM(EXTRACT(EPOCH FROM (vs.end_time - vs.start_time)) / 3600), 0) AS total_volunteer_hours
FROM NGO.Food_Banks fb
LEFT JOIN NGO.Volunteer_Shifts vs ON fb.bank_id = vs.bank_id
GROUP BY fb.bank_name
ORDER BY total_volunteer_hours DESC;

--View to Find the donors who have donated items expiring within the next 60 days, how many days it will expire in and name of the bank
CREATE VIEW EXPIRY_IN_60_DAYS AS (
SELECT DISTINCT don.donor_name, di.expiration_date, fb.bank_name,
       (di.expiration_date - CURRENT_DATE) AS days_until_expiration
FROM NGO.Donors don
JOIN NGO.Donations d ON don.donor_id = d.donor_id
JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
JOIN NGO.Food_Banks fb ON d.bank_id = fb.bank_id
WHERE di.expiration_date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '60 days'
ORDER BY di.expiration_date);

SELECT * FROM EXPIRY_IN_60_DAYS


--View to find the highest donated food item to each bank
Create view highest_donated_per_bank as(
WITH RankedDistributions AS (
    SELECT fb.bank_name, fi.item_name, SUM(di.quantity) AS total_distributed,
           ROW_NUMBER() OVER (PARTITION BY fb.bank_name ORDER BY SUM(di.quantity) DESC) as rn
    FROM NGO.Food_Banks fb
    JOIN NGO.Distributions dist ON fb.bank_id = dist.bank_id
    JOIN NGO.Distribution_Items di ON dist.distribution_id = di.distribution_id
    JOIN NGO.Food_Items fi ON di.item_id = fi.item_id
    GROUP BY fb.bank_name, fi.item_name
)
SELECT bank_name, item_name, total_distributed
FROM RankedDistributions
WHERE rn = 1);

select * from highest_donated_per_bank

--View to see donor donation summary
CREATE MATERIALIZED VIEW DonationSummary AS
SELECT don.donor_name, COUNT(DISTINCT d.donation_id) AS total_donations, SUM(di.quantity) AS total_quantity_donated
FROM NGO.Donors don
LEFT JOIN NGO.Donations d ON don.donor_id = d.donor_id
LEFT JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
GROUP BY don.donor_name;

select * from DonationSummary ORDER BY total_donations,total_quantity_donated asc;






