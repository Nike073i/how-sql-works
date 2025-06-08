SELECT id, name, membercost, guestcost, initial_outlay, monthly_maintenance
FROM post_exers.facilities
WHERE name LIKE '%Tennis%';

-- case-insensitive LIKE
SELECT id, name, membercost, guestcost, initial_outlay, monthly_maintenance
FROM post_exers.facilities
WHERE name ILIKE 'tennis%';

-- or
SELECT id, name, membercost, guestcost, initial_outlay, monthly_maintenance
FROM post_exers.facilities
WHERE name ~ 'Tennis';
