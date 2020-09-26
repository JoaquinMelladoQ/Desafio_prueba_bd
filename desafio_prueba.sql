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

CREATE TABLE categorias(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(200)
);

CREATE TABLE productos(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    valor_unitario INT NOT NULL,
    categoria_id FOREIGN KEY
    REFERENCES categorias(id)
);

CREATE TABLE facturas_productos(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    facturas_id FOREIGN KEY
    REFERENCES facturas (id),
    productos_id FOREIGN KEY
    REFERENCES productos (id),
    cantidad INT NOT NULL,
    total INT NOT NULL
);

INSERT INTO clientes(
    id,
    nombre,
    rut,
    direccion
), VALUES(
    '1',
    'Esposito',
    '22533335',
    'quinta avenina 322'
), (
    '2',
    'Esperanza',
    '299938655',
    'san ignacio 256'
), (
    '3',
    'Camilo',
    '125456578',
    'mata 310'
), (
    '4',
    'Florencia',
    '75459394',
    'echevers 98'
), (
    '5',
    'Cecilia',
    '92446285',
    'libertad 270'
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


-- subtotal: suma de todos los valores unitarios de cada producto por su cantidad

-- 10 facturas
-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto

INSERT INTO facturas(
    id,
    fecha_factura,
    subtotal,
    clientes_id
), VALUES(
    -- 2 productos
    '1',
    '2001-02-03',
    '16.000',
    '1'
), (
    -- 3 productos
    '2',
    '2001-03-03',
    '60.000',
    '1'
), (
    -- 3 productos
    '3',
    '2005-02-06',
    '',
    '2'
), (
    -- 2 productos
    '4',
    '2006-01-02',
    '',
    '2'
), (
    -- 3 productos
    '5',
    '2007-05-07',
    '',
    '2'
), (
    -- 1 prodcuto
    '6',
    '2012-02-01',
    '',
    '3'
), (
    -- 2 productos
    '7',
    '2019-01-02',
    '',
    '4'
), (
    -- 3 productos
    '8',
    '2019-02-03',
    '',
    '4'
), (
    -- 4 productos
    '9',
    '2020-02-08',
    '',
    '4'
), (
    -- 1 producto
    '10',
    '2020-03-01',
    '',
    '4'
);

INSERT INTO facturas_productos(
    id,
    facturas_id,
    productos_id,
    cantidad,
    total
), VALUES(
    '1',
    '1',
    '1',
    '1',
    ''
), (
    '2',
    '1',
    '2',
    '1',
    ''
), (
    '3',
    '2',
    '3',
    '1',
    ''
), (
    '4',
    '2',
    '5',
    '1',
    ''
), (
    '5',
    '2',
    '4',
    '2',
    ''
), (
    '6',
    '3',
    '7',
    '1',
    ''
), (
    '7',
    '3',
    '8',
    '1',
    ''
), (
    '8',
    '3',
    '4',
    '1',
    ''
), (
    '9',
    '4',
    '5',
    '1',
    ''
), (
    '10',
    '4',
    '7',
    '2',
    ''
), (
    '11',
    '5',
    '6',
    '1',
    ''
), (
    '12',
    '5',
    '1',
    '1',
    ''
), (
    '13',
    '5',
    '7',
    '3',
    ''
), (
    '14',
    '6',
    '5',
    '2',
    ''
), (
    '15',
    '7',
    '2',
    '1',
    ''
), (
    '16',
    '7',
    '1',
    '1',
    ''
), (
    '17',
    '8',
    '4',
    '2',
    ''
), (
    '18',
    '8',
    '5',
    '1',
    ''
), (
    '19',
    '8',
    '8',
    '1'.
    ''
), (
    '20',
    '9',
    '8',
    '1',
    ''
), (
    '21',
    '9',
    '7',
    '1',
    ''
), (
    '22',
    '9',
    '6',
    '1',
    ''
), (
    '23',
    '9',
    '1',
    '1',
    ''
), (
    '24',
    '10',
    '5',
    '1',
    ''
);


