use [recipe12.1]

— 3.1 INSERT

/*
a.Без указания списка полей
INSERT INTO table_name VALUES (value1, value2, value3, ...);
*/
INSERT INTO foodstuff_type VALUES ( N'напитки', N'утоляет жажду' )

/*
b.С указанием списка полей
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
*/
INSERT INTO foodstuff_type ([name], [description])
VALUES ( N'мясо', N'убивать животных' )

/*
c. С чтением значения из другой таблицы
INSERT INTO table2 (column_name(s)) SELECT column_name(s) FROM table1;
*/
INSERT INTO recipe ([name]) SELECT [name] FROM dish;

— 3.2 DELETE

/*
a.Всех записей
*/
— DELETE step

/*
b. По условию
DELETE FROM table_name WHERE condition;
*/
--DELETE FROM step WHERE recipe_id = 1

— 3.3. UPDATE

/*
a.Всех записей
*/
--UPDATE dish SET price = 0

/*
b.По условию обновляя один атрибут
UPDATE table_name
SET column1 = value1, column2 = value2, ... WHERE
condition
*/
--UPDATE dish SET price = 0 WHERE name = 'суп'

/*
c.По условию обновляя несколько атрибутов
UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE
condition
*/
--UPDATE recipe SET [description] = 0 WHERE [name] NOT LIKE 'суп' AND type_recipe = 100

— 3.4.SELECT

/*
a.С набором извлекаемых атрибутов (SELECT atr1, atr2 FROM ...)
*/
SELECT [name], [price] FROM dish

/*
b. Со всеми атрибутами ( SELECT * FROM ...)
*/
SELECT * FROM dish

/*
c. С условием по атрибуту (SELECT * FROM ... WHERE atr1 = value
*/
SELECT * FROM dish WHERE price = 500

— 3.5. SELECT ORDER BY + TOP (LIMIT)

/*
a. С сортировкой по возрастанию ASC + ограничение вывода количества записей
*/
SELECT TOP(2) * FROM dish
ORDER BY price

/*
b.С сортировкой по убыванию DESC
*/
SELECT * FROM dish
ORDER BY price DESC

/*
c.С сортировкой по двум атрибутам + ограничение вывода количества записей
*/
SELECT TOP(2) * FROM dish
ORDER BY price, [name]

/*
d.С сортировкой по первому атрибуту, из списка извлекаемых
*/
SELECT * FROM dish
ORDER BY 1

— 3.6. Работа с датами

/*
a.WHERE по дате
*/
SELECT * FROM [promotion] WHERE start_time = 12/02/2022

/*
b.WHERE дата в диапазоне
*/
SELECT * FROM [promotion]
WHERE start_time >= 12/02/2022
AND start_time <= 25/02/2022

/*
c.Извлечь из таблицы не всю дату, а только год. Например, год рождения автора.
Для этого используется функция YEAR
*/
SELECT YEAR( start_time) AS [year] FROM [promotion]

— 3.7.Функции агрегации
/*
a.Посчитать количество записей в таблице
*/
SELECT Count(*) FROM dish

/*
b.Посчитать количество уникальных записей в таблице
*/
SELECT Count(dish_id) FROM dish

/*
c.Вывести уникальные значения столбца
*/
SELECT type_recipe from recipe
GROUP BY type_recipe

/*
d.Найти максимальное значение столбца
*/
SELECT MAX(price) FROM dish

/*
e.Найти минимальное значение столбца
*/
SELECT MIN(price) FROM dish

/*
f.Написать запрос COUNT () + GROUP BY
*/
SELECT type_recipe, COUNT(*) from recipe
GROUP BY type_recipe

— 3.8.SELECT GROUP BY + HAVING



— select * from dish where dish_id in (select dish_id from recipe_dish where recipe_id in (select recipe_id from recipe where type_recipe = 150))
