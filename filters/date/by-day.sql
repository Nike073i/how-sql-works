-- usage range for 2 days
SELECT id, start_time 
FROM post_exers.bookings
WHERE start_time BETWEEN '2012-09-21' AND '2012-09-22';

-- cast datetime to date
SELECT id, start_time 
FROM post_exers.bookings
WHERE start_time::date = '2012-09-21';

-- truncate to day
SELECT id, start_time 
FROM post_exers.bookings
WHERE DATE_TRUNC('day', start_time) = '2012-09-21';
