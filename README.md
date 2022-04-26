### Tabla Sucursales
| Sucursales            |                          |                           |
|-----------------------|--------------------------|---------------------------|
| **Num_Sucursal**      | Numérico, 1              | Clave Primaria            |                 
| Nombre                | Cadena de caracteres, 40 | No nulo y único           |
| Area                  | Cadena de caracteres, 35 | No nulo                   |
| Pais                  | Cadena de caracteres, 25 | No nulo                   |

### Tabla Agentes
| Agentes      |                          |                                    |
|--------------|--------------------------|------------------------------------|
| **Código**   | Cadena de caracteres, 6  | Clave Primaria                     |
| Nombre       | Cadena de caracteres, 40 | No nulo                            |
| Area_Trabajo | Cadena de caracteres, 35 | No nulo                            |
| Comision     | Decimal, 10,2            | No nulo y por defecto es '0.10'    |
| Teléfono     | Cadena de caracteres, 15 | No nulo y único                    |
| _Sucursal_   | Numérico, 1              | Clave Foranea                      |

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
