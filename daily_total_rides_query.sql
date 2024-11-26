--This query will give us results about total rides daily between the two groups. 

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