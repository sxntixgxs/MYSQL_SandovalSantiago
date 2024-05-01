DROP SCHEMA filtro;

CREATE SCHEMA filtro;

USE filtro;

CREATE TABLE IF NOT EXISTS administrators(
    adminID INT PRIMARY KEY,
    emailAddress VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS categories(
    categoryID INT PRIMARY KEY,
    categoryName VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS products(
    productID INT PRIMARY KEY,
    categoryID INT,
    productCode VARCHAR(10) NOT NULL UNIQUE,
    productName VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    listPrice DECIMAL NOT NULL,
    disccountPercent DECIMAL NOT NULL DEFAULT 0.00,
    dateAdded DATETIME DEFAULT NULL,
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

CREATE TABLE IF NOT EXISTS customers(
    customerID INT PRIMARY KEY,
    emailAddress VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    shippingAddressID INT DEFAULT NULL,    
    billingAddressID INT DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS addresses(
    addressID INT PRIMARY KEY,
    customerID INT,
    line1 VARCHAR(60) NOT NULL,
    line2 VARCHAR(60) DEFAULT NULL,
    city VARCHAR(40) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zipCode VARCHAR(10) NOT NULL,
    phone VARCHAR(12) NOT NULL,
    disabled INT NOT NULL DEFAULT 0,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE IF NOT EXISTS orders(
    orderID INT PRIMARY KEY,
    customerID INT,
    orderDate DATETIME NOT NULL,
    shipAmount DECIMAL NOT NULL,
    taxAmount DECIMAL NOT NULL,
    shipDate DATETIME DEFAULT NULL,
    shipAddressID INT NOT NULL,
    cardType VARCHAR(50) NOT NULL,
    cardNumber VARCHAR(16) NOT NULL,
    cardExpires VARCHAR(7) NOT NULL,
    billingAddressID INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE IF NOT EXISTS orderItems(
    itemID INT,
    orderID INT, 
    productID INT,
    itemPrice DECIMAL NOT NULL,
    disccountAmount DECIMAL NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY(orderID,productID),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);

-- administrators

INSERT INTO administrators VALUES(1,"sandoval@santiago.co","hola123","Santiago","Sandoval",3);
INSERT INTO administrators VALUES(2,"sandoval@pedri.co","hola123","pedri","Sandoval",3);
INSERT INTO administrators VALUES(13,"Torres@santiago.co","hola123","Santiago","Torres",3);
INSERT INTO administrators VALUES(14,"correa@pedri.co","hola123","pedri","correa",3);
INSERT INTO administrators VALUES(15,"Torres@Carlo.co","hola123","Carlo","Torres",3);

-- categories

INSERT INTO categories VALUES(1, "COMIDA");
INSERT INTO categories VALUES(2, "ASEO");
INSERT INTO categories VALUES(3, "BELLEZA");
INSERT INTO categories VALUES(4, "SALUD");
INSERT INTO categories VALUES(5, "VARIEDADES");

-- products

INSERT INTO products VALUES(1, 1, 1, "ARROZ", "libra arroz blanco", 50000, 0,"2020-09-09");
INSERT INTO products VALUES(2, 2, 2, "JABON", "jabon liquido banio", 2000, 0,"2021-09-09");
INSERT INTO products VALUES(3, 3, 3, "LABIAL", "labial rojo", 80000, 0,"2020-04-09");
INSERT INTO products VALUES(4, 4, 4, "VITAMINA C", "capsulas vitamina c", 1000, 0,"2022-09-09");
INSERT INTO products VALUES(5, 5, 5, "MARTILLO", "martillo pesado rojo", 20000, 0,"2021-09-09");

-- customers

INSERT INTO customers VALUES(1, "martin@palermo.bj","bj2001","Martin","Palermo",NULL,NULL);
INSERT INTO customers VALUES(2, "roman@palermo.bj","bj2001","Roman","Palermo",NULL,NULL);
INSERT INTO customers VALUES(3, "martin@riquelme.bj","bj2001","Martin","Riquelme",NULL,NULL);
INSERT INTO customers VALUES(4, "roman@riquelme.bj","bj2001","Roman","Riquelme",NULL,NULL);
INSERT INTO customers VALUES(5, "oscar@cordoba.bj","bj2001","Oscar","Cordoba",NULL,NULL);

SELECT * FROM customers;

-- addresses

INSERT INTO addresses VALUES(1, 1, "Calle 1 23", NULL, "Buenos Aires", "BA", "00000", "12345678912", 0);
INSERT INTO addresses VALUES(2, 2, "Calle 2 23", NULL, "Cordoba", "CO", "01000", "12345378912", 0);
INSERT INTO addresses VALUES(3, 3, "Calle 3 13", NULL, "Santiago del Estero", "JF", "00002", "22345678912", 0);
INSERT INTO addresses VALUES(4, 4, "Calle 4 24", NULL, "Buenos Aires", "BA", "00000", "12345448912", 0);
INSERT INTO addresses VALUES(5, 5, "Calle 5 43", NULL, "Buenos Aires", "BA", "00000", "12345678913", 0);


-- orders

INSERT INTO orders VALUES(1, 1, "2024-02-02", 320000, 254, NULL, 1, "VISA", "12345678", "0803", 1);
INSERT INTO orders VALUES(2, 2, "2024-02-22", 450000, 454, NULL, 2, "MASTERCARD", "12435478", "0804", 2);
INSERT INTO orders VALUES(3, 3, "2024-01-02", 322000, 654, NULL, 3, "VISA", "32345678", "0103", 3);
INSERT INTO orders VALUES(4, 4, "2024-01-12", 325560, 664, NULL, 4, "MASTERCARD", "44345678", "0856", 4);
INSERT INTO orders VALUES(5, 5, "2024-03-02", 120000, 124, NULL, 5, "VISA", "12225678", "0807", 5);

-- orderItems

INSERT INTO orderItems VALUES(1, 1, 1, 50000, 0, 22);
INSERT INTO orderItems VALUES(2, 2, 2, 53100, 0, 2);
INSERT INTO orderItems VALUES(3, 3, 3, 60400, 0, 14);
INSERT INTO orderItems VALUES(4, 4, 4, 55320, 0, 4);
INSERT INTO orderItems VALUES(5, 5, 5, 100000, 0, 1);

SELECT * FROM orderItems;

SELECT * FROM orders;