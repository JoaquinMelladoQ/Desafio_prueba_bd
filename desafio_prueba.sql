CREATE DATABASE prueba;

CREATE TABLE cliente(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    rut NUMERIC(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE facturas(
    id SERIAL PRIMARY KEY,
    fecha_factura DATE DEFAULT CURRENT_DATE,
    subtotal INT NOT NULL,
    iva INT NOT NULL,
    total INT NOT NULL,
    clientes_id FOREIGN KEY (id),
    REFERENCES cliente (id)
);