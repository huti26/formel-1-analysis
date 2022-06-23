SELECT 
lap_times.raceId, lap_times.driverId, lap_times.lap, lap_times.position, lap_times.milliseconds, 
races.year, races.round, races.name, races.date,
drivers.code, drivers.forename, drivers.surname, drivers.dob, drivers.nationality,
circuits.name, circuits.country
FROM
lap_times, races, drivers, circuits
WHERE
(lap_times.driverId = 1 OR lap_times.driverId = 822)
AND
lap_times.driverId = drivers.driverId
AND
lap_times.raceId = races.raceId
AND
races.circuitId = circuits.circuitId
