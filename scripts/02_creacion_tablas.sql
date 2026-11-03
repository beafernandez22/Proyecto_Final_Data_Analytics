
USE hm_retail_intelligence;

CREATE TABLE IF NOT EXISTS clientes (
    customer_id VARCHAR(64) PRIMARY KEY,
    age TINYINT UNSIGNED NULL,
    club_member_status VARCHAR(20) NOT NULL
);

DESCRIBE clientes;

USE hm_retail_intelligence;

SELECT COUNT(*) AS total_clientes
FROM clientes;

CREATE TABLE clientes (
    customer_id VARCHAR(64) PRIMARY KEY,
    age TINYINT UNSIGNED NULL,
    club_member_status VARCHAR(20) NOT NULL
);

DESCRIBE clientes;


USE hm_retail_intelligence;

-- Eliminar la tabla antigua de artículos
DROP TABLE IF EXISTS articulos;

-- Crear la nueva tabla con las 6 columnas seleccionadas
CREATE TABLE articulos (
    article_id VARCHAR(10) PRIMARY KEY,
    prod_name VARCHAR(150),
    product_type_name VARCHAR(100),
    product_group_name VARCHAR(100),
    index_group_name VARCHAR(100),
    garment_group_name VARCHAR(100)
);

-- Comprobar la nueva estructura
DESCRIBE articulos;

-- Crear la tabla de artículos
CREATE TABLE articulos (
    article_id VARCHAR(10) PRIMARY KEY,
    prod_name VARCHAR(150),
    product_type_name VARCHAR(100),
    product_group_name VARCHAR(100),
    index_group_name VARCHAR(100),
    garment_group_name VARCHAR(100)
);

-- Comprobar la estructura
DESCRIBE articulos;


-- Crear la tabla de transacciones
CREATE TABLE IF NOT EXISTS transacciones (
    t_dat DATE NOT NULL,
    customer_id VARCHAR(64) NOT NULL,
    article_id VARCHAR(10) NOT NULL,
    price DOUBLE NOT NULL,
    sales_channel_id TINYINT UNSIGNED NOT NULL
);

-- Comprobar su estructura
DESCRIBE transacciones;


-- Crear la tabla de transacciones
CREATE TABLE transacciones (
    t_dat DATE NOT NULL,
    customer_id VARCHAR(64) NOT NULL,
    article_id VARCHAR(10) NOT NULL,
    price DOUBLE NOT NULL,
    sales_channel_id TINYINT UNSIGNED NOT NULL
);

-- Comprobar la estructura
DESCRIBE transacciones;


-- Comprobar el número de registros de cada tabla

SELECT COUNT(*) AS total_clientes
FROM clientes;

SELECT COUNT(*) AS total_articulos
FROM articulos;

SELECT COUNT(*) AS total_transacciones
FROM transacciones;

-- Índice para optimizar las consultas por cliente
CREATE INDEX idx_transacciones_cliente
ON transacciones (customer_id);


USE hm_retail_intelligence;

SHOW INDEX FROM transacciones;

-- Consultar los procesos activos en MySQL
SHOW FULL PROCESSLIST;

-- Cancelar la consulta antigua que está bloqueando el índice
KILL QUERY 23;


-- Comprobar si el índice ya se ha creado
SHOW INDEX FROM transacciones;

