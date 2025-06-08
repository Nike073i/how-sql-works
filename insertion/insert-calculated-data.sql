-- ВЫМЫШЛЕННЫЙ ПРИМЕР. Простой запрос с "генерацией" Id
INSERT INTO post_exers.facilities (id, name, membercost, guestcost, initial_outlay, monthly_maintenance) 
SELECT MAX(id) + 1, 'SPA_2', 20, 30, 100000, 800 FROM post_exers.facilities;