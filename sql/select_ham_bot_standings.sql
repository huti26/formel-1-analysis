SELECT 
points, year, round, code
FROM
driver_standings, races, drivers
WHERE
driver_standings.raceId = races.raceId
AND
driver_standings.driverId = drivers.driverId
AND
(races.year >= 2017 AND races.year <= 2021)
AND
(drivers.driverId = 1 OR drivers.driverId = 822)
