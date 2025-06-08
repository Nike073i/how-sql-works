-- На выходе тип - интервал
-- Функция AGE. Сначала end, затем - start
SELECT AGE('2012-09-13 02:00'::timestamp,'2012-09-12 01:01'::timestamp);

-- Перегруженные операторы (Тот-же AGE)
SELECT '2012-09-13 02:00'::timestamp - '2012-09-12 01:01'::timestamp;

-- Интервал в нужном измерении (например - в секундах)
SELECT EXTRACT(epoch from ('2012-09-13'::timestamp - '2012-09-12'::timestamp))

-- Сколько дней осталось в этом месяце. Включая сегодняшний. Интервал
WITH d as (SELECT now() "date")
SELECT (DATE_TRUNC('month', d."date") + '1 month' - DATE_TRUNC('day', d."date")) remaining FROM d;
