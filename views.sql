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


