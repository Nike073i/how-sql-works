-- Нужно подсчитать агрегатки и вывести их с каждой строчкой данных

-- Декартово произведение (CROSS JOIN)
SELECT agg.count, firstname, surname
FROM post_exers.members, 
    (SELECT COUNT(id) count FROM post_exers.members) agg
ORDER BY join_at;

-- Оконная функция на всю выборку
SELECT COUNT(*) OVER(), firstname, surname
FROM post_exers.members
ORDER BY join_at;

-- Агрегация в рамках окна (c Накопительным эффектом, поскольку применяется к агрегатке с ORDER BY)
SELECT 
    COUNT(*) OVER(PARTITION BY DATE_TRUNC('month', join_at) ORDER BY join_at), 
    firstname, 
    surname
FROM post_exers.members
ORDER BY join_at;
