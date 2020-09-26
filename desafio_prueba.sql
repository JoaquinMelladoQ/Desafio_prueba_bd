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
    nombre,
    descripcion,
    valor_unitario,
), VALUES(
    'crema',
    'crema para piel',
    '8.000'
), (
    'perfume',
    'perfume aroma bosque',
    '20.000'
), (
    'polera',
    'polera con filtro uv'
    '30.000'
), (
    'guitara',
    'guitarra acústica',
    '100.000'
), (
    'piano',
    'piano para aprender',
    '300.000'
), (
    'flauta',
    'flauta dulce',
    '10.000'
), (
    'camisa',
    'camisa para pesca con mosca',
    '50.000'
), (
    'gorro',
    'gorro para trotar',
    '20.000'
);

INSERT INTO categorias(
    nombre,
    descripcion
), VALUES(
    'belleza',
    'productos de belleza'
), (
    'ropa deportiva',
    'ropa técnica para hacer deporte'
), (
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

)