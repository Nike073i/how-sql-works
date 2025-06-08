-- IN
DELETE FROM post_exers.members
WHERE id NOT IN (
    SELECT DISTINCT member_id
    FROM post_exers.bookings
);

-- EXISTS
DELETE FROM post_exers.members m1
WHERE NOT EXISTS (
    SELECT 1
    FROM post_exers.bookings b
    WHERE m1.id = b.member_id
);