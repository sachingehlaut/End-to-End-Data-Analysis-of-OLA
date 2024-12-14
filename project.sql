Create Database Ola;
use Ola;
--#1. Retrieve all successful bookings:
create view Successful_Bookings As
select * from [dbo].[bookingscsv]
where booking_status='success'

--2. Find the average ride distance for each vehicle type:
 Create View ride_distance_for_each_vehicle As
 SELECT Vehicle_Type, AVG(Ride_Distance)
 as avg_distance FROM [dbo].[bookingscsv]
 GROUP BY Vehicle_Type

  --#3. Get the total number of cancelled rides by customers:
 Create View canceled_rides_by_customers As
 SELECT COUNT(*) as number_of_canceled_rides FROM [dbo].[bookingscsv] 
 WHERE Booking_Status = 'canceled by Customer'

--#4. List the top 5 customers who booked the highest number of rides:
 Create View Top_5_Customers As
 SELECT top 5 Customer_ID, COUNT(Booking_ID) as total_rides
 FROM [dbo].[bookingscsv]
 GROUP BY Customer_ID
 ORDER BY total_rides DESC

 --#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
 Create View Rides_canceled_by_Drivers_P_C_Issues As
 SELECT COUNT(*) as Rides_canceled_by_Drivers_P_C_Issues FROM [dbo].[bookingscsv]
 WHERE canceled_Rides_by_Driver = 'Personal & Car related issue'

 --#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
 Create View Max_Min_Driver_Rating As
 SELECT MAX(Driver_Ratings) as max_rating,
 MIN(Driver_Ratings) as min_rating
 FROM [dbo].[bookingscsv] WHERE Vehicle_Type = 'Prime Sedan'

 --#7. Retrieve all rides where payment was made using UPI:
 Create View UPI_Payment As
 SELECT * FROM [dbo].[bookingscsv]
 WHERE Payment_Method = 'UPI'

 --#8. Find the average customer rating per vehicle type:
 Create View AVG_Cust_Rating As
 SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
 FROM [dbo].[bookingscsv]
 GROUP BY Vehicle_Type

 --#9. Calculate the total booking value of rides completed successfully:
 Create View total_successful_ride_value As
 SELECT SUM(Booking_Value) as total_successful_ride_value
 FROM [dbo].[bookingscsv]
 WHERE Booking_Status = 'Success';

 --#10. List all incomplete rides along with the reason:
 Create View Incomplete_Rides_Reason As
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM [dbo].[bookingscsv]
 WHERE Incomplete_Rides = 1

