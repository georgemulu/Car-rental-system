--Available Cars View -> All cars available for rent.

CREATE VIEW AvailableCars AS
SELECT car_id, model, brand, year
FROM car
WHERE status = 'available';

--Customer Reservations View -> This view provides details about reservations made by customers, including their names and contact information.

CREATE VIEW CustomerReservations AS
SELECT 
    r.reservation_id,
    c.name AS customer_name,
    c.email AS customer_email,
    r.car_id,
    r.start_date,
    r.end_date
FROM reservation r
JOIN customer c ON r.customer_id = c.customer_id;

--Car Reservation Status -> This view shows the reservation status of each car, including whether it is currently reserved.

CREATE VIEW CarReservationStatus AS
SELECT 
    car.car_id,
    car.model,
    car.brand,
    car.year,
    IF(r.reservation_id IS NULL, 'Not Reserved', 'Reserved') AS reservation_status
FROM car
LEFT JOIN reservation r ON car.car_id = r.car_id
  AND CURRENT_DATE BETWEEN r.start_date AND r.end_date;

--Payments Summary -> This view lists all payments along with their corresponding reservation details.

CREATE VIEW PaymentsSummary AS
SELECT 
    p.payment_id,
    p.reservation_id,
    c.name AS customer_name,
    car.model AS car_model,
    p.amount,
    p.payment_date,
    p.status AS payment_status
FROM payment p
JOIN reservation r ON p.reservation_id = r.reservation_id
JOIN customer c ON r.customer_id = c.customer_id
JOIN car ON r.car_id = car.car_id;

--Overdue Reservation -> This view identifies reservations that are past their end date but are not yet returned.

CREATE VIEW OverdueReservations AS
SELECT 
    r.reservation_id,
    c.name AS customer_name,
    c.email AS customer_email,
    car.model AS car_model,
    car.brand AS car_brand,
    r.start_date,
    r.end_date
FROM reservation r
JOIN customer c ON r.customer_id = c.customer_id
JOIN car ON r.car_id = car.car_id
WHERE r.end_date < CURRENT_DATE AND car.status = 'reserved';

--Revenue Report -> This view calculates the total revenue from payments made.

CREATE VIEW RevenueReport AS
SELECT 
    SUM(amount) AS total_revenue,
    COUNT(payment_id) AS total_payments,
    MAX(payment_date) AS last_payment_date
FROM payment
WHERE status = 'completed';

--Reservation Details -> This view consolidates detailed reservation information, including customer and car details.

CREATE VIEW ReservationDetails AS
SELECT 
    r.reservation_id,
    c.name AS customer_name,
    c.email AS customer_email,
    car.model AS car_model,
    car.brand AS car_brand,
    r.start_date,
    r.end_date,
    p.amount AS payment_amount,
    p.status AS payment_status
FROM reservation r
JOIN customer c ON r.customer_id = c.customer_id
JOIN car ON r.car_id = car.car_id
LEFT JOIN payment p ON r.reservation_id = p.reservation_id;
