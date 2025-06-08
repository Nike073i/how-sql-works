-- Обрезать текст с 2-ой буквы (включая) длиной в 5 символов. 
-- Как я понял - применить к константам - нельзя
SELECT SUBSTR(text_ex.t,2,5) FROM (SELECT 'This is text' t) text_ex; --his i