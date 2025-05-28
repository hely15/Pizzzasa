-- Ingredientes
INSERT INTO Ingredientes (nombre, cantidad) VALUES
('Queso mozzarella', '200g'), 
('Pepperoni', '150g'), 
('Masa', '1u'), 
('Tomate', '100g'),
('Champiñones', '100g'), 
('Jamón', '150g'), 
('Piña', '100g'), 
('Carne molida', '200g'),
('Cebolla', '100g'), 
('Aceitunas', '50g');

-- Producto
INSERT INTO Producto (nombre, precio, categoria, elaborado, disponible) VALUES
('Pizza Pepperoni', 20000, 'pizza', 'si', 'si'),
('Panzerotti de queso', 12000, 'panzarottis', 'si', 'si'),
('Postre de chocolate', 8000, 'postres', 'no', 'si'),
('Gaseosa 500ml', 4000, 'bebidas', 'no', 'si'),
('Pizza Hawaiana', 21000, 'pizza', 'si', 'si'),
('Pizza Vegetariana', 19000, 'pizza', 'si', 'no'),
('Jugo natural', 5000, 'bebidas', 'no', 'si'),
('Flan de vainilla', 8500, 'postres', 'no', 'si'),
('Panzerotti carne', 13000, 'panzarottis', 'si', 'si'),
('Pizza Mexicana', 22000, 'pizza', 'si', 'si');

-- Ingredientes_has_Producto
INSERT INTO Ingredientes_has_Producto (Ingredientes_id, Producto_id) VALUES
(1, 1), 
(2, 1), 
(3, 1), 
(1, 5), 
(6, 5), 
(7, 5),
 (3, 5),
 (1, 6),
 (4, 6), 
 (5, 6);

-- Combo
INSERT INTO Combo (nombre, descripcion, precio) VALUES
('Combo Familiar', 'Pizza + bebida', '25000'),
('Combo Pareja', '2 Panzerottis + bebida', '22000'),
('Combo Dulce', 'Postre + bebida', '10000'),
('Combo Vegetariano', 'Pizza Veg + bebida', '23000'),
('Combo Niño', 'Panzerotti + postre', '15000'),
('Combo Fiesta', '3 pizzas + bebidas', '60000'),
('Combo Ejecutivo', 'Pizza + jugo', '27000'),
('Combo Sweet', '2 postres', '15000'),
('Combo Amigos', '2 panzerottis + 2 jugos', '30000'),
('Combo Picante', 'Pizza mexicana + gaseosa', '26000');

-- CombosProductos
INSERT INTO CombosProductos (cantidad, Combo_id, Producto_id) VALUES
(1, 1, 1), 
(1, 1, 4), 
(2, 2, 2), 
(1, 2, 4), 
(1, 3, 3), 
(1, 3, 4), 
(1, 4, 6),
(1, 4, 7), 
(1, 5, 2), 
(1, 5, 3);

-- Clientes
INSERT INTO Clientes (nombre, telefono) VALUES
('Ana Torres', '3001112233'), 
('Carlos Rojas', '3019998888'), 
('Marta Ruiz', '3104455667'),
('Pedro Gómez', '3127788990'), 
('Laura Pérez', '3138899776'), 
('Sofía Jiménez', '3145522331'),
('Luis Cardona', '3219988776'), 
('Diego Muñoz', '3202233445'), 
('Andrea Castro', '3156677889'),
('Felipe Naranjo', '3164455667');

-- Pedido
INSERT INTO Pedido (fecha, metodoPago, modalidadPedido, Clientes_id) VALUES
(NOW(), 'efectivo', 'llevar', 1), 
(NOW(), 'nequi', 'recoger', 2), 
(NOW(), 'tarjeta', 'llevar', 3),
(NOW(), 'efectivo', 'recoger', 4), 
(NOW(), 'nequi', 'llevar', 5), 
(NOW(), 'efectivo', 'recoger', 6),
(NOW(), 'tarjeta', 'llevar', 7), 
(NOW(), 'nequi', 'llevar', 8), 
(NOW(), 'tarjeta', 'recoger', 9),
(NOW(), 'efectivo', 'llevar', 10);

-- ComboPedido
INSERT INTO ComboPedido (cantidad, Combo_id, Pedido_id) VALUES
('1', 1, 1), 
('1', 2, 2), 
('2', 3, 3), 
('1', 4, 4), 
('1', 5, 5),
('2', 6, 6), 
('1', 7, 7), 
('2', 8, 8), 
('1', 9, 9), 
('1', 10, 10);

-- ProductoPedido
INSERT INTO ProductoPedido (id, Producto_id, Pedido_id, cantidad) VALUES
(1, 1, 1, '1'), 
(2, 2, 2, '2'), 
(3, 3, 3, '1'), 
(4, 4, 4, '1'), 
(5, 5, 5, '1'),
(6, 6, 6, '1'), 
(7, 7, 7, '2'), 
(8, 8, 8, '1'), 
(9, 9, 9, '1'), 
(10, 10, 10, '2');

-- Adicionales
INSERT INTO Adicionales (nombre, precio) VALUES
('Extra Queso', 2000), 
('Salsa BBQ', 1500), 
('Tocineta', 2500), 
('Aceitunas', 1000),
('Arequipe', 1800), 
('Salsa Ranch', 1200), 
('Jalapeños', 1700), 
('Maíz', 1000),
('Piña extra', 1200), 
('Chocolate líquido', 1500);

-- AdicionalesPedido
INSERT INTO AdicionalesPedido (Adicionales_id, Pedido_id, cantidad) VALUES
(1, 1, '1'), 
(2, 2, '1'), 
(3, 3, '2'), 
(4, 4, '1'), 
(5, 5, '2'),
(6, 6, '1'), 
(7, 7, '1'), 
(8, 8, '2'), 
(9, 9, '1'), 
(10, 10, '1');