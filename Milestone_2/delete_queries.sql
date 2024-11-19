-- Delete from reservation
-- Delete a specific reservation
DELETE FROM reservation WHERE reservation_id = 10;

-- Delete all reservations for a specific customer
DELETE FROM reservation WHERE customer_id = 1;

-- Delete all reservations for a specific car
DELETE FROM reservation WHERE car_id = 2;

-- Delete from customer
-- Delete a specific customer
DELETE FROM customer WHERE customer_id = 1;

-- Delete from car
-- Delete a specific car
DELETE FROM car WHERE car_id = 1;
