SELECT * 
FROM post_exers.facilities
WHERE id IN (1, 5);

-- or

SELECT * 
FROM post_exers.facilities
WHERE name IN ('value1', 'value2');

-- or (Эффективен при малом количестве строк во второстепенной таблице)
SELECT * 
FROM post_exers.facilities
WHERE id IN (
    SELECT DISTINCT facility_id 
    FROM post_exers.bookings
);

-- or (Выполняет "быструю проверку", не обходя всех элементов)
SELECT * 
FROM post_exers.facilities f
WHERE EXISTS (
    SELECT 1 
    FROM post_exers.bookings b
    WHERE f.id = b.facility_id
);