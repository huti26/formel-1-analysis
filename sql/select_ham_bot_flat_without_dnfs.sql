SELECT 
lap_times.raceId, lap_times.driverId, lap_times.lap, lap_times.position, lap_times.milliseconds, 
races.year, races.round, races.name, races.date,
drivers.code, drivers.forename, drivers.surname, drivers.dob, drivers.nationality,
circuits.name, circuits.country,
results.statusId
FROM
lap_times, races, drivers, circuits, results
WHERE
(lap_times.driverId = 1 OR lap_times.driverId = 822)
AND
results.statusId = 1
AND
(year >= 2017 AND year <= 2021)
AND
lap_times.driverId = drivers.driverId
AND
lap_times.raceId = races.raceId
AND
races.circuitId = circuits.circuitId
AND
results.raceId = lap_times.raceId
AND
results.driverId = lap_times.driverId
