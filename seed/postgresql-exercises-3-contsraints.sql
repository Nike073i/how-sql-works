ALTER TABLE post_exers.bookings
    ADD CONSTRAINT bookings_pk PRIMARY KEY (id),

ALTER TABLE post_exers.facilities
    ADD CONSTRAINT facilities_pk PRIMARY KEY (id),
    ADD CONSTRAINT facilities_check_name_length CHECK (char_length(name) <= 100);

ALTER TABLE post_exers.members
    ADD CONSTRAINT members_pk PRIMARY KEY (id),
    ADD CONSTRAINT members_check_surname_length CHECK (char_length(surname) <= 200),
    ADD CONSTRAINT members_check_firstname_length CHECK (char_length(firstname) <= 200),
    ADD CONSTRAINT members_check_address_length CHECK (char_length(address) <= 300),
    ADD CONSTRAINT members_check_phone_length CHECK (char_length(phone) <= 20);

ALTER TABLE post_exers.bookings
    ADD CONSTRAINT bookings_fk_facility FOREIGN KEY (facility_id) REFERENCES post_exers.facilities (id),
    ADD CONSTRAINT bookings_fk_member FOREIGN KEY (member_id) REFERENCES post_exers.members (id);

ALTER TABLE post_exers.members
    ADD CONSTRAINT fk_members_recommended_by FOREIGN KEY (recommended_by) REFERENCES post_exers.members(id) ON DELETE SET NULL;

CREATE INDEX bookings_idx_member_id_facility_id
    ON post_exers.bookings
    USING btree (member_id, facility_id);

CREATE INDEX bookings_idx_facility_id_member_id
    ON post_exers.bookings
    USING btree (facility_id, member_id);

CREATE INDEX bookings_idx_facility_id_start_time
    ON post_exers.bookings  
    USING btree (facility_id, start_time);

CREATE INDEX bookings_idx_member_id_start_time
    ON post_exers.bookings  
    USING btree (member_id, start_time);

CREATE INDEX bookings_idx_start_time
    ON post_exers.bookings
    USING btree (start_time);

CREATE INDEX members_idx_join_at
    ON post_exers.members
    USING btree (join_at);

CREATE INDEX members_idx_recommended_by
    ON post_exers.members
    USING btree (recommended_by);

ANALYZE;
