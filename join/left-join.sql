-- Условие фильтра помещаем в ON, поскольку используется LEFT JOIN: WHERE удалит все услуги, которые не попали в JOIN
SELECT f.id, COALESCE(SUM(b.slots), 0) "Total Slots" 
FROM post_exers.facilities f 
LEFT JOIN post_exers.bookings b
    ON f.id = b.facility_id AND DATE_TRUNC('month', b.start_time) = '2012-09-01'
GROUP BY f.id ORDER BY "Total Slots";
