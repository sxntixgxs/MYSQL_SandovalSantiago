###### DIA 12 ######


USE world;
-- Revisar datos
SELECT * FROM city;
SELECT COUNT(*) FROM city;

SELECT COUNT(*) FROM city WHERE CountryCode = "GBR";

SELECT * FROM country;
SELECT COUNT(*) FROM country;

SELECT * FROM countrylanguage;
SELECT COUNT(*) FROM countrylanguage;

-- creemos un query complejo

SELECT * FROM city WHERE Name = "Peking";
SELECT * FROM city WHERE CountryCode = "CHN";
SELECT * FROM city WHERE CountryCode = "CHN" AND Population > 2243000;

-- Creacion de una indexacion

CREATE INDEX idx_cityName ON city(Name);


SHOW KEYS FROM city; -- para ver los indices de una tabla

SHOW INDEX FROM city;

-- HACER ESTUDIO DE RENDIMIENTO DE UN INDEX: 
    EXPLAIN ANALYZE 
    SELECT * 
    FROM city 
    WHERE Name = "Bogota";

SELECT database_name, table_name, index_name,
ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
FROM mysql.innodb_index_stats
WHERE stat_name = 'size' AND index_name != 'PRIMARY'
ORDER BY size_in_mb DESC;

select database_name, table_name, index_name, ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
from mysql.innodb_index_stats where stat_name='size' and index_name = "cc" ;
select *
from mysql.innodb_index_stats;