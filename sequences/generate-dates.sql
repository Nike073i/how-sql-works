SELECT date FROM generate_series(timestamp '2012-07-10', '2012-08-31','1 day') date;

-- Генерация таблицы кол-ва дней в месяцах
SELECT 
    EXTRACT(month FROM gen."date") "month", 
    EXTRACT(day from (gen."date" + '1 months' - gen."date")) length 
FROM (
    SELECT "date" FROM generate_series('2012-01-01'::timestamp, '2012-12-31', '1 month') date
) gen 
ORDER BY "month";