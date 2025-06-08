-- using function
SELECT CONCAT(m.firstname, ' ', m.surname) member
FROM post_exers.members m;

-- using ||
SELECT m.firstname || ' ' || m.surname member
FROM post_exers.members m;