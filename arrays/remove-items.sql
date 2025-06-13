-- Удалить все соответствия по значению. Заменит на NULL
UPDATE post_exers.employee_info 
SET contact_number = ARRAY_REMOVE(contact_number, '+798456412413')
WHERE employee_id = 1;