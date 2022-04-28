-- CONSULTAS sencillas
-- Muestra los nombres de los clientes junto con su nivel
select nombre, nivel
from clientes;
-- Muestra los pedidos cuyo precio sea mayor de 800
select num_pedido
from pedidos
where precio_pedido > 3000;

-- Vistas
-- Crea una vista con los agentes que hayan cerrado más de un pedido junto con el número de pedidos que han cerrado
create view agentes_pedidos as
select a.nombre, count(*) as pedidos_cerrados
from agentes a, pedidos p
where a.codigo = p.codigo_agente
group by a.nombre;

-- Subconsultas
-- Lista todos los clientes cuyo pais sea igual al de Steven y nivel igual al de Albert
select nombre
from clientes
where pais = (select pais from clientes where nombre = 'Steven')
and nivel = (select nivel from clientes where nombre = 'Albert');

-- Combinaciones de tablas
-- Muestra el nombre de todos los agentes junto con el nombre de la sucursal para la que trabajan ordenado alfabéticamente por sucursal
select a.nombre, s.nombre
from agentes a, sucursales s
where s.num_sucursal = a.sucursal
order by s.nombre;

-- Inserción de registros. Consultas de datos anexados
-- Inserta un nuevo agente con código A777, cuyo código de sucursal es 6, llamado Solid Snake, su área de trabajo es Brisban, su comisión es la misma que la de Iván, su número de teléfono es 008-84444156 y su país es Australia
insert into agentes values ('A777', 6, 'Solid Snake', 'Brisban', (select comision from agentes where nombre = 'Iván'), '008-84444156', 'Australia');

-- Modificación de registros. Consultas de actualización
-- Actualiza el area en las sucursales cuyo pais sea Italia y el area_trabajo en los directores y agentes cuyo pais sea Italia para que ahora el area/area_trabajo sea Verona en lugar de Torento
update sucursales s, directores d, agentes a
set s.area = 'Verona', d.area_trabajo = 'Verona', a.area_trabajo = 'Verona'
where s.pais = 'Italia' and d.pais = 'Italia' and a.pais = 'Italia';

-- Borrado de registros. Consultas de eliminación.
-- Elimina todos los pedidos realizados en el año 2008
delete from pedidos
where to_char(fecha_pedido, 'YYYY') = '2008';

-- Group by y having.
-- Muestra el nombre de todos los agentes y lo que han ganado en total solo si es mayor de 300
select a.nombre, sum(p.precio_pedido * a.comision) as ganancia
from agentes a, pedidos p
where a.codigo = p.codigo_agente
group by a.nombre
having sum(p.precio_pedido * a.comision) > 300;

-- Outer joins. Combinaciones externas.
-- Mostrar el nombre de todas las sucursales junto al número de agentes que posee
select s.nombre, count(*) as agentes
from sucursales s left join agentes a on s.codigo_agente = a.codigo
group by s.nombre;

-- Consultas con operadores de conjuntos.
-- Muestra el nombre, numero de sucursal y telefono de los directores y agentes
select nombre, num_sucursal, telefono
from agentes
where codigo = codigo_agente
union
select nombre, num_sucursal, telefono
from agentes
where codigo = codigo_agente;

-- Subconsultas correlacionadas. 
-- Muestra los pedidos cuyo precio son mayores al precio promedio de los pedidos
select num_pedido
from pedidos
where precio_pedido > (select avg(precio_pedido) from pedidos);
