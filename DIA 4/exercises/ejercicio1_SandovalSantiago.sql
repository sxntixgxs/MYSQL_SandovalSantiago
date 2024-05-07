
# EJERCICIO 1 - DIA 4


# Para evitar errores borramos si existe la base de datos pais

DROP SCHEMA pais;

#Creamos la base de datos y ejecutamos el comando USE para que el script trabaje sobre la misma
CREATE SCHEMA pais;

USE pais;

#Creamos la primera tabla "independiente" del script "Pais"

CREATE TABLE pais(
    id INT PRIMARY KEY,
    nombre VARCHAR(20),
    continente VARCHAR(50),
    poblacion INT
);

#Creamos la tabla ciudad que recibe una llave foranea de la tabla pais

CREATE TABLE ciudad(
    id INT PRIMARY KEY,
    nombre VARCHAR(20),
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES pais(id)
);

#Creamos la tabla idioma que es independiente a las demás tablas

CREATE TABLE idioma(
    id INT PRIMARY KEY,
    idioma VARCHAR(50)
);

#Creamos la tabla idioma_pais que es la llave intermedia entre pais e idioma, por lo que estas dos conforman las llaves foraneas

CREATE TABLE idioma_pais(
    id_idioma INT,
    id_pais INT,
    es_oficial TINYINT(1),
    PRIMARY KEY(id_idioma,id_pais),
    FOREIGN KEY (id_idioma) REFERENCES idioma(id),
    FOREIGN KEY (id_pais) REFERENCES pais(id)
);


#Ahora, el requerimiento son 10 inserciones de datos para cada tabla

# Inserciones para pais
INSERT INTO pais VALUES(1,"Argentina","America",46230000);
INSERT INTO pais VALUES(2,"Mexico","America",127500000);
INSERT INTO pais VALUES(3,"Gambia","Africa",2700000);
INSERT INTO pais VALUES(4,"España","Europa",47780000);
INSERT INTO pais VALUES(5,"Inglaterra","Europa",55980000);
INSERT INTO pais VALUES(6,"Canada","America",38930000);
INSERT INTO pais VALUES(7,"Japon","Asia",125100000);
INSERT INTO pais VALUES(8,"Francia","Europa",67970000);
INSERT INTO pais VALUES(9,"Tailandia","Asia",71700000);
INSERT INTO pais VALUES(10,"Jamaica","America",2827000);


# Inserciones para ciudad
INSERT INTO ciudad VALUES(1,"Buenos Aires",1);
INSERT INTO ciudad VALUES(2,"Londres",5);
INSERT INTO ciudad VALUES(3,"Kyoto",7);
INSERT INTO ciudad VALUES(4,"Ciudad de Mexico",2);
INSERT INTO ciudad VALUES(5,"Valencia",4);
INSERT INTO ciudad VALUES(6,"Edmonton",6);
INSERT INTO ciudad VALUES(7,"Montpellier",8);
INSERT INTO ciudad VALUES(8,"Barcelona",4);
INSERT INTO ciudad VALUES(9,"Manchester",5);
INSERT INTO ciudad VALUES(10,"Bangkok",9);


# Inserciones para los idiomas

INSERT INTO idioma VALUES(1,"Espanol");
INSERT INTO idioma VALUES(2,"Ingles");
INSERT INTO idioma VALUES(3,"Frances");
INSERT INTO idioma VALUES(4,"Japones");
INSERT INTO idioma VALUES(5,"Kikai");
INSERT INTO idioma VALUES(6,"Thai");
INSERT INTO idioma VALUES(7,"Mandinka");
INSERT INTO idioma VALUES(8,"Catalan");
INSERT INTO idioma VALUES(9,"Euskera");
INSERT INTO idioma VALUES(10,"Valenciano");

# Inserciones para tabla intermedia idioma_pais
INSERT INTO idioma_pais VALUES(1,1,1);
INSERT INTO idioma_pais VALUES(1,2,1);
INSERT INTO idioma_pais VALUES(7,3,1);
INSERT INTO idioma_pais VALUES(3,8,1);
INSERT INTO idioma_pais VALUES(3,6,1);
INSERT INTO idioma_pais VALUES(2,3,0);
INSERT INTO idioma_pais VALUES(10,4,0);
INSERT INTO idioma_pais VALUES(5,7,0);
INSERT INTO idioma_pais VALUES(4,7,1);
INSERT INTO idioma_pais VALUES(6,9,1);

# Desarrollado por Santiago Sandoval Torres - CC 1 XXXXX 789

SHOW TABLES;
SELECT * FROM pais;

SELECT * FROM ciudad;

SELECT * FROM idioma;

-- Consulta de tipo inner join para obtener las ciudades
-- que estan especificamente asignadas a un pais

SELECT P.nombre AS NombrePais, C.nombre AS NombreCiudad
FROM pais AS P
INNER JOIN ciudad AS C ON P.id = C.id_pais;

-- Consulta de tipo LEFT JOIN para obtener todas las ciudades
-- junto con su pais, incluso si alguna ciudad no esta asignada
-- a esta msima

SELECT P.nombre AS NombrePais, C.nombre AS NombreCiudad
FROM pais AS P
LEFT JOIN ciudad AS C ON P.id = C.id_pais;

-- UNION ES QUITAR EL PUNTO Y COMA Y HACER LOS DOS SELECTS R Y L

SELECT P.nombre AS NombrePais, C.nombre AS NombreCiudad
FROM pais AS P
LEFT JOIN ciudad AS C ON P.id = C.id_pais
UNION

SELECT P.nombre AS NombrePais, C.nombre AS NombreCiudad
FROM pais AS P
RIGHT JOIN ciudad AS C ON P.id = C.id_pais;
