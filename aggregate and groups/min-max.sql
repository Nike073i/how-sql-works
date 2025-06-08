-- only one max (only one field)
SELECT MAX(join_at)
FROM post_exers.members;

-- or few max
SELECT join_at
FROM post_exers.members
ORDER BY join_at DESC
LIMIT 5;

-- or skip first and take next (only one field)
SELECT MAX(join_at)
FROM post_exers.members
WHERE join_at < (
    SELECT MAX(join_at) FROM post_exers.members
);

--or skip n and take m
SELECT join_at
FROM post_exers.members
ORDER BY join_at DESC
LIMIT 2
OFFSET 4;

-- or use CTE. Особенность этого подхода в том, что в случае нескольких лидеров - будут возвращены все лидеры, а не только 1
WITH sum as (
    SELECT facility_id, SUM(slots) total
    FROM post_exers.bookings
    GROUP BY facility_id
)
SELECT facility_id, total
FROM sum
WHERE total = (SELECT MAX(total) FROM sum);

-- or use window function. Особенность этого подхода в том, что в случае нескольких лидеров - будут возвращены все лидеры, а не только 1
SELECT facility_id, total
FROM (
    SELECT facility_id, SUM(slots) total, RANK() OVER(ORDER BY SUM(slots) DESC) "rank"
    FROM post_exers.bookings
    GROUP BY facility_id
)
WHERE "rank" = 1;

-- another example with window_function. Top 3
SELECT d.name, d."rank"
FROM (
    SELECT 
        f.name, 
        DENSE_RANK() OVER(ORDER BY SUM(slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) DESC) "rank"
    FROM post_exers.facilities f
        JOIN post_exers.bookings b ON f.id = b.facility_id
    GROUP BY f.id, f.name
) d
WHERE d."rank" <= 3
ORDER BY d."rank";

-- get additional info with aggregate
SELECT m.surname, m.firstname, m.id, d.start_time
FROM (
    SELECT member_id, MIN(b.start_time) start_time
    FROM post_exers.bookings b
    WHERE DATE_TRUNC('month', b.start_time) >= '2012-09-01'
    GROUP BY member_id
) d JOIN post_exers.members m ON d.member_id = m.id
ORDER BY m.id;
