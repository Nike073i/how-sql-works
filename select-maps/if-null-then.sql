SELECT f.id, COALESCE(SUM(b.slots), 0) "Total Slots" 
FROM post_exers.facilities f 
LEFT JOIN post_exers.bookings b
    ON f.id = b.facility_id 
GROUP BY f.id 
ORDER BY f.id;