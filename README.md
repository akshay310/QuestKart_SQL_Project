# NGO PostgreSQL Database Schema

## Overview
This **PostgreSQL** database, named **NGO**, is designed to manage the operations of a network of local food banks. It tracks donations, food items, food bank locations, distributions to those in need, and the volunteers who support these activities.

## 1. Core Entities

### **NGO.Donors**
Stores information about those who donate food, including individuals, businesses, and organizations.

- **donor_id** (PK, INT, AUTO_INCREMENT)
- **donor_name** (VARCHAR)
- **donor_type** (VARCHAR) (e.g., "Individual," "Business")
- **contact_person** (VARCHAR)
- **contact_details** (VARCHAR)

### **NGO.Food_Items**
Contains details about different types of donated food items.

- **item_id** (PK, INT, AUTO_INCREMENT)
- **item_name** (VARCHAR)
- **item_type** (VARCHAR) (e.g., "Canned Goods," "Produce")
- **storage_requirements** (VARCHAR) (e.g., "Dry," "Refrigerated")

### **NGO.Food_Banks**
Stores information about food bank locations.

- **bank_id** (PK, INT, AUTO_INCREMENT)
- **bank_name** (VARCHAR)
- **address** (TEXT)
- **contact_details** (VARCHAR)
- **storage_capacity** (INT)

### **NGO.Volunteers**
Stores volunteer information.

- **volunteer_id** (PK, INT, AUTO_INCREMENT)
- **first_name** (VARCHAR)
- **last_name** (VARCHAR)
- **contact_details** (VARCHAR)
- **skills** (TEXT)

---

## 2. Transaction/Event Tables

### **NGO.Donations**
Records each donation event.

- **donation_id** (PK, INT, AUTO_INCREMENT)
- **donor_id** (FK, INT → Donors.donor_id)
- **bank_id** (FK, INT → Food_Banks.bank_id)
- **donation_date** (DATE)

### **NGO.Donation_Items**
Represents specific items within each donation.

- **donation_item_id** (PK, INT, AUTO_INCREMENT)
- **donation_id** (FK, INT → Donations.donation_id)
- **item_id** (FK, INT → Food_Items.item_id)
- **quantity** (INT, CHECK > 0)
- **expiration_date** (DATE)

### **NGO.Distributions**
Records each food distribution event.

- **distribution_id** (PK, INT, AUTO_INCREMENT)
- **bank_id** (FK, INT → Food_Banks.bank_id)
- **distribution_date** (DATE)

### **NGO.Distribution_Items**
Represents specific items distributed in each event.

- **distribution_item_id** (PK, INT, AUTO_INCREMENT)
- **distribution_id** (FK, INT → Distributions.distribution_id)
- **item_id** (FK, INT → Food_Items.item_id)
- **quantity** (INT, CHECK > 0)

### **NGO.Volunteer_Shifts**
Records shifts worked by volunteers.

- **shift_id** (PK, INT, AUTO_INCREMENT)
- **volunteer_id** (FK, INT → Volunteers.volunteer_id)
- **bank_id** (FK, INT → Food_Banks.bank_id)
- **shift_date** (DATE)
- **start_time** (TIME)
- **end_time** (TIME)
- **task_description** (TEXT)

---

## 3. Relationships and Key Concepts

### **Many-to-Many Relationships**
- **Donations and Food_Items** are linked through `NGO.Donation_Items`.
- **Distributions and Food_Items** are linked through `NGO.Distribution_Items`.

### **Foreign Keys**
Foreign keys are used to enforce referential integrity:
- `NGO.Donations` references `NGO.Donors` and `NGO.Food_Banks`.
- `NGO.Donation_Items` references `NGO.Donations` and `NGO.Food_Items`.
- `NGO.Distributions` references `NGO.Food_Banks`.
- `NGO.Distribution_Items` references `NGO.Distributions` and `NGO.Food_Items`.
- `NGO.Volunteer_Shifts` references `NGO.Volunteers` and `NGO.Food_Banks`.

### **Data Integrity Constraints**
- `NOT NULL` and `CHECK` constraints ensure data consistency.
- `quantity` fields in `NGO.Donation_Items` and `NGO.Distribution_Items` must be greater than 0.
- `donor_type` must be a predefined value.

### **Schema Organization**
- All tables belong to the `NGO` schema to prevent naming conflicts and maintain organization.

---

## 4. Purpose and Use Cases

### **Inventory Management**
- Track food quantities, locations, and expiration dates.

### **Donation Tracking**
- Record donations and analyze donation patterns.
- Identify top donors.

### **Distribution Management**
- Track distributions, including what items were distributed and when.

### **Volunteer Management**
- Schedule volunteers and track their shifts.
- Match volunteers to tasks based on skills.

### **Reporting & Analysis**
- Generate reports on:
  - **Donation trends**
  - **Distribution patterns**
  - **Inventory levels**
  - **Volunteer participation**

---

## 5. Repository Structure
```
📂 NGO_Database
│── 📂 schema_scripts
│   │── ngo_schema.sql
│
│── 📂 data_population
│   │── sample_data.sql
│
│── 📂 queries
│   │── donation_tracking.sql
│   │── inventory_management.sql
│   │── volunteer_management.sql
│
│── 📂 reports
│   │── donation_reports.csv
│   │── inventory_reports.csv
│
│── README.md
```

---

## Conclusion
This database provides an efficient way to manage food bank operations, ensuring transparency, efficiency, and improved service to the community.
