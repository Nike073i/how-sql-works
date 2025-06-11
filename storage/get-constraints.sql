-- Все ограничения
SELECT constraint_name, table_name, constraint_type FROM information_schema.table_constraints;

-- Только PK, FK и Unique
SELECT constraint_name, table_name, column_name FROM information_schema.key_column_usage WHERE table_schema = 'post_exers';

-- Только FK
SELECT constraint_name, unique_constraint_name, update_rule, delete_rule FROM information_schema.referential_constraints WHERE constraint_schema = 'post_exers';