CREATE DATABASE prueba;

CREATE TABLE clientes(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    rut NUMERIC(10) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE facturas(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    fecha_factura INT NOT NULL,
    subtotal INT NOT NULL,
    clientes_id FOREIGN KEY (id)
    REFERENCES cliente (id)
);

CREATE TABLE productos(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    valor_unitario INT NOT NULL,
    categoria_id FOREIGN KEY
    REFERENCES categorias(id)
);

CREATE TABLE categorias(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200)
);

CREATE TABLE facturas_productos(
    id INT NOT NULL UNIQUE PRIMARY KEY,
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

INSERT INTO productos(
    id,
    nombre,
    descripcion,
    valor_unitario,
    categoria_id
), VALUES(
    '1',
    'crema',
    'crema para piel',
    '8.000',
    '1'
), (
    '2',
    'perfume',
    'perfume aroma bosque',
    '20.000',
    '1'
), (
    '3',
    'polera',
    'polera con filtro uv'
    '30.000',
    '2'
), (
    '4',
    'guitara',
    'guitarra acústica',
    '100.000',
    '3'
), (
    '5',
    'piano',
    'piano para aprender',
    '300.000',
    '3'
), (
    '6',
    'flauta',
    'flauta dulce',
    '10.000',
    '3'
), (
    '7',
    'camisa',
    'camisa para pesca con mosca',
    '50.000',
    '2'
), (
    '8',
    'gorro',
    'gorro para trotar',
    '20.000',
    '2'
);

INSERT INTO categorias(
    id,
    nombre,
    descripcion
), VALUES(
    '1',
    'belleza',
    'productos de belleza'
), (
    '2',
    'ropa deportiva',
    'ropa técnica para hacer deporte'
), (
    '3',
    'instrumentos musicales',
    'aprende a tocar un instrumento este año'
);


INSERT INTO facturas(
    id,
    fecha_factura,
    subtotal,
    clientes_id
), VALUES(
    '1',
    '2001-02-03',
    '',
    '1'
), (
    '2',
    '2001-03-03',
    '',
    '1'
), (
    '3',
    '2005-02-06',
    '',
    '2'
), (
    '4',
    '2006-01-02',
    '',
    '2'
), (
    '5',
    '2007-05-07',
    '',
    '2'
), (
    '6',
    '2012-02-01',
    '',
    '3'
), (
    '7',
    '2019-01-02',
    '',
    '4'
), (
    '8',
    '2019-02-03',
    '',
    '4'
), (
    '9',
    '2020-02-08',
    '',
    '4'
), (
    '10',
    '2020-03-01',
    '',
    '4'
);

