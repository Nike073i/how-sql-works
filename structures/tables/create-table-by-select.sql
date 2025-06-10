-- Берет только схему. Никакие ограничения и прочие объекты - не копирует
CREATE TABLE post_exers.employers AS
SELECT m.id emp_id, m.firstname, m.surname, b.slots FROM post_exers.members m JOIN post_exers.bookings b ON m.id = b.member_id
WHERE 1 = 0;