CREATE TABLE
    countries (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) UNIQUE NOT NULL
    );

CREATE TABLE
    customers (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        first_name VARCHAR(25) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        gender CHAR(1) CHECK (gender IN ('M', 'F')),
        age INT NOT NULL CHECK (age > 0),
        phone_number CHAR(10) NOT NULL,
        country_id INT NOT NULL REFERENCES countries (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    products (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(25) NOT NULL,
        description VARCHAR(250),
        recipe TEXT,
        price NUMERIC(10, 2) NOT NULL CHECK (price > 0)
    );

CREATE TABLE
    feedbacks (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        description VARCHAR(255),
        rate NUMERIC(4, 2) CHECK (rate BETWEEN 0 AND 10),
        product_id INT NOT NULL REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE,
        customer_id INT NOT NULL REFERENCES customers (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    distributors (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(25) NOT NULL UNIQUE,
        address VARCHAR(30) NOT NULL,
        summary VARCHAR(200) NOT NULL,
        country_id INT NOT NULL REFERENCES countries (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    ingredients (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(30) NOT NULL,
        description VARCHAR(200),
        country_id INT NOT NULL REFERENCES countries (id) ON DELETE CASCADE ON UPDATE CASCADE,
        distributor_id INT NOT NULL REFERENCES distributors (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    products_ingredients (
        product_id INT REFERENCES products (id) ON DELETE CASCADE ON UPDATE CASCADE,
        ingredient_id INT REFERENCES ingredients (id) ON DELETE CASCADE ON UPDATE CASCADE
    );