CREATE DATABASE prueba;

CREATE TABLE clientes(
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
    clientes_id FOREIGN KEY (id)
    REFERENCES cliente (id)
);

CREATE TABLE productos(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    valor_unitario INT NOT NULL,
    categoria_id FOREIGN KEY
    REFERENCES categorias(id)
);

CREATE TABLE categorias(
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200)
);

CREATE TABLE facturas_productos(
    id SERIAL PRIMARY KEY,
    facturas_id FOREIGN KEY
    REFERENCES facturas (id),
    productos_id FOREIGN KEY
    REFERENCES productos (id)
);

INSERT INTO clientes(
    nombre,
    rut,
    direccion
), VALUES(
    'Esposito',
    '22533335',
    'quinta avenina 322'
), (
    'Esperanza',
    '299938655',
    'san ignacio 256'
), (
    'Camilo',
    '125456578',
    'mata 310'
), (
    'Florencia',
    '75459394',
    'echevers 98'
), (
    'Cecilia',
    '92446285',
    'libertad 270'
);