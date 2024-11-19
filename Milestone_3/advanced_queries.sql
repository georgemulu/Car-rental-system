-- Total reservation days by a car
SELECT c.car_id, 
       c.model, 
       c.brand, 
       SUM(DATEDIFF(r.end_date, r.start_date) + 1) AS total_reserved_days
FROM car c
LEFT JOIN reservation r ON c.car_id = r.car_id
GROUP BY c.car_id, c.model, c.brand
ORDER BY total_reserved_days DESC;

-- Cars reserved by multiple customers
SELECT r.car_id, 
       c.model, 
       c.brand, 
       COUNT(DISTINCT r.customer_id) AS unique_customers
FROM reservation r
JOIN car c ON r.car_id = c.car_id
GROUP BY r.car_id, c.model, c.brand
HAVING unique_customers > 1;

-- Customers without reservations
SELECT c.customer_id, 
       c.name, 
       c.email, 
       c.phone
FROM customer c
LEFT JOIN reservation r ON c.customer_id = r.customer_id
WHERE r.reservation_id IS NULL;

-- Payment status summary
SELECT p.status, 
       COUNT(p.payment_id) AS payment_count, 
       SUM(p.amount) AS total_amount
FROM payment p
GROUP BY p.status
ORDER BY total_amount DESC;
