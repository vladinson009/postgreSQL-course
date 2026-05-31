CREATE TABLE
    accounts (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        username VARCHAR(150) UNIQUE NOT NULL,
        password VARCHAR(150) NOT NULL,
        email VARCHAR(150) NOT NULL,
        gender CHAR(1) NOT NULL CHECK (
            gender = 'M'
            OR gender = 'F'
        ),
        age INT NOT NULL,
        job_title VARCHAR(150) NOT NULL,
        ip VARCHAR(150) NOT NULL
    );

CREATE TABLE
    addresses (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        street VARCHAR(100) NOT NULL,
        town VARCHAR(100) NOT NULL,
        country VARCHAR(100) NOT NULL,
        account_id INT NOT NULL REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    photos (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        description TEXT,
        capture_date TIMESTAMP NOT NULL,
        views INT NOT NULL DEFAULT 0 CHECK (views >= 0)
    );

CREATE TABLE
    comments (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        content VARCHAR(255) NOT NULL,
        published_on TIMESTAMP NOT NULL,
        photo_id INT NOT NULL REFERENCES photos (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

CREATE TABLE
    accounts_photos (
        account_id INT NOT NULL REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE,
        photo_id INT NOT NULL REFERENCES photos (id) ON UPDATE CASCADE ON DELETE CASCADE,
        PRIMARY KEY (account_id, photo_id)
    );

CREATE TABLE
    likes (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        photo_id INT NOT NULL REFERENCES photos (id) ON UPDATE CASCADE ON DELETE CASCADE,
        account_id INT NOT NULL REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE
    );