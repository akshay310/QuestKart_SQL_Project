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
