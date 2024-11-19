--Update a customer's information
UPDATE customer 
SET name = 'Maria', 
    email = 'maria@gmail.com', 
    phone = '0782233445' 
WHERE customer_id = 4;

--Update a car's Dates
UPDATE car 
SET status = 'Unavailable' 
WHERE car_id = 4;

--update a Reservation's Status
UPDATE reservation 
SET start_date = '2024-03-10', 
    end_date = '2024-03-25' 
WHERE reservation_id = 3;

--Update a payment status
UPDATE payment 
SET status = 'unpaid' 
WHERE payment_id = 4;

-- Update a Payment amount
UPDATE payment 
SET amount = 15000 
WHERE payment_id = 6;

--Update a customer assigned to Reservation
UPDATE reservation 
SET customer_id = 2 
WHERE reservation_id = 5;

--Update a car assigned to reservation
UPDATE reservation 
SET car_id = 1 
WHERE reservation_id = 5;
