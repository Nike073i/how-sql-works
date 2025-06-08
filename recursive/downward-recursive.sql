-- Распространение приглашений сверху вних. (Родитель - может иметь несколько записей)
WITH RECURSIVE invites (id) AS 
(
  SELECT id
  FROM post_exers.members
  WHERE recommended_by = 1
  UNION ALL

  SELECT m.id
  FROM post_exers.members m JOIN invites i ON i.id = m.recommended_by
)
SELECT m.id, m.firstname, m.surname, m.recommended_by 
FROM invites i JOIN post_exers.members m ON i.id = m.id 
ORDER BY id;
