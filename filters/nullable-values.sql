-- Only not null
SELECT recommended_by, COUNT(*) 
FROM post_exers.members 
WHERE recommended_by IS NOT NULL 
GROUP BY recommended_by ORDER BY recommended_by;