# TP SQL - Retail Project

Script SQL para crear el esquema base de un proyecto retail
(clientes, productos, ventas) con restricciones de integridad
y carga inicial de datos.

## Cómo ejecutarlo

1. Crear una base de datos llamada `retail_project` en PostgreSQL.
2. Abrir `script_retail.sql` en pgAdmin (o el cliente que prefieras)
   conectado a esa base.
3. Ejecutar el script completo.

## Contenido del script

- Creación de las tablas `Clientes`, `Productos` y `Ventas` con
  claves primarias, foráneas y restricciones CHECK.
- Carga de datos iniciales (5 registros por tabla) dentro de una
  transacción `BEGIN...COMMIT`.
- Un `UPDATE` que aumenta un 3% el precio de los productos de
  la categoría Bazar.
- Un `DELETE` que elimina una venta de prueba.
