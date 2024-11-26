--This query will give us results about the monthly total rides of the two groups of riders. 

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