-- Сортировать услуги с 0-ценой участника стоимости по изначальной стоимости, иначе - по месячной поддержке
SELECT id, name, membercost, initial_outlay, monthly_maintenance
FROM post_exers.facilities
ORDER BY membercost, CASE WHEN membercost = 0 THEN initial_outlay ELSE monthly_maintenance END;