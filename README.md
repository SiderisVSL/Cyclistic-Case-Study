# CYCLISTIC - Differences between Casual Riders and Annual Members. 

This case study is an analysis for the integration of Coursera’s: Google Data Analytics Certificate (Case Study 1 | Cyclistic). 
Because Cyclistic is a fictional company, for the purpose of the course the data will be used dirived from a company named DIVVY.
The dataset is public and available by Motivate International Inc. under this [lisence](https://divvybikes.com/data-license-agreement) 


## Business Task
In the following analysis we will find differences between casual riders and annual(members). We will provide the stakeholders with these insights so the marketing team could use them in order to convert casual riders to annual members. 


## Ask

To better understand the differences between casual riders & annual members we have to answer some questions: 

* Percentage of casual riders / annual members
* Number of rides per day
* Average ride duration per day
* Ratio of bike type between casual riders / annual members
* Percentage of rides per month
* Peak time of riders (weekly)


## Prepare

The data is organized by month. We will use the last 12 months for the case study. 
All CSV files are containg 13 columns with data about bike rides. 
All 12 files of data will be stored to a master folder. 


## Process

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


## Analysis

### SQL Queries

The following images are screenshots of SQL code.
I used Google Cloud's Big Query data platform. 

#### Create Table
<img width="699" alt="Create Table" src="https://github.com/user-attachments/assets/876b3419-d332-4f6c-9f3a-069de319166a">

#### Insert 12 tables into 1
<img width="902" alt="Insert Tables (12)" src="https://github.com/user-attachments/assets/1bd5e2ea-3721-4d50-80b6-a27e8a8f61ae">

#### Percentage of Casual/Annual
<img width="1114" alt="per casual annual" src="https://github.com/user-attachments/assets/144e928d-9ac6-4b2c-8d6c-22dcdbc9b02c">

#### Daily Total Rides
<img width="774" alt="daily total rides" src="https://github.com/user-attachments/assets/6191d360-6231-4454-b6da-aa90bbfeb35b">

#### Monthly Total Rides
<img width="938" alt="Month total rides" src="https://github.com/user-attachments/assets/38914916-d343-432a-ba52-2d9d9486b39c">

#### Average Duration (seconds)
<img width="916" alt="average duration" src="https://github.com/user-attachments/assets/63cdd053-911f-4fcd-9743-8b64401a983f">

#### Ratio of bike type between Casual / Annual
<img width="1141" alt="ratio" src="https://github.com/user-attachments/assets/3d07b875-0973-462c-817a-d73652ce08cd">


### Charts












## Conclusions

The analysis of bike usage has revealed important facts about the behavior of casual riders and annual members.

1. Membership Distribution: The data shows that annual members make up a large portion of the entries at 64.31%, while casual users account for 35.69%. This indicates that annual memberships are more popular, with 3,582,156 annual members compared to 1,987,799 casual riders.
2. Preferences for Bicycle Types: Both groups show similar preferences for bike types. While there are differences in overall usage, casual users and members don’t have significant differences in the types of bikes they prefer.
   This suggests they enjoy similar experiences with the available bikes.
3. Day Usage Patterns: Casual users ride more on weekends, while annual members ride the most on Wednesdays. This difference may reflect their lifestyles, with casual riders using the service more for leisure activities at the end of the week.
4. Seasonal Trends: There is a clear seasonal pattern in usage, with peaks in June, July, and August, and lows in December, January, and February. This trend is consistent for both casual and annual users, highlighting how weather affects biking.
5. Average Ride Duration: Casual riders tend to spend more time riding per trip than annual members. For example, casual riders have an average ride duration of 54.36 seconds on Sundays, while annual members peak at 42.96 seconds on Saturdays.
   This suggests that casual riders enjoy longer rides during their leisure time.


### Overall, the analysis shows clear differences in trends and preferences between casual and annual bike users, indicating how membership type affects riding behavior, seasonal influences, and daily usage patterns. This information could be helpful for bike-sharing programs or city planners looking to improve user experience and boost ridership.





