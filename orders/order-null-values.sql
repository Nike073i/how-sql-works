-- Встроенный функционал
SELECT id, recommended_by FROM post_exers.members ORDER BY recommended_by NULLS FIRST; -- LAST

-- Кастомное решение
SELECT id, CASE WHEN recommended_by IS NULL THEN 1 ELSE 0 END is_null, recommended_by
FROM post_exers.members
ORDER BY is_null DESC; -- DESC - First, ASC - Last
