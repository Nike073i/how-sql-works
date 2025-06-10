-- Удалить дубликаты по конкретному полю, оставив лишь 1 запись
DELETE FROM post_exers.facilities 
WHERE id NOT IN (SELECT MIN(id) FROM post_exers.facilities GROUP BY name);