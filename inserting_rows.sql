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
