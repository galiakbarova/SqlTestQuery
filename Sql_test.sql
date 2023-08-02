-- Табличка категорий:
-- CREATE TABLE Categories(
--	category_id uniqueidentifier NOT NULL,
--	category_name varchar(100) NOT NULL)

-- Табличка продукта:
-- CREATE TABLE Products(
--	product_id uniqueidentifier NOT NULL,
--	product_name varchar(100) NOT NULL)

-- Табличка соответствия продукта и категорий:
-- CREATE TABLE ProductsToCategories(
--	product_id uniqueidentifier NOT NULL,
--	category_id uniqueidentifier NOT NULL)

-- Выборка в формате "Имя продукта - Имя категории"
WITH used_categories AS (SELECT pc.product_id,
	c.category_name
	FROM ProductsToCategories pc
	JOIN Categories c ON pc.category_id = c.category_id)
SELECT p.product_name,
us.category_name
FROM Products p
LEFT JOIN used_categories us ON us.product_id = p.product_id
ORDER BY p.product_name;