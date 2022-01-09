Для каждого производителя, выпускающего ноутбуки c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ноутбуков. Вывести: производитель, скорость.

SELECT DISTINCT maker, speed
FROM laptop
JOIN product ON product.model = laptop.model
WHERE hd >= 10

Найти номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

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

Найти производителя, выпускающего компьютеры, но не ноутбуки.

SELECT maker
FROM product
WHERE type = 'PC'
EXCEPT
SELECT maker
FROM product
WHERE type = 'Laptop'

Найти производителей компьютеров с процессором не менее 450 Мгц. Вывести: Maker.

SELECT DISTINCT product.maker
FROM pc
JOIN product ON product.model = pc.model
WHERE pc.speed >= 450