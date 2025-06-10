MERGE INTO store
USING changes
ON store.product_id = changes.product_id
-- Новый продукт
WHEN NOT MATCHED AND changes.delta > 0 THEN
  INSERT (product_id, stock, is_enable) 
  VALUES (changes.product_id, changes.delta, true)
-- Пополнение запасов
WHEN MATCHED AND changes.delta > 0 THEN
  UPDATE SET stock = store.stock + changes.delta, 
             is_enable = (store.stock + changes.delta > 0)
-- Списание
WHEN MATCHED THEN
  UPDATE SET stock = store.stock + changes.delta, 
             is_enable = (store.stock + changes.delta > 0)

-- Во избежание ухода в отрицательное кол-во вешаем на store.stock Check >= 0. Если будет некорректное списание - весь MERGE откатится