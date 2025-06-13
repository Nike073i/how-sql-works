-- Выбрать 0-ой элементы в каждом массиве. Если индекса нет - NULL
SELECT contact_number[1] FROM post_exers.employee_info;

-- Конкатенация массивов
SELECT ARRAY ['red', 'green'] || '{"blue"}'::text[]; -- {'red', 'green', 'blue'}

-- Разворачивание массива рядом со скалярными значениями
SELECT employee_id, UNNEST(contact_number) FROM post_exers.employee_info;

--  employee_id |    unnest     
-- -------------+---------------
--            2 | +79176399217
--            2 | +79176399218
--            2 | NULL
--            1 | +798456412413
--            1 | +798453412413
--            1 | NULL
--            1 | +794456412413

-- Zip массивов. (1, 4), (2,5). Кол-во записей равно длине самого большого массива. Там где не будет пары - будет NULL
SELECT * FROM UNNEST(ARRAY['1', '2', '3'], ARRAY['4','5','6','7']) x(a, b);