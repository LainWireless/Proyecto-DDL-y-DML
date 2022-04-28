-- CREACIÓN DE TABLAS

CREATE TABLE SUCURSALES
   (	
    	NUM_SUCURSAL INT(1), 
	NOMBRE VARCHAR(40) NOT NULL, 
	AREA VARCHAR(35) NOT NULL, 
	PAIS VARCHAR(25) NOT NULL,
	CONSTRAINT sucursales_pk PRIMARY KEY (NUM_SUCURSAL),
	CONSTRAINT sucursales_u UNIQUE (NOMBRE)
   );

CREATE TABLE DIRECTORES
   (	
    	CODIGO VARCHAR(6),
	SUCURSAL INT(1),
	NOMBRE VARCHAR(40) NOT NULL, 
	AREA_TRABAJO VARCHAR(35) NOT NULL, 
	SALARIO DECIMAL(10,2) NOT NULL DEFAULT '4500', 
	TELEFONO VARCHAR(15) NOT NULL, 
	PAIS VARCHAR(25),
	CONSTRAINT dic_pk PRIMARY KEY (CODIGO),
	CONSTRAINT dic_fk FOREIGN KEY (SUCURSAL) REFERENCES SUCURSALES(NUM_SUCURSAL),
	CONSTRAINT dic_u UNIQUE (TELEFONO),
	CONSTRAINT dic_u2 UNIQUE (SUCURSAL)
   );	

CREATE TABLE AGENTES
   (	
    	CODIGO VARCHAR(6),
	SUCURSAL INT(1),
	NOMBRE VARCHAR(40) NOT NULL, 
	AREA_TRABAJO VARCHAR(35) NOT NULL, 
	COMISION DECIMAL(10,2) NOT NULL DEFAULT '0.10', 
	TELEFONO VARCHAR(15) NOT NULL, 
	PAIS VARCHAR(25),
	CONSTRAINT agentes_pk PRIMARY KEY (CODIGO),
	CONSTRAINT agentes_fk FOREIGN KEY (SUCURSAL) REFERENCES SUCURSALES(NUM_SUCURSAL),
	CONSTRAINT agentes_u UNIQUE (TELEFONO)
   );

CREATE TABLE CLIENTES 
   (	CODIGO VARCHAR(6), 
	NOMBRE VARCHAR(40) NOT NULL, 
	CIUDAD VARCHAR(35), 
	AREA_TRABAJO VARCHAR(35) NOT NULL, 
	PAIS VARCHAR(20) NOT NULL, 
	NIVEL INT(1), 
	TELEFONO VARCHAR(17) NOT NULL, 
	CODIGO_AGENTE VARCHAR(6),
    	CONSTRAINT clientes_pk PRIMARY KEY (CODIGO),
    	CONSTRAINT clientes_fk FOREIGN KEY (CODIGO_AGENTE) REFERENCES AGENTES(CODIGO),
    	CONSTRAINT clientes_u UNIQUE (TELEFONO),
    	CONSTRAINT clientes_u2 UNIQUE (NOMBRE)
);

CREATE TABLE PEDIDOS
   (
        NUM_PEDIDO INT(6), 
	PRECIO_PEDIDO DECIMAL(12,2) NOT NULL, 
	SEÑAL DECIMAL(12,2) NOT NULL DEFAULT '0', 
	FECHA_PEDIDO DATE NOT NULL, 
	CODIGO_CLIENTE VARCHAR(6), 
	CODIGO_AGENTE VARCHAR(6), 
	DESCRIPCION_PEDIDO VARCHAR(60) NOT NULL,
	CONSTRAINT pedidos_pk PRIMARY KEY (NUM_PEDIDO),
	CONSTRAINT pedidos_fk1 FOREIGN KEY (CODIGO_CLIENTE) REFERENCES CLIENTES(CODIGO),
	CONSTRAINT pedidos_fk2 FOREIGN KEY (CODIGO_AGENTE) REFERENCES AGENTES(CODIGO),
	CONSTRAINT pedidos_c CHECK (fecha_pedido >= '2006-01-01')
   );


-- RESTRICCIONES

-- Desactiva temporalmente la restricción que afecta al año de la fecha del pedido
ALTER TABLE PEDIDOS DISABLE CONSTRAINT pedidos_c;

-- Elimina la restricción del valor por defecto que afecta a la señal del pedido
ALTER TABLE Pedidos ALTER COLUMN señal DROP DEFAULT;

-- Añade una nueva columna a la tabla Sucursales donde guardaremos la fecha en la cual se creó la sucursal
ALTER TABLE sucursales ADD COLUMN FUNDACION DATE;

-- Elimina la columna Codigo_Agente de la tabla Clientes
ALTER TABLE clientes DROP COLUMN CODIGO_AGENTE;

-- Añade una restricción sobre la columna de la fecha de creación de la sucursal, el año no puede ser inferior a 2006
ALTER TABLE sucursales ADD CONSTRAINT sucursales_c CHECK (to_char(FUNDACION,'YYYY')=>'06');

--Añade una columna llamada DNI a los directores, agentes y clientes
ALTER TABLE directores ADD COLUMN DNI VARCHAR(9);
ALTER TABLE agentes ADD COLUMN DNI VARCHAR(9);
ALTER TABLE clientes ADD COLUMN DNI VARCHAR(9);

-- Los DNI no se pueden repetir
ALTER TABLE directores ALTER COLUMN DNI ADD CONSTRAINT directores_u UNIQUE;
ALTER TABLE agentes ALTER COLUMN DNI ADD CONSTRAINT agentes_u UNIQUE;
ALTER TABLE clientes ALTER COLUMN DNI ADD CONSTRAINT clientes_u UNIQUE;

-- El DNI de los directores, agentes y clientes está compuesto por 8 números y termina por una letra mayúscula
ALTER TABLE directores ALTER COLUMN DNI ADD CONSTRAINT directores_dni_check CHECK (DNI=>'[0-9]{8}[A-Z]');
ALTER TABLE agentes ALTER COLUMN DNI ADD CONSTRAINT agentes_dni_check CHECK (DNI=>'[0-9]{8}[A-Z]');
ALTER TABLE clientes ALTER COLUMN DNI ADD CONSTRAINT clientes_dni_check CHECK (DNI=>'[0-9]{8}[A-Z]');

-- Activa nuevamente la restricción que desactivamos referente a la fecha del pedido
ALTER TABLE PEDIDOS ENABLE CONSTRAINT pedidos_c;

-- El código de los directores siempre comenzará por una D mayúscula
ALTER TABLE directores ALTER COLUMN codigo ADD CONSTRAINT directores_codigo_check CHECK (codigo=>'[D]{1}');

-- El código de los agentes siempre comenzará por una A mayúscula
ALTER TABLE agentes ALTER COLUMN codigo ADD CONSTRAINT agentes_codigo_check CHECK (codigo=>'[A]{1}');

-- El código de los clientes siempre comenzará por una C mayúscula
ALTER TABLE clientes ALTER COLUMN codigo ADD CONSTRAINT clientes_codigo_check CHECK (codigo=>'[C]{1}');
