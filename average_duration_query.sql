--This query will give us results about the average duration of rides between the two groups. 

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