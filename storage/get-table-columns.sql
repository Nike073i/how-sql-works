SELECT column_name, data_type, is_nullable FROM information_schema.columns
WHERE table_schema = 'my_schema' AND table_name = 'tablename'
ORDER BY ordinal_position;