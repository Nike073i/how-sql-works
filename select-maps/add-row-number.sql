SELECT RANK() OVER(ORDER BY join_at), firstname, surname
FROM post_exers.members
ORDER BY join_at;
