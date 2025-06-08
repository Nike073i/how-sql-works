UPDATE post_exers.facilities
SET guestcost = another.guestcost * 1.1, membercost = another.membercost * 1.1
FROM (SELECT guestcost, membercost FROM post_exers.facilities WHERE id = 0) another
WHERE id = 1;