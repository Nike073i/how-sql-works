-- В какие дни не было заказов

-- LEFT JOIN + WHERE IS NULL
WITH gen AS (
    SELECT "date" 
    FROM generate_series(
        (SELECT MIN(start_time) FROM post_exers.bookings),
        (SELECT MAX(start_time) FROM post_exers.bookings),
        '1 day'
    ) AS "date"
)
SELECT DISTINCT "date"::date zero_day
FROM gen 
    LEFT JOIN post_exers.bookings b 
    ON DATE_TRUNC('day', gen."date") = DATE_TRUNC('day', b.start_time)
WHERE b.id IS NULL
ORDER BY zero_day;

-- EXCEPT
WITH gen AS (
    SELECT "date" 
    FROM generate_series(
        (SELECT MIN(start_time) FROM post_exers.bookings),
        (SELECT MAX(start_time) FROM post_exers.bookings),
        '1 day'
    ) AS "date"
)
SELECT (gen."date")::date zero_day FROM gen
EXCEPT
SELECT DISTINCT start_time::date FROM post_exers.bookings
ORDER BY zero_day; 