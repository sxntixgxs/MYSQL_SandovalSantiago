CREATE SCHEMA filtro2;
USE filtro2;

CREATE TABLE IF NOT EXISTS user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS product(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS download(
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_product INT,
    id_user INT,
    fileName VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (id_product) REFERENCES product(id),
    FOREIGN KEY (id_user) REFERENCES user(id)
);