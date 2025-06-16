CREATE TABLE tablename (
  fieldname TEXT,
  CONSTRAINT cnstr_name CHECK (char_length(name) <= 255)
);
