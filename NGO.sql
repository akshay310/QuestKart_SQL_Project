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
