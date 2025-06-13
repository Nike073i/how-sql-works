-- Использование конкретного значения
SELECT employee_id, contact_number
FROM post_exers.employee_info
WHERE contact_number[1] LIKE '%11';

-- Вхождение значения в массив
SELECT employee_id, contact_number
FROM post_exers.employee_info
WHERE '+79176399217' = ANY(contact_number);