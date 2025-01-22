-- Find the total quantity of each food item donated to each food bank in a given month
SELECT fb.bank_name, fi.item_name, SUM(di.quantity) AS total_quantity
FROM NGO.Food_Banks fb
JOIN NGO.Donations d ON fb.bank_id = d.bank_id
JOIN NGO.Donation_Items di ON d.donation_id = di.donation_id
JOIN NGO.Food_Items fi ON di.item_id = fi.item_id
WHERE EXTRACT(MONTH FROM d.donation_date) = 3 AND EXTRACT(YEAR FROM d.donation_date) = 2024 
GROUP BY fb.bank_name, fi.item_name
ORDER BY fb.bank_name, total_quantity DESC;


