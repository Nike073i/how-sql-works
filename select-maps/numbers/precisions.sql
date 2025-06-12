-- Округление через ROUND. Но, поскольку slots - целочисленное, нужно сначала преобразовать в numeric (иначе будет целочисленное деление)
SELECT f.id, f.name, "Total Hours"
FROM (
    SELECT facility_id, ROUND(SUM(slots)::numeric / 2, 2) "Total Hours"
    FROM post_exers.bookings
    GROUP BY facility_id
) d 
    JOIN post_exers.facilities f ON d.facility_id = f.id
ORDER BY f.id;

-- Округление до сотен (по математическим правилам)
SELECT ROUND(1234, -2);
