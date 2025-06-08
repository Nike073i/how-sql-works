-- Подсчет кол-ва дней, в которых была хотя бы одна продажа в конкретном месяце
SELECT 
    COUNT(DISTINCT DATE_TRUNC('day', start_time)) 
FROM post_exers.bookings 
WHERE DATE_TRUNC('month', start_time) = '2012-08-01'; 