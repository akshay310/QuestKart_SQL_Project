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
