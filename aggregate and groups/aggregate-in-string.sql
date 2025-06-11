-- Какие услуги заказывал каждый пользователь с выводом `id: Перечь услуг`
SELECT member_id, STRING_AGG(name, ', ' ORDER BY name)
FROM (
    SELECT DISTINCT b.member_id, f.name
    FROM post_exers.bookings b JOIN post_exers.facilities f ON f.id = b.facility_id
)
GROUP BY member_id
ORDER BY member_id;