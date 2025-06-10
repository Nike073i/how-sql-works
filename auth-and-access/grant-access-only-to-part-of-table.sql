REVOKE ALL PRIVILEGES ON TABLE post_exers.members FROM alex;

GRANT UPDATE, INSERT (id, firstname, surname, address, zipcode, join_at), SELECT (id, firstname, surname, recommended_by) ON TABLE post_exers.members TO alex;