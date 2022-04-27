### Tabla Sucursales
| Sucursales            |                          |                           |
|-----------------------|--------------------------|---------------------------|
| **Num_Sucursal**      | Numérico, 1              | Clave Primaria            |                 
| Nombre                | Cadena de caracteres, 40 | No nulo y único           |
| Area                  | Cadena de caracteres, 35 | No nulo                   |
| Pais                  | Cadena de caracteres, 25 | No nulo                   |

### Tabla Directores
| Directores   |                          |                                    |
|--------------|--------------------------|------------------------------------|
| **Código**   | Cadena de caracteres, 6  | Clave Primaria                     |
| _Sucursal_   | Numérico, 1              | Clave Foranea y única              |
| Nombre       | Cadena de caracteres, 40 | No nulo                            |
| Area_Trabajo | Cadena de caracteres, 35 | No nulo                            |
| Salario      | Decimal, 10,2            | No nulo y por defecto es '4500'    |
| Teléfono     | Cadena de caracteres, 15 | No nulo y único                    |
| Pais         | Cadena de caracteres, 25 | No nulo                            |

### Tabla Agentes
| Agentes      |                          |                                    |
|--------------|--------------------------|------------------------------------|
| **Código**   | Cadena de caracteres, 6  | Clave Primaria                     |
| _Sucursal_   | Numérico, 1              | Clave Foranea                      |
| Nombre       | Cadena de caracteres, 40 | No nulo                            |
| Area_Trabajo | Cadena de caracteres, 35 | No nulo                            |
| Comision     | Decimal, 10,2            | No nulo y por defecto es '0.10'    |
| Teléfono     | Cadena de caracteres, 15 | No nulo y único                    |

### Tabla Clientes
| Clientes         |                          |                                |
|------------------|--------------------------|--------------------------------|
| **Código**       | Cadena de caracteres, 6  | Clave Primaria                 |
| Nombre           | Cadena de caracteres, 40 | No nulo                        |
| Ciudad           | Cadena de caracteres, 35 |                                |
| Area_Trabajo     | Cadena de caracteres, 35 | No nulo                        |
| Pais             | Cadena de caracteres, 20 | No nulo                        |
| Nivel            | Numérico, 1              |                                |
| Teléfono         | Cadena de caracteres, 15 | No nulo y único                |
| _Codigo_Agente_  | Cadena de caracteres, 6  | Clave Foranea                  |

### Tabla Pedidos
| Pedidos            |                          |                              |
|--------------------|--------------------------|------------------------------|
| **Num_Pedido**     | Cadena de caracteres, 6  | Clave Primaria               |
| Precio_Pedido      | Decimal, 12,2            | No nulo                      |
| Señal              | Decimal, 12,2            | No nulo y por defecto será 0 |
| Fecha_Pedido       | Fecha                    | No nulo y el año no podrá ser menor de 2006|
| _Codigo_Cliente_   | Cadena de caracteres, 6  | Clave Foranea                |
| _Codigo_Agente_    | Cadena de caracteres, 6  | Clave Foranea                |
| Descripcion_Pedido | Cadena de caracteres, 60 | No nulo                      |

----------------------

### Añade las siguientes restricciones una vez hayas creado las tablas:
- Desactiva temporalmente la restricción que afecta al año de la fecha del pedido
- Elimina la restricción del valor por defecto que afecta a la señal del pedido
- Añade una nueva columna a la tabla Sucursales donde guardaremos la fecha en la cual se creó la sucursal
- Elimina la columna Codigo_Agente de la tabla Clientes
- Añade una restricción sobre la columna de la fecha de creación de la sucursal, el año no puede ser inferior a 2006
- Añade una columna llamada DNI a los directores, agentes y clientes
- Los DNI no se pueden repetir
- El DNI de los directores, agentes y clientes está compuesto por 8 números y termina por una letra mayúscula
- Activa nuevamente la restricción que desactivamos referente a la fecha del pedido
- El código de los directores siempre comenzará por una D mayúscula
- El código de los agentes siempre comenzará por una A mayúscula
- El código de los clientes siempre comenzará por una C mayúscula

----------------------

### Consultas sencillas
- Muestra los nombres de los clientes junto con su nivel
- Muestra los pedidos cuyo precio sea mayor de 800

### Vistas
- Crea una vista con los agentes que hayan cerrado más de un pedido junto con el número de pedidos que han cerrado

### Subconsultas
- Lista todos los clientes cuyo pais y nivel sean igual al de Steven

### Combinaciones de tablas
- Muestra el nombre de todos los agentes junto con el nombre de la sucursal para la que trabajan ordenado alfabéticamente por sucursal

### Inserción de registros. Consultas de datos anexados
- Inserta un nuevo agente con código A777, cuyo código de sucursal es 6, llamado Solid Snake, su área de trabajo es Brisban, su comisión es la misma 
  que la de Iván, su número de teléfono es 008-84444156 y su país es Australia.

### Modificación de registros. Consultas de actualización
- Actualiza el area en las sucursales cuyo pais sea Italia y el area_trabajo en los directores y agentes cuyo pais sea Italia para que ahora el area/area_trabajo sea Verona en lugar de Torento

### Borrado de registros. Consultas de eliminación.
- Elimina los pedidos realizados en 2008

### Group by y having.
- Muestra el nombre de todos los agentes y lo que ha ganado por cada venta y cuanto ha ganado en total

### Outer joins. Combinaciones externas.
- Mostrar el nombre de todas las sucursales junto al número de agentes que posee

### Consultas con operadores de conjuntos.
- Muestra el nombre, numero de sucursal y telefono de los directores y agentes

### Subconsultas correlacionadas.
- Muestra los pedidos cuyo precio son mayores al precio promedio de los pedidos
