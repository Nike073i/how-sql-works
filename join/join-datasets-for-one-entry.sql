-- subquering
SELECT start_time
FROM post_exers.bookings
WHERE member_id = (
    SELECT id 
    FROM post_exers.members
    WHERE firstname = 'David' AND surname = 'Farrell'
    LIMIT 1 -- Хак
);

-- join (Рекомендация)
SELECT start_time
FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id
WHERE m.firstname = 'David' AND surname = 'Farrell';

-- По скорости +- одинаково. Однако при подзапросе есть риск "упасть" в случае, когда вернется несколько id 

-- Коррелирующий подзапрос
SELECT 
    CONCAT(firstname, ' ', surname) member, 
    (
        SELECT CONCAT(firstname, ' ', surname) FROM post_exers.members WHERE id = m.recommended_by
    ) as recommender
FROM post_exers.members m 
ORDER BY member;