-- Для работы с таблицей дается представление с разрешенными столбцами
-- В отличии от ограничения через GRANT, можно применить фильтры + все в 1 месте - VIEW

CREATE OR REPLACE VIEW post_exers.members_info AS 
SELECT id, surname, firstname FROM post_exers.members
WhERE id != 0;
