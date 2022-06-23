SELECT *
FROM
results, races
WHERE
results.raceId = races.raceId
AND
(results.driverId = 1 OR results.driverId = 822)
AND
races.year >= 2017 AND races.year <= 2021
AND
results.statusId != 1