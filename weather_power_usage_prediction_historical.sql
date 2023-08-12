SELECT * FROM ML.PREDICT(MODEL `capstonedataset.weatherpowerusage`,
(
  SELECT
    SUM(p.Value__kWh_) AS total_kwh_per_day,
    Temp_max,
    Hum_max,
    Wind_avg,
    Precipit
  FROM
  `capstone-395401.capstonedataset.PowerUsage` as p
  JOIN
  `capstone-395401.capstonedataset.weather` as w ON CAST (p.StartDate AS DATE) = w.Date
GROUP BY
  w.Date, w.Temp_max, w.Hum_max, w.Wind_avg, w.Precipit))