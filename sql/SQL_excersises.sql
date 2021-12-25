Найдите производителя, выпускающего компьютеры, но не ноутбуки.

SELECT maker
FROM product
WHERE type = 'PC'
EXCEPT
SELECT maker
FROM product
WHERE type = 'Laptop'