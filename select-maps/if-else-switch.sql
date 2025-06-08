SELECT 
    name,
    CASE
        WHEN monthtly_maintenance < 100 THEN 'cheap'
        ELSE 'expensive'
    END cost
FROM post_exers.facilities;

-- Operation with switch
SELECT (b.slots * CASE WHEN m.id = 0 THEN f.guestcost ELSE f.membercost END) cost
FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id
    JOIN post_exers.facilities f ON f.id = b.facility_id;