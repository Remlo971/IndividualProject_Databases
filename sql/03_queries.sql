-- ============================================================
-- ФАЙЛ: 03_queries.sql
-- ОПИСАНИЕ: Все запросы для практической работы (a-m)
-- ============================================================

-- a) Запрос на выбор всех данных по двум полям таблицы
SELECT title, price FROM Books;

-- b) Запрос на выбор всех неповторяющихся данных по одному полю таблицы
SELECT DISTINCT city FROM Customers;

-- c) Запрос с GROUP BY, HAVING и заголовками колонок
SELECT 
    city AS 'Город', 
    COUNT(*) AS 'Количество покупателей'
FROM Customers
GROUP BY city
HAVING COUNT(*) >= 1;

-- d) Запрос с DISTINCT и агрегирующей функцией SUM
SELECT DISTINCT 
    customer_id AS 'Покупатель', 
    SUM(total_price) AS 'Сумма заказов'
FROM Orders
GROUP BY customer_id;

-- e) Выбор нескольких полей, отсортированных по убыванию
SELECT title, price, publication_year 
FROM Books 
ORDER BY price DESC;

-- f) Выбор полей с добавлением вычисляемого поля
SELECT 
    title AS 'Название', 
    price AS 'Цена', 
    stock_quantity AS 'Количество',
    price * stock_quantity AS 'Общая стоимость запасов'
FROM Books;

-- g) Запрос с SUM и условием BETWEEN
SELECT 
    customer_id AS 'Покупатель', 
    SUM(total_price) AS 'Сумма заказов'
FROM Orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY customer_id;

-- h) Запрос с AVG и условием WHERE
SELECT 
    category_id AS 'Категория', 
    AVG(price) AS 'Средняя цена книги'
FROM Books
WHERE stock_quantity > 10
GROUP BY category_id;

-- i) Запрос с вычисляемым полем и сложной сортировкой
SELECT 
    title AS 'Название',
    price AS 'Цена',
    price * stock_quantity AS 'Стоимость запасов'
FROM Books
ORDER BY title DESC, price ASC, price * stock_quantity DESC;

-- j) Запрос с условием LIKE
SELECT full_name, email, city 
FROM Customers 
WHERE full_name LIKE '%ов%';

-- k) Запрос с условием, сортировкой и константой
SELECT 
    title AS 'Название',
    price AS 'Цена',
    'В наличии' AS 'Статус наличия'
FROM Books
WHERE stock_quantity > 15
ORDER BY price DESC;

-- l) Запрос с MIN и MAX
SELECT 
    MIN(price) AS 'Минимальная цена',
    MAX(price) AS 'Максимальная цена'
FROM Books;

-- m) Запрос со сложным условием (AND, OR) и сортировкой
SELECT 
    title AS 'Название',
    price AS 'Цена',
    stock_quantity AS 'Остаток',
    publication_year AS 'Год издания'
FROM Books
WHERE (price > 400 AND stock_quantity > 10) 
   OR (publication_year > 2020 AND price < 300)
ORDER BY price DESC;
