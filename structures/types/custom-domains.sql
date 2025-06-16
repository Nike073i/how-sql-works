CREATE DOMAIN post_exers.text_notnull AS text NOT NULL;

CREATE DOMAIN post_exers.member_name AS TEXT NOT NULL CHECK (value !~ '\s');

-- Использование
CREATE TABLE post_exers.metadata (
    id SERIAL PRIMARY KEY,
    name post_exers.member_name,
    description post_exers.text_notnull
);