-- Установка значения на верхнем уровне
SELECT JSONB_SET(json_data, '{list_price}', '0.0'::jsonb) FROM json_works;

-- Обнуление поля
SELECT JSONB_SET(json_data, '{list_price}', 'null'::jsonb) FROM json_works;

-- Удаление null-полей
SELECT JSONB_STRIP_NULLS(JSONB_SET(json_data, '{list_price}', 'null' :: jsonb)) FROM json_works;

-- Удаление поля (Верхний уровень)
SELECT json_data - 'color' FROM json_works;

-- Удаление поля по пути
SELECT json_data #- '{safety_stock,reorder_point}' FROM json_works;

-- Удаление элемента массива
SELECT json_data #- '{size_and_weight,1}' FROM json_works;