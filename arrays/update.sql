-- Обновление конкретного значения
-- Если размер массива меньше - расширит до 10, заполнив элементы NULL и установит элемент по индексу 10
UPDATE post_exers.employee_info 
SET contact_number[10] = '+798456412313'
WHERE employee_id = 1;

-- Замена массива
UPDATE post_exers.employee_info 
SET contact_number = '{ "+798456412413", "+798453412413" }'
WHERE employee_id = 1;

-- Замена слайса [start, end]
UPDATE post_exers.employee_info 
SET contact_number[4:6] = '{ "+794456412413", "+795453412413", "+796453412413" }'
WHERE employee_id = 1;

-- Замена элементов по соответствию значению
UPDATE post_exers.employee_info 
SET contact_number = ARRAY_REPLACE(contact_number, '+794456412413', '+97176399217')
WHERE employee_id = 1;