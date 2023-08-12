SELECT * FROM ML.PREDICT(MODEL `capstonedataset.weatherpowerusage`,
(
  SELECT
    Date,
    CAST(Temp_max AS INT64) AS Temp_max,
    Hum_max,
    Wind_avg,
    Precipit
  FROM
  `capstone-395401.capstonedataset.weather_api`
))