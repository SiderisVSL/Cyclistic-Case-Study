--This query will insert data from 12 tables into the newly create table "annual_data_2024"

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
