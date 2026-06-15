CREATE TABLE
    brands (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL UNIQUE
    );

CREATE TABLE
    classifications (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(30) NOT NULL UNIQUE
    );

CREATE TABLE
    customers (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        first_name VARCHAR(30) NOT NULL,
        last_name VARCHAR(30) NOT NULL,
        address VARCHAR(150) NOT NULL,
        phone VARCHAR(30) NOT NULL UNIQUE,
        loyalty_card BOOLEAN NOT NULL DEFAULT FALSE CHECK (
            loyalty_card IS TRUE
            OR loyalty_card IS FALSE
        )
    );

-- check loyalty card
CREATE TABLE
    items (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        quantity INT NOT NULL CHECK (quantity >= 0),
        price NUMERIC(12, 2) NOT NULL CHECK (price > 0.00),
        description TEXT,
        brand_id INT NOT NULL REFERENCES brands (id) ON DELETE CASCADE ON UPDATE CASCADE,
        classification_id INT NOT NULL REFERENCES classifications (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    orders (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        customer_id INT NOT NULL REFERENCES customers (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    reviews (
        customer_id INT NOT NULL REFERENCES customers (id) ON DELETE CASCADE ON UPDATE CASCADE,
        item_id INT NOT NULL REFERENCES items (id) ON DELETE CASCADE ON UPDATE CASCADE,
        created_at TIMESTAMP NOT NULL DEFAULT NOW(),
        rating NUMERIC(3, 1) NOT NULL DEFAULT 0.0 CHECK (rating <= 10.0), -- CHeck for 0
        PRIMARY KEY (customer_id, item_id)
    );

CREATE TABLE
    orders_items (
        order_id INT NOT NULL REFERENCES orders (id) ON DELETE CASCADE ON UPDATE CASCADE,
        item_id INT NOT NULL REFERENCES items (id) ON DELETE CASCADE ON UPDATE CASCADE,
        quantity INT NOT NULL CHECK (quantity >= 0),
        PRIMARY KEY (order_id, item_id)
    );