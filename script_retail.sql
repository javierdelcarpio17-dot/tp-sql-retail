
--Parte 1. DDL--

--1 Tabla clientes--

CREATE TABLE Clientes (
Clientes_id SERIAL PRIMARY KEY,
Mail VARCHAR (50) UNIQUE NOT NULL,
Edad INT CHECK (Edad >=18) NOT NULL
);

-- Tabla productos -- 
CREATE TABLE Productos (
Productos_id SERIAL PRIMARY KEY,
Nombre VARCHAR (50),
Categoria VARCHAR (50),
Stock INT CHECK (Stock>=0),
Precio DECIMAL (10,2) NOT NULL CHECK (precio >0)
);

-- Tabla ventas -- 
CREATE TABLE Ventas (
Ventas_id SERIAL PRIMARY KEY,
Clientes_id INT REFERENCES Clientes ( clientes_id),
Productos_id INT REFERENCES Productos (Productos_id),
Cantidad INT NOT NULL CHECK ( Cantidad>0),
Fecha_Venta DATE NOT NULL
);

--- Parte 2. DML

--Tabla clientes --

BEGIN;
INSERT INTO Clientes (mail, edad)
VALUES('javier@gmail.com',38),
('franco@gmail.com',20),
('micaela@gmail.com',33),
('fabian@gmail.com',57),
('pablo@gmail.com',43);


-- Tabla productos -- 

INSERT INTO Productos (Nombre,categoria,stock,precio)
VALUES ('Pelota','Deporte',100,'25.5'),
('Paleta','Deporte',150,'35.00'),
('Termo','Bazar',300,'27.50'),
('Mate','Bazar',450,'15.50'),
('Mouse','Computacion',20,'50')
;

-- Tabla ventas --

INSERT INTO Ventas ( Clientes_id,Productos_id,Cantidad,Fecha_Venta)
VALUES (1,1,100,'2026-01-10'),
(2,2,200,'2026-01-12'),
(3,3,15,'2026-01-18'),
(4,4,10,'2026-01-20'),
(5,5,200,'2026-01-22');

COMMIT;


--Paso 4- UPDATE Y DELETE--

UPDATE Productos
SET precio = precio*1.10
WHERE Categoria='Bazar'
;

DELETE FROM Ventas
WHERE Ventas_id = 5
;

