-- members 1 : M bookings M : 1 facilities 
-- members M:M facilities

-- Filter in JOIN
SELECT DISTINCT CONCAT(m.firstname, ' ', m.surname) member, f.name
FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id
    JOIN post_exers.facilities f ON f.id = b.facility_id AND f.name LIKE '%Tennis Court%'
ORDER BY member;

-- Filter in Where, JOIN condition in ON
-- Для Inner Join - разницы нет. 
SELECT DISTINCT CONCAT(m.firstname, ' ', m.surname) member, f.name
FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id
    JOIN post_exers.facilities f ON f.id = b.facility_id
WHERE f.name LIKE '%Tennis Court%'
ORDER BY member;
