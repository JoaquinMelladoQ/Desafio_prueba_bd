CREATE DATABASE prueba;

CREATE TABLE clientes(
    id INT NOT NULL UNIQUE PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    rut NUMERIC(9) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

CREATE TABLE facturas(
    id_factura INT NOT NULL UNIQUE PRIMARY KEY,
    fecha_factura INT NOT NULL,
    subtotal INT NOT NULL,
    clientes_id INT NOT NULL FOREIGN KEY (id)
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
    cantidad INT NOT NULL
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
    'matta 310'
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
    '80',
    '1'
), (
    '2',
    'perfume',
    'perfume aroma bosque',
    '200',
    '1'
), (
    '3',
    'polera',
    'polera con filtro uv',
    '35',
    '2'
), (
    '4',
    'guitara',
    'guitarra acústica',
    '30',
    '3'
), (
    '5',
    'piano',
    'piano para aprender',
    '300',
    '3'
), (
    '6',
    'flauta',
    'flauta dulce',
    '50',
    '3'
), (
    '7',
    'camisa',
    'camisa para pesca con mosca',
    '25',
    '2'
), (
    '8',
    'gorro',
    'gorro para trotar',
    '10',
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
    '160',
    '1'
    -- Esposito
), (
    -- 3 productos
    '2',
    '2001-03-03',
    '150',
    '1'
    -- Esposito
), (
    -- 3 productos
    '3',
    '2005-02-06',
    '105',
    '2'
    -- Esperanza
), (
    -- 2 productos
    '4',
    '2006-01-02',
    '600',
    '2'
    -- Esperanza
), (
    -- 3 productos
    '5',
    '2007-05-07',
    '90',
    '2'
    -- Esperanza
), (
    -- 1 prodcuto
    '6',
    '2012-02-01',
    '25',
    '3'
    -- Camilo
), (
    -- 2 productos
    '7',
    '2019-01-02',
    '20',
    '4'
    -- Florencia
), (
    -- 3 productos
    '8',
    '2019-02-03',
    '90',
    '4'
    -- Florencia
), (
    -- 4 productos
    '9',
    '2020-02-08',
    '1200',
    '4'
    -- Florencia
), (
    -- 1 producto
    '10',
    '2020-03-01',
    '50',
    '4'
    -- Florencia
);

INSERT INTO facturas_productos(
    id,
    facturas_id,
    productos_id,
    cantidad,
), VALUES(
    '1',
    '1', -- facturas_id 
    '1', -- crema * 2 = 160
    '2' -- cantidad  
), (
    '2',
    '2', -- facturas_id
    '6', -- flauta * 3 = 150
    '3' -- cantidad
), (
    '3',
    '3', -- facturas_id
    '3', -- polera * 3 = 105
    '3' -- cantidad
), (
    '4',
    '4', -- facturas_id
    '5', --piano * 2 = 600
    '2' -- cantidad
), (
    '5',
    '5', -- facturas_id
    '4', -- guitarra * 3 = 90
    '3' -- cantidad
), (
    '6',
    '6', -- facturas_id
    '7', -- camisa * 1 = 25
    '1' -- cantidad
), (
    '7',
    '7', -- facturas_id
    '8', -- gorro * 2 = 20
    '2' -- cantidad
), (
    '8',
    '8', -- facturas_id
    '4', -- guitarra * 3 = 90
    '3' -- cantidad
), (
    '9',
    '9', -- facturas_id
    '5', -- piano * 4 = 1200
    '4' -- cantidad
), (
    '10',
    '10', -- facturas_id
    '6', -- flauta * 1 = 50
    '1' -- cantidad
);


-- Parte 3: Consultas
-- Realizar las siguientes consultas:
-- ¿Que cliente realizó la compra más cara?
-- ¿Que cliente pagó sobre 100 de monto?
-- ¿Cuantos clientes han comprado el producto 6.


SELECT clientes_id FROM facturas
ORDER BY subtotal DESC LIMIT 1;


SELECT clientes_id FROM facturas
WHERE subtotal > 100
GROUP BY clientes_id
ORDER BY clientes_id;


SELECT COUNT(DISTINCT clientes_id) FROM
facturas AS fas INNER JOIN
facturas_productos AS fapro ON
fas.id_factura = fapro.facturas_id
WHERE productos_id = 6;




