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

