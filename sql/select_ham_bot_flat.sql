SELECT *
FROM lap_times_flat
WHERE
(driverId = 1 OR driverId = 822)
AND
(races_year >= 2017 AND races_year <= 2021)
