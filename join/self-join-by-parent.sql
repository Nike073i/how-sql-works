-- Вывести имена тех, кто хотя бы одного пригласил
-- Родитель тот - кто пригласил (инвайтер). У приглашенного (invited) ссылка на родителя (recommended_by)
SELECT DISTINCT inviter.firstname, inviter.surname
FROM post_exers.members invited JOIN post_exers.members inviter ON invited.recommended_by = inviter.id
ORDER BY surname, firstname;

-- Вывести информацию о пользователях с информацией по их инвайтерам (родителям)
SELECT invited.firstname memfname, invited.surname memsname, inviter.firstname recfname, inviter.surname recsname
FROM post_exers.members invited
LEFT JOIN post_exers.members inviter 
ON invited.recommended_by = inviter.id
ORDER BY memsname, memfname;