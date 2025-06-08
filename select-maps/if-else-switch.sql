SELECT 
    name,
    CASE
        WHEN monthly_maintenance < 100 THEN 'cheap'
        ELSE 'expensive'
    END cost
FROM post_exers.facilities;

-- Или, если подходит - Х, иначе - NULL
SELECT 
    start_time,
    CASE
        WHEN start_time >= '2012-09-02' THEN 'new'
    END mark
FROM post_exers.bookings
WHERE DATE_TRUNC('month', start_time) = '2012-09-01';

-- Operation with switch
SELECT (b.slots * CASE WHEN m.id = 0 THEN f.guestcost ELSE f.membercost END) cost
FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id
    JOIN post_exers.facilities f ON f.id = b.facility_id;