-- Выполнить агрегации в одном запросе, а формирование результата - во внешнем
SELECT f.id, f.name, "Total Hours"
FROM (
    SELECT facility_id, SUM(slots)::numeric / 2 "Total Hours"
    FROM post_exers.bookings
    GROUP BY facility_id
) d 
    JOIN post_exers.facilities f ON d.facility_id = f.id
ORDER BY f.id;

-- Выполнить группировку по 2-м полям (нерекомендованно)
SELECT f.id, f.name, SUM(b.slots)::numeric / 2 "Total Hours"
FROM post_exers.facilities f
    JOIN post_exers.bookings b ON b.facility_id = f.id
GROUP BY f.id, f.name
ORDER BY f.id;

-- (Пример расширения запроса, которое НЕДОСТУПНО при втором подходе)
SELECT m.firstname, m.surname, d.hours, RANK() OVER(ORDER BY d.hours DESC)
FROM post_exers.members m JOIN (
    SELECT member_id, ROUND(SUM(slots)::numeric / 2, -1) hours
    FROM post_exers.bookings
    GROUP BY member_id
) d ON m.id = d.member_id
ORDER BY rank, surname, firstname;

-- Пример, где **придется** использовать двойной JOIN на одну и ту-же таблицу. Либо - добавлять поля initial_outlay, name, monthly_maintenance в группировку
SELECT f.name, (f.initial_outlay::numeric / NULLIF(d.revenue::numeric / 3 - f.monthly_maintenance, 0)) months
FROM post_exers.facilities f
   JOIN (
    SELECT facility_id, SUM(slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) revenue
    FROM post_exers.bookings b JOIN post_exers.facilities f ON f.id = b.facility_id
    GROUP BY facility_id
   ) d ON d.facility_id = f.id
ORDER BY f.name;
