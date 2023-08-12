CREATE OR REPLACE MODEL `capstonedataset.weatherpowerusage`
OPTIONS
  (model_type='linear_reg', input_label_cols=['total_kwh_per_day'], MAX_ITERATIONS=20) AS
SELECT
  SUM(p.Value__kWh_) AS total_kwh_per_day,
  Temp_max,
  Hum_max,
  Wind_avg,
  Precipit
FROM 
    `capstone-395401.capstonedataset.PowerUsage` AS p
JOIN 
    `capstone-395401.capstonedataset.weather` AS w ON CAST(p.StartDate AS DATE) = w.Date
GROUP BY 
    w.Date, w.Temp_max, w.Hum_max, w.Wind_avg, w.Precipit