-- DDL - ESTRUCTURA DE TABLAS --

-- Tabla clientes -- 

CREATE TABLE clientes (
cliente_id SERIAL PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
email VARCHAR (50) UNIQUE NOT NULL,
edad INT CHECK ( edad >=18) NOT NULL
);

-- Tabla productos --

CREATE TABLE productos (
producto_id SERIAL PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
categoria VARCHAR (50) NOT NULL,
precio DECIMAL (10,2) CHECK (precio >0) NOT NULL,
stock INT CHECK (stock>=0) NOT NULL
);

-- Tabla ventas -- 

CREATE TABLE ventas (
venta_id SERIAL PRIMARY KEY,
cliente_id INT REFERENCES clientes ( cliente_id) NOT NULL,
producto_id INT REFERENCES productos ( producto_id) NOT NULL,
cantidad INT CHECK (cantidad > 0) NOT NULL,
fecha_venta DATE NOT NULL
);


-- Parte 2 DML -- 

-- Tabla clientes -- 

BEGIN;
INSERT INTO clientes (nombre,email,edad)
VALUES 
('javier','javier@gmail.com',38),
('matias','matias@gmail.com',20),
('micaela','micaela@gmail.com',33),
('fabian','fabian@gmail.com',57),
('pablo','pablo@gmail.com',43);
COMMIT ;

--Tabla productos -- 
BEGIN;
INSERT INTO productos (nombre,categoria,precio,stock)
VALUES 
('teclado','informatica',50.25,50),
('mouse','informatica',15.50,150),
('auriculares','informatica',20.5,175),
('termo','bazar',75.25,200),
('mate','bazar',40.99,250);
COMMIT;

-- Tabla ventas -- 
BEGIN;
INSERT INTO ventas (cliente_id,producto_id,cantidad,fecha_venta)
VALUES 
(1,1,25,'2026-01-10'),
(2,2,20,'2026-01-12'),
(3,3,15,'2026-01-18'),
(4,4,10,'2026-01-20'),
(5,5,100,'2026-01-22');
COMMIT ;

-- Parte 3 UPDATE / DELETE -- 

UPDATE productos
SET precio = precio * 1.03
WHERE categoria = 'bazar'
;

DELETE FROM ventas
WHERE fecha_venta >= '2026-01-22'
;
