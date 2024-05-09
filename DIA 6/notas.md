### DIA 6 ~ Santiago Sandoval Torres

# API's para pagos 


+ Nombre de banco + swagger devuelve las api
+ payu api para pagos
+ wompi api

# Que es normalizar?
+ Reducir las redundancias y mejorar la integridad de los datos

# Como normalizar
+ **1FN** 
    + *REDUCIR*
    + Asegurar la atomicidad 
    + El siguiente query está normalizado al 1FN?
    ```SQL
    CREATE SCHEMA dia6;
    USE dia6;
    CREATE TABLE estudiante(
        ID int,
        Nombre VARCHAR(100),
        Telefono VARCHAR(15)
    );
    ```
    + **RESPUESTA:** No, porque el usuario ingresa el nombre completo. Sin embargo, si los requerimientos lo indican, se puede dejar así.
    + Como se puede normalizarla, ya habiendo creado la tabla anteriormente?
    ```SQL
    ALTER TABLE estudiante
        add Apellido VARCHAR(100);
    -- Prueba agregacion de datos
    SHOW TABLES;
    SELECT * FROM estudiante;
    -- Revisar columnas creadas
    SHOW COLUMNS FROM estudiante;
    -- Forma #2
    DESCRIBE estudiante;
    INSERT INTO estudiante(ID,Nombre,Apellido,Telefono) VALUES(1,'Pedro','Gomez','31215145');
    -- Alterar tabla existente
    ALTER TABLE estudiante ADD Edad INT NOT NULL DEFAULT 5;
    -- command para eliminar todos los datos insertados
    TRUNCATE curso;
    -- cambiar nombre de una columna
    ALTER TABLE curso RENAME COLUMN Estudiantes_Inscritos to Estudiante; -- puede ser modify o change
    -- Def primera forma unicamente ej de clase
    CREATE TABLE curso(
        Id_Curso INT,
        Nombre_Curso VARCHAR(100),
        Estudiantes_Inscritos VARCHAR(50) 
    );
    ```
+ **2FN**   
    + *REDUNCANCIA*
    + Es cuando una tabla está en la forma 1FN, donde cada atributo que no forma de la clave primaria es completamente dependiente de la clave primaria. Se saca a otra tabla
    + 2FN se aplica a las tablas que tienen claves primarias compuestas de más de un atributo donde si una tabla está en 1FN y su clave primaria es simple, entonces también está en la 2FN
    
    ```SQL
    
    

    ```


+ **3FN**
    + *INDEPENDENCIA*

