SELECT 
milliseconds, stop, year, round, races.name, drivers.code
FROM
pit_stops, races, drivers
WHERE
pit_stops.raceId = races.raceId
AND
pit_stops.driverId = drivers.driverId
AND
(
(pit_stops.driverId = 1 AND races.year >= 2017 AND races.year <= 2021)
OR 
(pit_stops.driverId = 20 AND (races.year = 2017 OR races.year = 2018))
OR 
(pit_stops.driverId = 822 AND (races.year = 2019 OR races.year = 2020))
OR 
(pit_stops.driverId = 830 AND races.year = 2021)
)
