CREATE OR REPLACE VIEW post_exers.daily_revenue AS
SELECT DATE_TRUNC('day', b.start_time) "date", SUM(slots * CASE WHEN b.member_id = 0 THEN f.guestcost ELSE f.membercost END) revenue
FROM post_exers.bookings b JOIN post_exers.facilities f ON b.facility_id = f.id
GROUP BY DATE_TRUNC('day', b.start_time);

-- Working with Timestamps