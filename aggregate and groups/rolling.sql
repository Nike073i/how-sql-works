-- Расчет средней выручки за 15 дней в августе = Текущий и 14 до.

-- Не во всех днях были брони
WITH gen_dates AS (
    SELECT "date" FROM generate_series(timestamp '2012-07-01', '2012-08-31','1 day') "date"
)
-- Этот внешний запрос нужен для фильтрации только августовских записей. Убрать - нельзя, поскольку иначе среднее значение будет считаться не с июля, а с августа
SELECT "date"::date, ROUND(revenue, 2) avg_revenue
FROM (
    SELECT gen_dates."date", AVG(revenue) OVER (ORDER BY gen_dates."date" ROWS 14 PRECEDING ) revenue
    FROM gen_dates
        LEFT JOIN 
        (
            SELECT DATE_TRUNC('day', b.start_time) "date", SUM(slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) revenue
            FROM post_exers.bookings b JOIN post_exers.facilities f ON b.facility_id = f.id
            GROUP BY DATE_TRUNC('day', b.start_time)
        ) bookings ON bookings."date" = gen_dates."date"
)
WHERE DATE_TRUNC('month', "date" ) = '2012-08-01'
ORDER BY "date";
