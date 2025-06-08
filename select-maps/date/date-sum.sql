-- Перегруженный оператор.
SELECT '2012-09-13 02:00'::timestamp + '1 years 2 months 3 days 4 hours 5 minutes';

-- Интервал из переменных
SELECT slots, start_time, (slots * interval '30 minutes' + start_time) end_time
FROM post_exers.bookings
ORDER BY end_time DESC, start_time DESC
LIMIT 10;