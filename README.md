# Cyclistic-Case-Study
This case study is an analysis for the integration of Coursera’s: Google Data Analytics Certificate (Case Study 1 | Cyclistic).
Because Cyclistic is a fictional company, for the purpose of the course the data will be used dirived from a company named DIVVY. 

Case Study: CYCLISTIC - Differences between Casual Riders and Annual Members. 

This case study is an analysis for the integration of Coursera’s: Google Data Analytics Certificate (Case Study 1 | Cyclistic). 
Because Cyclistic is a fictional company, for the purpose of the course the data will be used dirived from a company named DIVVY. 



Business Task

In the following analysis we will find differences between casual riders and annual(members). We will provide the stakeholders with these insights so the marketing team could use them in order to convert casual riders to annual members. 

Ask

To better understand the differences between casual riders & annual members we have to answer some questions: 

* Percentage of casual riders / annual members
* Number of rides per day
* Average ride duration per day
* Ratio of bike type between casual riders / annual members
* Percentage of rides per month
* Peak time of riders (weekly)


Prepare

The dataset is public and available by Motivate International Inc. under this license.
The data is organized by month. We will use the last 12 months for the case study. 
All CSV files are containg 13 columns with data about bike rides. 
All 12 files of data will be stored to a master folder. 


Process

* Check for duplicates in ride_id column and remove if there are some. 
* Data Validation at columns:
rideable_type
member_casual
* Remove unwanted columns. Columns such as: 
ride_id
start_station_name
start_station_id
end_station_name 
end_station_id
start_lat
start_lng
end_lat
end_lng
* Split timestamps columns into new columns with the following names:
started_date
started_time
started_day
started_month
ended_date
ended_time
ended_day
ended_month

* Add a new column “ride_duration” with the duration of each ride. The ride_duration column will be the result of the subtraction of the columns:
ended_time - started_time
With the new column created we can easily spot faults of the riding time. For example we can see that there are too many ride durations under one minute. We will assume these as corrupted data and all the rows will be deleted. In the other hand, checking for the longest ride duration, which is 59m58s (202408-divvy-tripdata) we can assume that this number is totally fine.  


* Our new cleaned datasets would be contain 11 columns in the exact order:

- rideable_type
- member_casual
- ride_duration
- started_date
- started_time
- started_day
- started_month
- ended_date
- ended_time
- ended_day
- ended_month


Analysis


Create Table  

CREATE TABLE `vproject77.Cyclistic.annual_data_2024`
(
  rideable_type STRING,
  member_casual STRING,
  ride_duration TIME,
  started_date DATE,
  started_time TIME,
  started_day STRING,
  started_month STRING,
  ended_date DATE,
  ended_time TIME,
  ended_day STRING,    
  ended_month STRING   
);


Insert Tables(12)  

INSERT INTO `vproject77.Cyclistic.annual_data_2024`
SELECT * FROM `vproject77.Cyclistic.202309`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202310`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202311`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202312`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202401`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202402`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202403`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202404`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202405`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202406`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202407`
UNION ALL
SELECT * FROM `vproject77.Cyclistic.202408`;


Per. Casual/Annual  

select 
  member_casual as member_type,
  count(*) as total_rides,
  round ( count(*) * 100 / (select count(*) from `vproject77.Cyclistic.annual_data_2024`), 2) as riders_percentage

from `vproject77.Cyclistic.annual_data_2024`

group by member_casual

Month Total Rides  

SELECT 
  started_month as Month,
  member_casual as member_type,
  count(*) as Month_Rides

FROM
  `vproject77.Cyclistic.annual_data_2024`

GROUP BY 
  member_casual,
  started_month

ORDER BY 
  CASE 
    WHEN started_month = 'January' THEN 1
    WHEN started_month = 'February' THEN 2
    WHEN started_month = 'March' THEN 3
    WHEN started_month = 'April' THEN 4
    WHEN started_month = 'May' THEN 5
    WHEN started_month = 'June' THEN 6
    WHEN started_month = 'July' THEN 7
    WHEN started_month = 'August' THEN 8
    WHEN started_month = 'September' THEN 9
    WHEN started_month = 'October' THEN 10
    WHEN started_month = 'November' THEN 11
    WHEN started_month = 'December' THEN 12
  END,
  member_casual;


Day Total Rides  

SELECT 
  started_day as Weekday,
  member_casual as member_type,
  count(*) as Day_Rides

FROM
  `vproject77.Cyclistic.annual_data_2024`

GROUP BY 
  member_casual,
  started_day

ORDER BY 
  CASE 
    WHEN started_day = 'Monday' THEN 1
    WHEN started_day = 'Tuesday' THEN 2
    WHEN started_day = 'Wednesday' THEN 3
    WHEN started_day = 'Thursday' THEN 4
    WHEN started_day = 'Friday' THEN 5
    WHEN started_day = 'Saturday' THEN 6
    WHEN started_day = 'Sunday' THEN 7
  END,
  member_casual;

Average Duration (sec)

SELECT 
  member_casual as member_type,
  ROUND(AVG(EXTRACT(HOUR from ride_duration) * 60 + 
      EXTRACT(MINUTE from ride_duration) + 
      EXTRACT(SECOND from ride_duration)), 2) AS avg_duration_sec,
  started_day AS Weekday
FROM 
  `vproject77.Cyclistic.annual_data_2024`
GROUP BY 
  member_casual, 
  started_day
ORDER BY
  CASE 
    WHEN started_day = 'Monday' THEN 1
    WHEN started_day = 'Tuesday' THEN 2
    WHEN started_day = 'Wednesday' THEN 3
    WHEN started_day = 'Thursday' THEN 4
    WHEN started_day = 'Friday' THEN 5
    WHEN started_day = 'Saturday' THEN 6
    WHEN started_day = 'Sunday' THEN 7
  END;


Ratio of bike type between casual riders / annual members

select 
  rideable_type as bike_type,
  member_casual as member_type,
  count(*) as total_rides,
  round ( count(*) * 100 / (select count(*) from `vproject77.Cyclistic.annual_data_2024`), 2) as riders_percentage

from `vproject77.Cyclistic.annual_data_2024`

group by member_casual, rideable_type







