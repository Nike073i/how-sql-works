CREATE SCHEMA IF NOT EXISTS post_exers;

CREATE TABLE IF NOT EXISTS post_exers.members (
    id INT NOT NULL,
    surname TEXT NOT NULL,
    firstname TEXT NOT NULL,
    address TEXT NOT NULL,
    zipcode INT NOT NULL,
    phone TEXT NOT NULL,
    recommended_by INT,
    join_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS post_exers.facilities(
    id INT NOT NULL,
    name TEXT NOT NULL,
    membercost NUMERIC NOT NULL,
    guestcost NUMERIC NOT NULL,
    initial_outlay NUMERIC NOT NULL,
    monthly_maintenance NUMERIC NOT NULL
);

CREATE TABLE IF NOT EXISTS post_exers.bookings(
    id INT NOT NULL,
    facility_id INT NOT NULL,
    member_id INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    slots INT NOT NULL
);