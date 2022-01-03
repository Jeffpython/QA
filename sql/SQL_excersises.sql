Для каждого производителя, выпускающего ноутбуки c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ноутбуков. Вывод: производитель, скорость.

SELECT DISTINCT maker, speed
FROM laptop
JOIN product ON product.model = laptop.model
WHERE hd >= 10

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
