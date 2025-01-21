This PostgreSQL database, named **NGO**, is designed to manage the operations of a network of local food banks. It tracks donations, food items, food bank locations, distributions to those in need, and the volunteers who support these activities. Here's a breakdown of the tables and their relationships:

1)**Core Entities:**


**NGO.Donors**: Stores information about those who donate food. This includes individuals, businesses, and organizations. Key attributes include donor_name, donor_type, contact_person, and contact details.

**NGO.Food_Items**: Contains details about the different types of food items donated. This includes item_name, item_type (e.g., "Canned Goods," "Produce"), and storage_requirements (e.g., "Dry," "Refrigerated").

**NGO.Food_Banks**: Stores information about each food bank location within the network. Key attributes include bank_name, address, contact details, and storage_capacity.

**NGO.Volunteers**: Stores information about the volunteers who assist at the food banks, including their first_name, last_name, contact details, and skills.

2)**Transaction/Event Tables:**

**NGO.Donations**: Records each donation event. It links a donor_id (from Donors), a bank_id (from Food_Banks), and the donation_date.

**NGO.Donation_Items**: Represents the specific items within each donation. It links a donation_id (from Donations), an item_id (from Food_Items), the quantity donated, and the expiration_date of the items. This table implements a many-to-many relationship between donations and food items.

**NGO.Distributions**: Records each distribution of food to those in need. It links a bank_id (from Food_Banks) and the distribution_date.

**NGO.Distribution_Items**: Represents the specific items distributed during each distribution event. It links a distribution_id (from Distributions), an item_id (from Food_Items), and the quantity distributed. This table implements a many-to-many relationship between distributions and food items.

**NGO.Volunteer_Shifts**: Records the shifts worked by volunteers. It links a volunteer_id (from Volunteers), a bank_id (from Food_Banks), the shift_date, start_time, end_time, and a description of the tasks performed.

3)**Relationships and Key Concepts:**

**Many-to-Many Relationships:**
Donations and Food_Items are linked through Donation_Items. A single donation can include multiple food items, and a single food item can be part of multiple donations.
Distributions and Food_Items are linked through Distribution_Items. A single distribution can include multiple food items, and a single food item can be part of multiple distributions.

**Foreign Keys**: Foreign keys are used extensively to enforce referential integrity and maintain consistency between related tables. For example, the Donations table has foreign keys referencing Donors and Food_Banks, ensuring that every donation is associated with a valid donor and food bank.

**Data Integrity**: NOT NULL and CHECK constraints are used to enforce data quality. For example, quantity in Donation_Items and Distribution_Items must be greater than 0, and donor_type must be one of the allowed values.

**Schema**: All tables are created within the NGO schema, which helps organize the database and prevent naming conflicts.

4)**Purpose and Use Cases:**

This database is designed to support various operations and analyses, such as:

**Inventory Management**: Tracking the quantity and location of food items, including expiration dates.

**Donation Tracking**: Recording donations, identifying top donors, and analyzing donation patterns.

**Distribution Management**: Recording distributions, tracking which items are distributed, and analyzing distribution trends.

**Volunteer Management**: Scheduling volunteers, tracking their hours, and matching their skills to tasks.

**Reporting and Analysis**: Generating reports on donations, distributions, inventory levels, and volunteer activity.

By using this database, the food bank network can improve its efficiency, transparency, and ability to serve the community.
