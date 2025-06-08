-- Строчка с суммой по группе, в рамках погруппы...
SELECT facility_id, EXTRACT(MONTH FROM start_time) "month", SUM(slots), MAX(slots)
FROM post_exers.bookings
WHERE DATE_TRUNC('year', start_time) = '2012-01-01'
GROUP BY ROLLUP(facility_id, "month")
ORDER BY facility_id, "month";

-- facility_id month   slots
-- 0           7       270
-- 0           8       459
-- 0           9       591
-- 0           NULL    1320
-- ...
-- 8           NULL    910
-- NULL        NULL    9191
