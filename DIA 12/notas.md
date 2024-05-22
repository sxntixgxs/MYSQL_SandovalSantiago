# Programación de tareas con eventos

+ Optimización de consultas, Programación de Tareas y Triggers



+ InnoDB
+ MyISAM
+ Memory
+ NDB Cluster


+ Cache de consultas se guarda en memoria
+ Buffer es temporal

+ InnoDB usa un BTree (?) al crear un idx por cada registro son 16KB y se hace por un BTREE

+ Para ver los indices de una tabla: SHOW KEYS FROM nombreTabla // SHOW INDEX FROM city; ;

+ HACER ESTUDIO DE RENDIMIENTO DE UN INDEX: 
+ + ```SQL
    EXPLAIN ANALYZE 
    SELECT * 
    FROM city 
    WHERE Name = "Bogota";
    ```
    ```SQL
    # Peso de los idx
    SELECT database_name, table_name, index_name,
    ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
    FROM mysql.innodb_index_stats
    WHERE stat_name = 'size' AND index_name != 'PRIMARY'
    ORDER BY size_in_mb DESC;


    select database_name, table_name, index_name, ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
    from mysql.innodb_index_stats where stat_name='size' and index_name = "cc" ;
    select *
    from mysql.innodb_index_stats;
    
    ```

