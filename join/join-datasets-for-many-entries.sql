-- Filter in JOIN
SELECT b.start_time start, f.name 
FROM post_exers.bookings b
    JOIN post_exers.facilities f 
    ON b.facility_id = f.id AND (b.start_time BETWEEN '2012-09-21' AND '2012-09-22') AND f.name ~ 'Tennis Court'
ORDER BY b.start_time;

-- Filter join-result (Old-style)
SELECT b.start_time start, f.name 
FROM post_exers.bookings b, post_exers.facilities f
WHERE b.facility_id = f.id AND (b.start_time BETWEEN '2012-09-21' AND '2012-09-22') AND f.name ~ 'Tennis Court'
ORDER BY b.start_time;

-- Filter in Where, JOIN condition in ON
-- Для INNER JOIN - разницы нет.
SELECT b.start_time start, f.name 
FROM post_exers.bookings b
    JOIN post_exers.facilities f ON b.facility_id = f.id
WHERE (b.start_time BETWEEN '2012-09-21' AND '2012-09-22') AND f.name ~ 'Tennis Court'
ORDER BY b.start_time;

-- Usage subquery. ВЫМЫШЛЕННЫЙ ПРИМЕР. Неоптимально. Под каждый подзапрос создаст временную таблицу. При объединении НЕ БУДУТ использоваться индексы (поскольку их нет)
-- Хоть современные версии Postgresql смогут заинлайнить, нет гарантии, что другие "заинлайнят"
SELECT b.start_time start, f.name 
FROM (
    SELECT start_time 
    FROM post_exers.bookings 
    WHERE start_time BETWEEN '2012-09-21' AND '2012-09-22') b 
JOIN (
    SELECT id, name 
    FROM post_exers.facilities 
    WHERE name ~ 'Tennis Court'
) f ON b.facility_id = f.id 
ORDER BY b.start_time;