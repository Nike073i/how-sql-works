-- after
SELECT id, surname, firstname, join_at 
FROM post_exers.members
WHERE join_at >= '2012-09-01';

-- before
SELECT id, surname, firstname, join_at 
FROM post_exers.members
WHERE join_at < '2012-09-01';

-- in range
SELECT id, surname, firstname, join_at 
FROM post_exers.members
WHERE join_at BETWEEN '2012-09-01' AND '2012-09-30';