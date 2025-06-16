-- Contraints использовать НЕЛЬЗЯ! Если нужны ограничения - создаем нужный Domain
CREATE TYPE post_exers.address AS (
    city post_exers.text_notnull, 
    street post_exers.text_notnull, 
    house int
);

-- Добавление поля в тип:
ALTER TYPE post_exers.address ADD ATTRIBUTE employee_number INT;

-- удаление поля типа
ALTER TYPE post_exers.address DROP ATTRIBUTE employee_number;

-- переименование типа
ALTER TYPE post_exers.address RENAME TO adr;

-- Удаление типа
DROP TYPE post_exers.adr;