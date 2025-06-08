-- Составной индекс работает последовательно: 1-ое поле, 2-ое ...
-- Если включено только 2-ое поле - индекс не отработает.
-- Одно из решений - создание обратного составного индекса (2, 1)
-- Создание отдельных одиночных индексов - плохая идея.  

CREATE INDEX bookings_idx_member_id_facility_id
    ON post_exers.bookings
    USING btree (member_id, facility_id);

CREATE INDEX bookings_idx_facility_id_member_id
    ON post_exers.bookings
    USING btree (facility_id, member_id);