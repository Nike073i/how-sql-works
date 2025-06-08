SELECT 
    COUNT(*) "all",
    COUNT(*) FILTER (WHERE slots = 1) "single",  
    COUNT(*) FILTER (WHERE slots = 2) "double",  
    COUNT(*) FILTER (WHERE slots = 3) "triple", 
    COUNT(*) FILTER (WHERE slots > 3) "multi"
FROM post_exers.bookings;