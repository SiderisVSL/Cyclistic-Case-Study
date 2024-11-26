--This query will give us results about the ratio between casual riders and annual members. 

select 
  rideable_type as bike_type,
  member_casual as member_type,
  count(*) as total_rides,
  round ( count(*) * 100 / (select count(*) from `vproject77.Cyclistic.annual_data_2024`), 2) as riders_percentage

from `vproject77.Cyclistic.annual_data_2024`

group by member_casual, rideable_type
