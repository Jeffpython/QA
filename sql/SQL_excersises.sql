Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT pc.model, pc.price
FROM product
JOIN pc ON pc.model = product.model
WHERE product.maker = 'B'
UNION
SELECT DISTINCT laptop.model, laptop.price
FROM product
JOIN laptop ON laptop.model = product.model
WHERE product.maker = 'B'
UNION
SELECT DISTINCT printer.model, printer.price
FROM product
JOIN printer ON printer.model = product.model
WHERE product.maker = 'B'

Найдите производителя, выпускающего компьютеры, но не ноутбуки.

SELECT maker
FROM product
WHERE type = 'PC'
EXCEPT
SELECT maker
FROM product
WHERE type = 'Laptop'
