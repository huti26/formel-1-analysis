SELECT 
statusId, year, round, races.name, drivers.code
FROM
results, races, drivers
WHERE
results.raceId = races.raceId
AND
results.driverId = drivers.driverId
AND
(results.driverId = 1 OR results.driverId = 822)
AND
races.year >= 2017 AND races.year <= 2021
