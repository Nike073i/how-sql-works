-- Обрезать текст с 2-ой буквы (включая) длиной в 5 символов. 
-- Как я понял - применить к константам - нельзя
SELECT SUBSTR(text_ex.t,2,5) FROM (SELECT 'This is text' t) text_ex; --his i

-- Пример итератора по строке
WITH 
    seq AS (SELECT 'nikita' s),
    iter AS (SELECT i FROM seq, generate_series(1, LENGTH(seq.s)) i)
SELECT SUBSTR(seq.s, iter.i, 1) 
    FROM iter, seq;
