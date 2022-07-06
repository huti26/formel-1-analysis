SELECT 
positionOrder, year, round, races.name, drivers.code
FROM
results, races, drivers
WHERE
results.raceId = races.raceId
AND
results.driverId = drivers.driverId
AND
(
(results.driverId = 1 AND races.year >= 2017 AND races.year <= 2021)
OR 
(results.driverId = 20 AND (races.year = 2017 OR races.year = 2018))
OR 
(results.driverId = 822 AND (races.year = 2019 OR races.year = 2020))
OR 
(results.driverId = 830 AND races.year = 2021)
)
