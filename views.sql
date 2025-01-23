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



