USE hm_retail_intelligence;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

USE hm_retail_intelligence;

-- Importar el dataset de clientes preparado en Python
LOAD DATA LOCAL INFILE 'C:/Users/hp/Desktop/IronHackBeatriz/Proyectos/Proyecto_Final_Data_Analytics/Proyecto_Final_Data_Analytics/data/processed/clientes_preparados.csv'
INTO TABLE clientes
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    customer_id,
    @edad,
    club_member_status
)
SET age = NULLIF(TRIM(@edad), '');


SELECT COUNT(*) AS clientes_antes
FROM clientes;

-- Validación de la importación de clientes

SELECT
    COUNT(*) AS total_clientes,
    SUM(age IS NULL) AS edades_nulas,
    COUNT(DISTINCT customer_id) AS clientes_unicos
FROM clientes;

-- Comprobar que la tabla de artículos está vacía
SELECT COUNT(*) AS articulos_antes
FROM articulos;


-- Importar los artículos con el formato correcto de Windows
LOAD DATA LOCAL INFILE 'C:/Users/hp/Desktop/IronHackBeatriz/Proyectos/Proyecto_Final_Data_Analytics/Proyecto_Final_Data_Analytics/data/processed/articulos_preparados.csv'
INTO TABLE articulos
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    article_id,
    prod_name,
    product_type_name,
    product_group_name,
    index_group_name,
    garment_group_name
);



-- Validación de la importación de artículos

SELECT
    COUNT(*) AS total_articulos,
    COUNT(DISTINCT article_id) AS articulos_unicos,
    SUM(LEFT(article_id, 1) = '0') AS ids_con_cero_inicial
FROM articulos;


-- Inspeccionar los artículos importados
SELECT *
FROM articulos;

SHOW WARNINGS;

-- Vaciar la tabla de artículos
TRUNCATE TABLE articulos;

-- Comprobar que está vacía
SELECT COUNT(*) AS articulos_antes
FROM articulos;


-- Comprobar que transacciones está vacía
SELECT COUNT(*) AS transacciones_antes
FROM transacciones;


-- Importar las transacciones del periodo seleccionado

LOAD DATA LOCAL INFILE 'C:/Users/hp/Desktop/IronHackBeatriz/Proyectos/Proyecto_Final_Data_Analytics/Proyecto_Final_Data_Analytics/data/processed/transacciones_preparadas.csv'
INTO TABLE transacciones
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
    t_dat,
    customer_id,
    article_id,
    price,
    sales_channel_id
);


-- Validar el número de transacciones y el periodo

SELECT
    COUNT(*) AS total_transacciones,
    MIN(t_dat) AS primera_fecha,
    MAX(t_dat) AS ultima_fecha
FROM transacciones;

-- Validación de calidad de transacciones

SELECT
    SUM(t_dat IS NULL) AS fechas_nulas,
    SUM(customer_id IS NULL) AS clientes_nulos,
    SUM(article_id IS NULL) AS articulos_nulos,
    SUM(price IS NULL) AS precios_nulos,
    SUM(sales_channel_id IS NULL) AS canales_nulos,
    MIN(price) AS precio_minimo,
    MAX(price) AS precio_maximo,
    MIN(sales_channel_id) AS canal_minimo,
    MAX(sales_channel_id) AS canal_maximo
FROM transacciones;


-- Comprobar la relación entre transacciones y clientes

SELECT
    COUNT(*) AS transacciones_sin_cliente
FROM transacciones AS t
LEFT JOIN clientes AS c
    ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


SHOW INDEX FROM transacciones;

-- Comprobar si existen transacciones sin cliente asociado
-- Detener la búsqueda al encontrar la primera coincidencia

SELECT t.customer_id
FROM transacciones AS t
LEFT JOIN clientes AS c
    ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL
LIMIT 1;

SHOW FULL PROCESSLIST;

-- Comprobación inicial de la relación con artículos
SELECT
    t.article_id,
    a.prod_name
FROM (
    SELECT article_id
    FROM transacciones
    LIMIT 1000
) AS t
LEFT JOIN articulos AS a
    ON t.article_id = a.article_id
LIMIT 10;

-- Consultar el tamaño de nuestras tres tablas
SELECT
    table_name,
    ROUND(data_length / 1024 / 1024, 2) AS datos_mb,
    ROUND(index_length / 1024 / 1024, 2) AS indices_mb
FROM information_schema.tables
WHERE table_schema = 'hm_retail_intelligence'
  AND table_name IN ('clientes', 'articulos', 'transacciones');


-- Comprobar los índices de la tabla de transacciones
SHOW INDEX FROM transacciones;

-- Comprobar las claves foráneas existentes
USE hm_retail_intelligence;

SELECT
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hm_retail_intelligence'
  AND TABLE_NAME = 'transacciones'
  AND REFERENCED_TABLE_NAME IS NOT NULL;
  
-- Relacionar las transacciones con los artículos
ALTER TABLE transacciones
ADD CONSTRAINT fk_transacciones_articulos
FOREIGN KEY (article_id)
REFERENCES articulos(article_id);