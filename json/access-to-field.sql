-- Как JSON или NULL
SELECT json_data -> 'color' FROM json_works;

-- Как значение или NULL
SELECT json_data ->> 'colors' FROM json_works;

-- Проверка существования ключа (На верхнем уровне)
SELECT json_data ? 'key' FROM json_works;

-- Проверка существования ключа по JSONPATH
SELECT JSONB_PATH_EXISTS(json_data, '$.**.reorder_point') FROM json_works;

-- Многовложенный доступ
SELECT (json_data -> 'safety_stock') ->> 'reorder_point' FROM json_works;

-- Длина массива
SELECT JSONB_ARRAY_LENGTH(json_data -> 'size_and_weight') FROM json_works;

-- Индексация по массиву (с 0)
SELECT ((json_data -> 'size_and_weight') ->> 1)::float FROM json_works;

-- Проверка вхождения элемента в массив
SELECT (json_data -> 'size_and_weight') ? '2.80' FROM json_works;