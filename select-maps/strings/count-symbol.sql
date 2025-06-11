WITH seq AS (SELECT 'tthis is text' s, 't' c)
SELECT LENGTH(seq.s) - LENGTH(TRANSLATE(seq.s, seq.c, ''))
FROM seq;