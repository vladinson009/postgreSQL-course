CREATE TABLE
    owners (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        phone_number VARCHAR(15) NOT NULL,
        address VARCHAR(50)
    );

CREATE TABLE
    animal_types (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        animal_type VARCHAR(30) NOT NULL
    );

CREATE TABLE
    cages (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        animal_type_id INT NOT NULL REFERENCES animal_types (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    animals (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(30) NOT NULL,
        birthdate DATE NOT NULL,
        owner_id INT REFERENCES owners (id) ON DELETE CASCADE ON UPDATE CASCADE,
        animal_type_id INT NOT NULL REFERENCES animal_types (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    volunteers_departments (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        department_name VARCHAR(30) NOT NULL
    );

CREATE TABLE
    volunteers (
        id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(50) NOT NULL,
        phone_number VARCHAR(15) NOT NULL,
        address VARCHAR(50),
        animal_id INT REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE,
        department_id INT NOT NULL REFERENCES volunteers_departments (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    animals_cages (
        cage_id INT NOT NULL REFERENCES cages (id) ON DELETE CASCADE ON UPDATE CASCADE,
        animal_id INT NOT NULL REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
    );