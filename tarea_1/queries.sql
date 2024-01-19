-- Question 3
SELECT
COUNT(*) count
FROM yellow_taxi_data
WHERE lpep_pickup_datetime >= '2019-09-18 00:00:00' 
AND lpep_dropoff_datetime < '2019-09-19 00:00:00';

/*
 *  count|
 *  -----+
 *  5612 |
 */


-- Question 4
SELECT
DATE(lpep_pickup_datetime) "date",
MAX(trip_distance) max_trip_distance
FROM yellow_taxi_data
GROUP BY "date"
ORDER BY max_trip_distance DESC
LIMIT 1;

/*
 * date      |max_trip_distance|
 * ----------+-----------------+
 * 2019-09-26|           341.64|
 */


-- Question 5
SELECT
z."Borough",
COUNT(*) "trips"
FROM 
yellow_taxi_data t
JOIN zones z ON t."PULocationID" = z."LocationID"
WHERE DATE(t.lpep_pickup_datetime) = '2019-09-18'
GROUP BY z."Borough"
ORDER BY "trips" desc
LIMIT 3;

/*
 * Borough  |trips|
 * ---------+-----+
 * Manhattan| 5575|
 * Brooklyn | 4458|
 * Queens   | 4393| 
 */


-- Question 6
SELECT 
 doz."Zone" dropoff_zone, t.tip_amount 
FROM yellow_taxi_data t
JOIN zones puz ON t."PULocationID" = puz."LocationID"
JOIN zones doz ON t."DOLocationID" = doz."LocationID" 
	WHERE EXTRACT(month from t.lpep_pickup_datetime) = 9
	AND EXTRACT(year from t.lpep_pickup_datetime) = 2019
	AND puz."Zone" = 'Astoria'
	ORDER BY t.tip_amount DESC 
LIMIT 1;
/*
 * dropoff_zone|tip_amount|
 * ------------+----------+
 * JFK Airport |     62.31|
 */


-- Question 6 (w/o joins for fun :D)
SELECT "Zone" FROM zones WHERE "LocationID" =
(
	SELECT 
	t."DOLocationID"
		FROM yellow_taxi_data t
		WHERE EXTRACT(month from t.lpep_pickup_datetime) = 9
		AND EXTRACT(year from t.lpep_pickup_datetime) = 2019
		AND t."PULocationID" = (
			SELECT z."LocationID"  FROM zones z WHERE z."Zone"  = 'Astoria'
		)
		ORDER BY t.tip_amount DESC 
	LIMIT 1
);

/**
 * Zone       |
 * -----------+
 * JFK Airport|
 */

