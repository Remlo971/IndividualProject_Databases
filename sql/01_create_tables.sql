-- ============================================================
-- ФАЙЛ: 01_create_tables.sql
-- ОПИСАНИЕ: Создание структуры базы данных "Книжный магазин"
-- ============================================================

-- Удаление существующих таблиц (для пересоздания)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Publishers;

-- 1. Справочная таблица: Издатели
CREATE TABLE Publishers (
    publisher_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name           TEXT NOT NULL,
    country        TEXT NOT NULL,
    founded_year   INTEGER
);

-- 2. Справочная таблица: Авторы
CREATE TABLE Authors (
    author_id      INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name      TEXT NOT NULL,
    birth_year     INTEGER,
    country        TEXT NOT NULL
);

-- 3. Справочная таблица: Категории
CREATE TABLE Categories (
    category_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    name           TEXT NOT NULL,
    description    TEXT
);

-- 4. Операционная таблица: Книги
CREATE TABLE Books (
    book_id         INTEGER PRIMARY KEY AUTOINCREMENT,
    title           TEXT NOT NULL,
    author_id       INTEGER NOT NULL,
    publisher_id    INTEGER NOT NULL,
    category_id     INTEGER NOT NULL,
    price           REAL NOT NULL CHECK (price > 0),
    stock_quantity  INTEGER NOT NULL DEFAULT 0,
    publication_year INTEGER,
    FOREIGN KEY (author_id)    REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (category_id)  REFERENCES Categories(category_id)
);

-- 5. Операционная таблица: Покупатели
CREATE TABLE Customers (
    customer_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    full_name       TEXT NOT NULL,
    email           TEXT,
    phone           TEXT,
    city            TEXT NOT NULL,
    registration_date TEXT NOT NULL
);

-- 6. Операционная таблица: Заказы
CREATE TABLE Orders (
    order_id        INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id     INTEGER NOT NULL,
    book_id         INTEGER NOT NULL,
    quantity        INTEGER NOT NULL CHECK (quantity > 0),
    order_date      TEXT NOT NULL,
    total_price     REAL NOT NULL,
    status          TEXT DEFAULT 'В обработке',
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id)     REFERENCES Books(book_id)
);
