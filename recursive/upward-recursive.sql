-- Получить данные о пользователе с рекомендательной цепочкой (У записи - 1 родитель)
WITH RECURSIVE recommends (id, recommended_by) AS 
(
  SELECT id, recommended_by
  FROM post_exers.members
  WHERE id = 27
  UNION ALL

  SELECT m.id, m.recommended_by
  FROM post_exers.members m JOIN recommends r ON m.id = r.recommended_by
)
SELECT m.id, m.firstname, m.surname, r.recommended_by FROM recommends r JOIN post_exers.members m ON r.id = m.id;

-- Адаптация запроса под переиспользование. Цепочку приглашений можно отслежить по полю stream. По ней выполняется поиск нужных людей
WITH RECURSIVE recommends (source_id, iter_id, recommended_by) AS (
    SELECT id, id, recommended_by
    FROM post_exers.members

    UNION ALL

    SELECT r.source_id, m.id, m.recommended_by
    FROM post_exers.members m JOIN recommends r ON m.id = r.recommended_by
)
SELECT m.id, m.surname, m.firstname, r.source_id "stream" FROM post_exers.members m JOIN recommends r ON m.id = r.iter_id
WHERE r.source_id IN (12, 22,27)
ORDER BY "stream", id;
