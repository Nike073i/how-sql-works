-- Императивный подход. И в SELECT, и в WHERE используется похожие формулы (расчет цены) - cost. Дублирование логики
-- Это происходит из-за того, что WHERE до SELECT. 
-- Есть еще один способ - сформировать cost в выборке. Можно выполнить через LATERAL-подзапрос. Но не проверял по производительности
SELECT CONCAT (m.firstname, ' ', m.surname) member, f.name, (b.slots * CASE WHEN m.id = 0 THEN f.guestcost ELSE f.membercost END) cost
FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id AND DATE_TRUNC('day', b.start_time) = '2012-09-14'
    JOIN post_exers.facilities f ON f.id = b.facility_id
WHERE (b.slots * f.guestcost > 30 AND m.id = 0) OR (b.slots * f.membercost > 30 AND m.id != 0)
ORDER BY cost DESC;

-- Декларативный подход. Формирование данных - вложенный запрос. Обработка данных - внешний запрос 
SELECT member, name, cost
FROM (
    SELECT CONCAT (m.firstname, ' ', m.surname) member, f.name name, (b.slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) cost
    FROM post_exers.members m
    JOIN post_exers.bookings b ON m.id = b.member_id AND DATE_TRUNC('day', b.start_time) = '2012-09-14'
    JOIN post_exers.facilities f ON f.id = b.facility_id
)
WHERE cost > 30
ORDER BY cost DESC;


-- Императивный подход
-- Странно, но это работает: ORDER BY ссылается на `month`, определенный в SELECT
SELECT 
    facility_id, 
    EXTRACT(MONTH FROM start_time) "month", 
    SUM(slots) as "Total Slots"
FROM post_exers.bookings
WHERE DATE_TRUNC('year', start_time) = '2012-01-01'
GROUP BY facility_id, "month"
ORDER BY facility_id, "month";

-- Спорный момент. Вроде как не имеет смысла. 
-- Однако если потребуется расширить выходну проекцию - это будет проще добавить во внешний запрос, не меняя "внутрянку"
SELECT facility_id, "month", SUM(slots)
FROM (
    SELECT facility_id, EXTRACT(MONTH FROM start_time) "month", slots
    FROM post_exers.bookings
    WHERE DATE_TRUNC('year', start_time) = '2012-01-01'
)
GROUP BY facility_id, "month"
ORDER BY facility_id, "month";


-- Императивность. Появляется дублирование в HAVING. 
SELECT f.name, SUM(b.slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) revenue
FROM post_exers.bookings b JOIN post_exers.facilities f ON b.facility_id = f.id
GROUP BY name
HAVING SUM(b.slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) < 1000
ORDER BY revenue;

-- Декларативный подход
SELECT d.name, SUM(cost) revenue
FROM (
    SELECT f.name, (b.slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) cost 
    FROM post_exers.bookings b JOIN post_exers.facilities f ON b.facility_id = f.id
) d
GROUP BY d.name
HAVING SUM(cost) < 1000
ORDER BY revenue;
