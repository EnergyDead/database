use [recipe12.1]

� 3.1 INSERT

/*
a.��� �������� ������ �����
INSERT INTO table_name VALUES (value1, value2, value3, ...);
*/
INSERT INTO foodstuff_type VALUES ( N'�������', N'������� �����' )

/*
b.� ��������� ������ �����
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
*/
INSERT INTO foodstuff_type ([name], [description])
VALUES ( N'����', N'������� ��������' )

/*
c. � ������� �������� �� ������ �������
INSERT INTO table2 (column_name(s)) SELECT column_name(s) FROM table1;
*/
INSERT INTO recipe ([name]) SELECT [name] FROM dish;

� 3.2 DELETE

/*
a.���� �������
*/
� DELETE step

/*
b. �� �������
DELETE FROM table_name WHERE condition;
*/
--DELETE FROM step WHERE recipe_id = 1

� 3.3. UPDATE

/*
a.���� �������
*/
--UPDATE dish SET price = 0

/*
b.�� ������� �������� ���� �������
UPDATE table_name
SET column1 = value1, column2 = value2, ... WHERE
condition
*/
--UPDATE dish SET price = 0 WHERE name = '���'

/*
c.�� ������� �������� ��������� ���������
UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE
condition
*/
--UPDATE recipe SET [description] = 0 WHERE [name] NOT LIKE '���' AND type_recipe = 100

� 3.4.SELECT

/*
a.� ������� ����������� ��������� (SELECT atr1, atr2 FROM ...)
*/
SELECT [name], [price] FROM dish

/*
b. �� ����� ���������� ( SELECT * FROM ...)
*/
SELECT * FROM dish

/*
c. � �������� �� �������� (SELECT * FROM ... WHERE atr1 = value
*/
SELECT * FROM dish WHERE price = 500

� 3.5. SELECT ORDER BY + TOP (LIMIT)

/*
a. � ����������� �� ����������� ASC + ����������� ������ ���������� �������
*/
SELECT TOP(2) * FROM dish
ORDER BY price

/*
b.� ����������� �� �������� DESC
*/
SELECT * FROM dish
ORDER BY price DESC

/*
c.� ����������� �� ���� ��������� + ����������� ������ ���������� �������
*/
SELECT TOP(2) * FROM dish
ORDER BY price, [name]

/*
d.� ����������� �� ������� ��������, �� ������ �����������
*/
SELECT * FROM dish
ORDER BY 1

� 3.6. ������ � ������

/*
a.WHERE �� ����
*/
SELECT * FROM [promotion] WHERE start_time = 12/02/2022

/*
b.WHERE ���� � ���������
*/
SELECT * FROM [promotion]
WHERE start_time >= 12/02/2022
AND start_time <= 25/02/2022

/*
c.������� �� ������� �� ��� ����, � ������ ���. ��������, ��� �������� ������.
��� ����� ������������ ������� YEAR
*/
SELECT YEAR( start_time) AS [year] FROM [promotion]

� 3.7.������� ���������
/*
a.��������� ���������� ������� � �������
*/
SELECT Count(*) FROM dish

/*
b.��������� ���������� ���������� ������� � �������
*/
SELECT Count(dish_id) FROM dish

/*
c.������� ���������� �������� �������
*/
SELECT type_recipe from recipe
GROUP BY type_recipe

/*
d.����� ������������ �������� �������
*/
SELECT MAX(price) FROM dish

/*
e.����� ����������� �������� �������
*/
SELECT MIN(price) FROM dish

/*
f.�������� ������ COUNT () + GROUP BY
*/
SELECT type_recipe, COUNT(*) from recipe
GROUP BY type_recipe

� 3.8.SELECT GROUP BY + HAVING



� select * from dish where dish_id in (select dish_id from recipe_dish where recipe_id in (select recipe_id from recipe where type_recipe = 150))