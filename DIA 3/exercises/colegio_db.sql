CREATE SCHEMA colegio;

USE colegio;

-- DROP SCHEMA colegio;

CREATE TABLE departamento(
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE profesor(
    id_profesor INT(10) PRIMARY KEY,
    id_depto INT,
    FOREIGN KEY (id_depto) REFERENCES departamento(id)
);

CREATE TABLE persona(
    id INT(10) PRIMARY KEY,
    nif VARCHAR(9),
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nac DATE NOT NULL,
    sexo ENUM('H','M') NOT NULL,
    tipo VARCHAR(100)
);

CREATE TABLE grado(
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE asignatura(
    id INT(10) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo VARCHAR(100) NOT NULL,
    curso TINYINT(3) NOT NULL,
    cuatrimestre TINYINT(3) NOT NULL,
    id_profesor INT(10),
    id_grado INT(10) NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_grado) REFERENCES grado(id)
);

CREATE TABLE curso_escolar(
    id INT(10) PRIMARY KEY,
    anyo_inicio YEAR(4),
    anyo_fin YEAR(4)
);

CREATE TABLE alumno_matricula_asignatura(
    id_alumno INT(10),
    id_asignatura INT(10),
    id_curso_escolar INT(10)
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY(id_curso_escolar) REFERENCES curso_escolar(id)
);