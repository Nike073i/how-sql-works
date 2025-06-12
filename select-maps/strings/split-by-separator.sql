-- SPLIT строки по сепаратору
WITH 
    seq AS (SELECT '192.168.0.1' data, '.' sep),
    iter AS (
        SELECT i 
        FROM seq, generate_series(
            1, 
            (LENGTH(seq.data) - LENGTH(TRANSLATE(seq.data, seq.sep, '')) + 1) 
        ) i 
    )
SELECT SPLIT_PART(seq.data, seq.sep, iter.i) FROM iter, seq;
