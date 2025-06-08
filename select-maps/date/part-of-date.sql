-- Взять номер месяца (константа)
SELECT EXTRACT(MONTH FROM TIMESTAMP '2000-12-16');

-- Взять номер месяца (поле таблицы)
SELECT EXTRACT(MONTH FROM start_time);
