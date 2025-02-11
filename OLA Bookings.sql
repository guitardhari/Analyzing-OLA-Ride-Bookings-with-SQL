CREATE DATABASE OLA;
USE OLA;
/*Table is imported from the system hence not created*/
select * from bookings;

ALTER TABLE bookings RENAME COLUMN `ï»¿Date` TO Date;
SELECt * FROM bookings;


# 1. Retrieve all successful bookings:
SELECT * FROM bookings
WHERE booking_status = 'Success';

CREATE VIEW Successful_Bookings AS			#View created
SELECT * FROM bookings
WHERE booking_status = 'Success';

SELECt * from  successful_bookings;		#VIEW


# 2. Find the average ride distance for each vehicle type:

SELECT Vehicle_type, AVG(Ride_distance) AS avg_distance 
FROM bookings 
GROUP BY Vehicle_type;

CREATE VIEW ride_distance_for_each_vehicle_type AS
SELECT Vehicle_type, AVG(Ride_distance) AS avg_distance 
FROM bookings 
GROUP BY Vehicle_type;

SELECT * FROM ride_distance_for_each_vehicle_type;	#VIEW


# 3. Get the total number of canceled rides by customers:

SELECT COUNT(*) FROM bookings 
WHERE Booking_status = 'Canceled by Customer';		

CREATE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) FROM bookings 
WHERE Booking_status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customers;		#VIEW


# 4. List the top 5 customers who booked the highest number of rides:

SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM Bookings
Group BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

CREATE VIEW top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM Bookings
Group BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_customers;			#VIEW


# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

SELECT COUNT(Canceled_Rides_by_Driver) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';


# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

SELECT MAX(Driver_Ratings) AS Max_Rating,
MIN(Driver_Ratings) AS Min_Rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

CREATE VIEW MIN_MAX_DRIVER_RATING AS 
SELECT MAX(Driver_Ratings) AS Max_Rating,
MIN(Driver_Ratings) AS Min_Rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM MIN_MAX_DRIVER_RATING;


# 7. Retrieve all rides where payment was made using UPI:

SELECT * FROM bookings
WHERE Payment_Method = 'UPI';


# 8. Find the average customer rating per vehicle type:

SELECT Vehicle_type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_type;


# 9. Calculate the total booking value of rides completed successfully:

SELECT SUM(Booking_Value) as total_successful_ride_valu
FROM bookings
WHERE Booking_Status = 'Success';


# 10. List all incomplete rides along with the reason:

SELECT booking_id, Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';