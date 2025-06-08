SELECT TRANSLATE('12345', '134', 'ax'); -- a2x5. 1 -> a, 3 -> x, 4 -> remove

-- Вывод номера телефона без лишних символов
SELECT id, TRANSLATE(phone, '-() ', '') as phone
from post_exers.members
order by id;          