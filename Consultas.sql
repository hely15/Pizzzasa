-- 1. Productos más vendidos por categoría
SELECT p.categoria, pr.nombre, SUM(pp.cantidad) AS total_vendidos
FROM ProductoPedido pp
JOIN Producto pr ON pp.Producto_id = pr.id
GROUP BY pr.id
ORDER BY total_vendidos DESC;

-- 2. Total de ingresos generados por cada combo
SELECT c.nombre, SUM(cp.cantidad * c.precio) AS total_ingresos
FROM ComboPedido cp
JOIN Combo c ON cp.Combo_id = c.id
GROUP BY cp.Combo_id;

-- 3. Pedidos realizados para recoger vs. llevar
SELECT modalidadPedido, COUNT(*) AS total_pedidos
FROM Pedido
GROUP BY modalidadPedido;

-- 4. Adiciones más solicitadas en pedidos personalizados
SELECT a.nombre, SUM(ap.cantidad) AS total_usos
FROM AdicionalesPedido ap
JOIN Adicionales a ON ap.Adicionales_id = a.id
GROUP BY a.id
ORDER BY total_usos DESC;

-- 5. Cantidad total de productos vendidos por categoría
SELECT pr.categoria, SUM(pp.cantidad) AS total
FROM ProductoPedido pp
JOIN Producto pr ON pp.Producto_id = pr.id
GROUP BY pr.categoria;

-- 6. Promedio de pizzas pedidas por cliente
SELECT AVG(sub.total_pizzas) AS promedio_pizzas
FROM (
  SELECT p.Clientes_id, SUM(pp.cantidad) AS total_pizzas
  FROM Pedido p
  JOIN ProductoPedido pp ON p.id = pp.Pedido_id
  JOIN Producto pr ON pp.Producto_id = pr.id
  WHERE pr.categoria = 'pizza'
  GROUP BY p.Clientes_id
) AS sub;

-- 7. Total de ventas por día de la semana
SELECT DAYNAME(fecha) AS dia_semana, COUNT(*) AS total_pedidos
FROM Pedido
GROUP BY dia_semana;

-- 8. Cantidad de panzarottis vendidos con extra queso
SELECT SUM(pp.cantidad) AS total
FROM ProductoPedido pp
JOIN Producto pr ON pp.Producto_id = pr.id
JOIN Pedido p ON p.id = pp.Pedido_id
JOIN AdicionalesPedido ap ON ap.Pedido_id = p.id
JOIN Adicionales a ON a.id = ap.Adicionales_id
WHERE pr.categoria = 'panzarottis' AND a.nombre LIKE '%queso%';

-- 9. Pedidos que incluyen bebidas como parte de un combo
SELECT DISTINCT cp.Pedido_id
FROM CombosProductos cpb
JOIN Producto pr ON cpb.Producto_id = pr.id
JOIN ComboPedido cp ON cp.Combo_id = cpb.Combo_id
WHERE pr.categoria = 'bebidas';

-- 10. Clientes con más de 5 pedidos en el último mes
SELECT c.nombre, COUNT(p.id) AS total_pedidos
FROM Pedido p
JOIN Clientes c ON p.Clientes_id = c.id
WHERE p.fecha >= NOW() - INTERVAL 1 MONTH
GROUP BY c.id
HAVING total_pedidos > 5;

-- 11. Ingresos por productos no elaborados
SELECT SUM(pr.precio * pp.cantidad) AS total_no_elaborados
FROM ProductoPedido pp
JOIN Producto pr ON pp.Producto_id = pr.id
WHERE pr.elaborado = 'no';

-- 12. Promedio de adiciones por pedido
SELECT AVG(sub.total_adiciones) AS promedio
FROM (
  SELECT Pedido_id, SUM(cantidad) AS total_adiciones
  FROM AdicionalesPedido
  GROUP BY Pedido_id
) AS sub;

-- 13. Total de combos vendidos en el último mes
SELECT SUM(cantidad) AS total
FROM ComboPedido
JOIN Pedido ON ComboPedido.Pedido_id = Pedido.id
WHERE Pedido.fecha >= NOW() - INTERVAL 1 MONTH;

-- 14. Clientes con pedidos para recoger y para llevar
SELECT Clientes_id
FROM Pedido
GROUP BY Clientes_id
HAVING COUNT(DISTINCT modalidadPedido) > 1;

-- 15. Total de productos personalizados con adiciones
SELECT COUNT(DISTINCT Pedido_id) AS total
FROM AdicionalesPedido;

-- 16. Pedidos con más de 3 productos diferentes
SELECT Pedido_id
FROM ProductoPedido
GROUP BY Pedido_id
HAVING COUNT(DISTINCT Producto_id) > 3;

-- 17. Promedio de ingresos generados por día
SELECT AVG(sub.total) AS promedio_diario
FROM (
  SELECT DATE(fecha) AS dia, SUM(pr.precio * pp.cantidad) AS total
  FROM Pedido p
  JOIN ProductoPedido pp ON p.id = pp.Pedido_id
  JOIN Producto pr ON pp.Producto_id = pr.id
  GROUP BY dia
) AS sub;

-- 18. Clientes que piden pizzas con adiciones en más del 50% de sus pedidos
SELECT c.id, c.nombre
FROM Clientes c
JOIN Pedido p ON c.id = p.Clientes_id
LEFT JOIN (
  SELECT DISTINCT Pedido_id FROM ProductoPedido pp
  JOIN Producto pr ON pp.Producto_id = pr.id
  WHERE pr.categoria = 'pizza'
) AS pizzas ON pizzas.Pedido_id = p.id
LEFT JOIN (
  SELECT DISTINCT Pedido_id FROM AdicionalesPedido
) AS adiciones ON adiciones.Pedido_id = p.id
GROUP BY c.id
HAVING SUM(adiciones.Pedido_id IS NOT NULL AND pizzas.Pedido_id IS NOT NULL) / COUNT(p.id) > 0.5;

-- 19. Porcentaje de ventas de productos no elaborados
SELECT
  (SUM(CASE WHEN elaborado = 'no' THEN pr.precio * pp.cantidad ELSE 0 END) / SUM(pr.precio * pp.cantidad)) * 100 AS porcentaje_no_elaborado
FROM ProductoPedido pp
JOIN Producto pr ON pp.Producto_id = pr.id;
 
-- 20. Día con más pedidos para recoger
SELECT DAYNAME(fecha) AS dia, COUNT(*) AS total
FROM Pedido
WHERE modalidadPedido = 'recoger'
GROUP BY dia
ORDER BY total DESC
LIMIT 1;
