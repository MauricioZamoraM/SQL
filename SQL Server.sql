                                           SQL SERVER

Sintaxis básica 

/*Crear bd*/
CREATE DATABASE bd1;
/*Crear tabla bd*/
CREATE TABLE usuarios(
id int identity(100,2), /*El campo identity es el valor auto-incrementable no se repite y no se debe ingresar, generalmente es la llave primaria, podemos indicarle en inicio y el incremento que queramos*/
nombre varchar(30),
clave varchar(10),
primary key(id)
);
/*Ver la estructura de una tabla*/
exec sp_columns usuarios;
/*Eliminar una tabla con condicional IF*/
if OBJECT_ID('usuarios') is not null
DROP TABLE usuarios;
/*Eliminar todos los registros de una tabla*/
DELETE FROM usuarios; /*Elimina todos los registros pero no reinicia el campo identity, cuando se agregen nuevos registros continua la secuencia por donde quedo anteriormente*/
TRUNCATE TABLE usuarios /*Elimina todos los registros y reinicia el campo identity, tambien se ejecuta mas rapido*/
/*Insertar registros en una tabla*/
INSERT INTO usuarios(nombre,clave) values ('Mariano', '123'),('Ana', '321');
/*Consultar todos los registros de la tabla*/
SELECT * FROM usuarios;
/*Actualizar registros de la tabla*/
UPDATE usuarios SET nombre = 'Mauricio' WHERE clave = '123';

-- TIPOS DE DATOS
-- Enteros:
INT - Número entero de 4 bytes.
BIGINT - Número entero de 8 bytes.
SMALLINT - Número entero de 2 bytes.
TINYINT - Número entero de 1 byte.

-- Decimales y números de punto flotante:
DECIMAL(p, s) - Número decimal exacto con una precisión p y una escala s.
NUMERIC(p, s) - Número decimal exacto con una precisión p y una escala s.
FLOAT(n) - Número de punto flotante con una precisión de hasta n bits.

-- Cadenas de caracteres:
VARCHAR(n) - Cadena de caracteres de longitud variable con una longitud máxima de n caracteres.
CHAR(n) - Cadena de caracteres de longitud fija con una longitud exacta de n caracteres.
NVARCHAR(n) - Cadena de caracteres Unicode de longitud variable con una longitud máxima de n caracteres.
NCHAR(n) - Cadena de caracteres Unicode de longitud fija con una longitud exacta de n caracteres.
TEXT - Cadena de caracteres de longitud variable de gran tamaño.

Fechas y horas:
DATE - Representa una fecha.
TIME - Representa una hora del día.
DATETIME - Representa una fecha y una hora.
SMALLDATETIME - Representa una fecha y una hora con menor precisión que DATETIME.
DATETIME2 - Representa una fecha y una hora con una mayor precisión.

Otros tipos de datos:
BIT - Valor booleano (0 o 1).
BINARY(n) - Datos binarios de longitud fija con una longitud exacta de n bytes.
VARBINARY(n) - Datos binarios de longitud variable con una longitud máxima de n bytes.
IMAGE - Datos binarios de gran tamaño.

-- FUNCIONES PARA EL MANEJO DE CADENAS
1) LEN(): Devuelve la longitud de una cadena.

SELECT LEN('Hola mundo') AS Longitud;
Resultado: 10

2) LEFT(): Devuelve los primeros caracteres de una cadena según una longitud especificada.
SELECT LEFT('Hola mundo', 4) AS Subcadena;
Resultado: Hola

3) RIGHT(): Devuelve los últimos caracteres de una cadena según una longitud especificada.
SELECT RIGHT('Hola mundo', 5) AS Subcadena;
Resultado: mundo

4) SUBSTRING(): Devuelve una parte de una cadena especificando el inicio y la longitud.
SELECT SUBSTRING('Hola mundo', 6, 5) AS Subcadena;
Resultado: mundo

5) UPPER(): Convierte una cadena a mayúsculas.
SELECT UPPER('Hola mundo') AS CadenaMayusculas;
Resultado: HOLA MUNDO

6) LOWER(): Convierte una cadena a minúsculas.
SELECT LOWER('Hola mundo') AS CadenaMinusculas;
Resultado: hola mundo

7) REPLACE(): Reemplaza una subcadena dentro de una cadena por otra subcadena.
SELECT REPLACE('Hola mundo', 'mundo', 'amigo') AS CadenaReemplazada;
Resultado: Hola amigo

8) CONCAT(): Concatena dos o más cadenas en una sola cadena.
SELECT CONCAT('Hola', ' ', 'mundo') AS CadenaConcatenada;
Resultado: Hola mundo

10) CHARINDEX(): Devuelve la posición de una subcadena dentro de una cadena.
SELECT CHARINDEX('mundo', 'Hola mundo') AS Posicion;
Resultado: 6

11) LTRIM(): Elimina los espacios en blanco iniciales de una cadena.
SELECT LTRIM('    Hola mundo') AS CadenaSinEspaciosIniciales;
Resultado: Hola mundo
*/
-- FUNCIONES MATEMATICAS
1) ABS(): Devuelve el valor absoluto de un número.
SELECT ABS(-5) AS ValorAbsoluto;
Resultado: 5

2) CEILING(): Redondea un número hacia arriba al entero más cercano.
SELECT CEILING(3.4) AS RedondeoHaciaArriba;
Resultado: 4

3) FLOOR(): Redondea un número hacia abajo al entero más cercano.
SELECT FLOOR(3.9) AS RedondeoHaciaAbajo;
Resultado: 3

4) ROUND(): Redondea un número al número especificado de decimales.
SELECT ROUND(3.14159, 2) AS Redondeo;
Resultado: 3.14

5) SQRT(): Devuelve la raíz cuadrada de un número.
SELECT SQRT(25) AS RaizCuadrada;
Resultado: 5

6) POWER(): Calcula el valor de un número elevado a una potencia específica.
SELECT POWER(2, 3) AS Potencia;
Resultado: 8

7) LOG(): Calcula el logaritmo natural de un número.
SELECT LOG(10) AS Logaritmo;
Resultado: 2.30258509299405

8) SIN(), COS(), TAN(): Calculan el seno, coseno y tangente de un ángulo en radianes.
SELECT SIN(0), COS(0), TAN(0);
Resultado: 0, 1, 0

9) RAND(): Genera un número decimal aleatorio entre 0 y 1.
SELECT RAND() AS NumeroAleatorio;
Resultado: 0.123456789

10) PI(): Devuelve el valor de PI (π).
SELECT PI() AS ValorPi;
Resultado: 3.14159265358979
*/

-- FUNCIONES DE FECHA Y HORA
1) GETDATE(): Devuelve la fecha y hora actuales.
SELECT GETDATE() AS FechaHoraActual;
Resultado: 2023-05-21 10:30:45.123

2) DATEPART(): Extrae una parte específica de una fecha o hora.
SELECT DATEPART(YEAR, GETDATE()) AS Año;
Resultado: 2023
SELECT DATEPART(MONTH, GETDATE()) AS Mes;
Resultado: 5
SELECT DATEPART(DAY, GETDATE()) AS Día;
Resultado: 21

3) YEAR(), MONTH(), DAY(): Devuelven el año, mes y día de una fecha.
SELECT YEAR('2023-05-21') AS Año;
Resultado: 2023
SELECT MONTH('2023-05-21') AS Mes;
Resultado: 5
SELECT DAY('2023-05-21') AS Día;
Resultado: 21

4) DATEADD(): Agrega o resta una cantidad específica de tiempo a una fecha.
SELECT DATEADD(YEAR, 1, GETDATE()) AS FechaEnUnAño;
Resultado: 2024-05-21 10:30:45.123
SELECT DATEADD(MONTH, -3, GETDATE()) AS FechaHaceTresMeses;
Resultado: 2023-02-21 10:30:45.123

5) DATEDIFF(): Calcula la diferencia entre dos fechas en una unidad específica (años, meses, días, etc.).
SELECT DATEDIFF(YEAR, '2000-01-01', '2023-05-21') AS DiferenciaEnAños;
Resultado: 23
SELECT DATEDIFF(DAY, '2023-01-01', '2023-05-21') AS DiferenciaEnDías;
Resultado: 140

6) GETUTCDATE(): Devuelve la fecha y hora actuales en formato UTC (Tiempo Universal Coordinado).
SELECT GETUTCDATE() AS FechaHoraActualUTC;
Resultado: 2023-05-21 14:30:45.123

7) CONVERT(): Convierte una fecha o hora a un formato específico.
SELECT CONVERT(VARCHAR(10), GETDATE(), 103) AS FechaFormatoDDMMYYYY;
Resultado: 21/05/2023
SELECT CONVERT(VARCHAR(8), GETDATE(), 108) AS HoraFormatoHHMMSS;
Resultado: 10:30:45


-- OPERADORES LOGICOS
1) AND: Devuelve true si ambas condiciones son verdaderas.
SELECT * FROM tabla WHERE condicion1 AND condicion2;

2) OR: Devuelve true si al menos una de las condiciones es verdadera.
SELECT * FROM tabla WHERE condicion1 OR condicion2;

3) NOT: Invierte el valor de la condición. Si la condición es verdadera, NOT la convierte en falsa y viceversa.
SELECT * FROM tabla WHERE NOT condicion;

4) IN: Verifica si un valor está presente en un conjunto de valores.
SELECT * FROM tabla WHERE columna IN (valor1, valor2, valor3);

5) NOT IN: Verifica si un valor no está presente en un conjunto de valores.
SELECT * FROM tabla WHERE columna NOT IN (valor1, valor2, valor3);

6) BETWEEN: Verifica si un valor se encuentra dentro de un rango especificado (inclusive).
SELECT * FROM tabla WHERE columna BETWEEN valor1 AND valor2;

7) NOT BETWEEN: Verifica si un valor no se encuentra dentro de un rango especificado.
SELECT * FROM tabla WHERE columna NOT BETWEEN valor1 AND valor2;

8) EXISTS: Verifica si existe al menos una fila que cumpla una condición en una subconsulta.
SELECT columna FROM tabla1 WHERE EXISTS (SELECT * FROM tabla2 WHERE condicion);

9) LIKE: Realiza una comparación de patrones utilizando caracteres comodín (% para representar cero o más caracteres y _ para representar un solo carácter).
SELECT * FROM tabla WHERE columna LIKE 'valor%';

10) IS NULL: Verifica si un valor es nulo.
SELECT * FROM tabla WHERE columna IS NULL;
*/

--  FUNCIONES PARA CONTAR REGISTROS

1) COUNT(): Cuenta el número de filas que cumplen una condición especificada.
SELECT COUNT(*) AS TotalFilas FROM tabla;

2) COUNT(DISTINCT): Cuenta el número de valores únicos que cumplen una condición especificada.
SELECT COUNT(DISTINCT columna) AS TotalValoresUnicos FROM tabla;

3) SUM(): Calcula la suma de los valores en una columna.
SELECT SUM(columna) AS SumaTotal FROM tabla;

4) AVG(): Calcula el promedio de los valores en una columna.
SELECT AVG(columna) AS Promedio FROM tabla;

5) MIN(): Devuelve el valor mínimo en una columna.
SELECT MIN(columna) AS ValorMinimo FROM tabla;

6) MAX(): Devuelve el valor máximo en una columna.
SELECT MAX(columna) AS ValorMaximo FROM tabla;

7) GROUP BY con COUNT(): Cuenta el número de filas por cada grupo definido en una columna.
SELECT columna, COUNT(*) AS TotalPorGrupo FROM tabla GROUP BY columna;

8) HAVING con COUNT(): Filtra los grupos que cumplen una condición específica sobre la cuenta de filas.
SELECT columna, COUNT(*) AS TotalPorGrupo FROM tabla GROUP BY columna HAVING COUNT(*) > 5;
*/

-- PRINCIPALES CLÁUSULAS

1) JOIN: Combina columnas de dos o más tablas basándose en una relación especificada entre ellas.
SELECT t1.columna, t2.columna
FROM tabla1 t1
JOIN tabla2 t2 ON t1.id = t2.id;

2) INNER JOIN: Devuelve solo los registros que tienen coincidencias en ambas tablas.
SELECT columna
FROM tabla1
INNER JOIN tabla2 ON tabla1.id = tabla2.id;


3) LEFT JOIN (o LEFT OUTER JOIN): Devuelve todos los registros de la tabla izquierda y los registros coincidentes de la tabla derecha.
SELECT columna
FROM tabla1
LEFT JOIN tabla2 ON tabla1.id = tabla2.id;

4) RIGHT JOIN (o RIGHT OUTER JOIN): Devuelve todos los registros de la tabla derecha y los registros coincidentes de la tabla izquierda.
SELECT columna
FROM tabla1
RIGHT JOIN tabla2 ON tabla1.id = tabla2.id;

5) FULL JOIN (o FULL OUTER JOIN): Devuelve todos los registros de ambas tablas, incluidos los registros que no tienen coincidencias.
SELECT columna
FROM tabla1
FULL JOIN tabla2 ON tabla1.id = tabla2.id;

6) UNION: Combina los resultados de dos o más consultas en un único conjunto de resultados.
SELECT columna
FROM tabla1
UNION
SELECT columna
FROM tabla2;

7) TOP: Limita el número de filas devueltas en un resultado de consulta.
SELECT TOP 5 columna
FROM tabla;

8) DISTINCT: Devuelve los valores únicos en una columna o conjunto de columnas.
SELECT DISTINCT columna
FROM tabla;

9) BETWEEN: Se utiliza para especificar un rango de valores en una condición.
SELECT columna
FROM tabla
WHERE columna BETWEEN valor1 AND valor2;

10) LIKE: Permite realizar comparaciones de patrones utilizando caracteres comodín (% y _).
SELECT columna
FROM tabla
WHERE columna LIKE 'valor%';

11) EXISTS: Verifica la existencia de registros en una subconsulta.
SELECT columna1
FROM tabla1
WHERE EXISTS (SELECT columna2 FROM tabla2 WHERE condicion);
*/

-- RESTRICCIONES 

1) Primary Key (Clave primaria):
Restringe los valores de una o varias columnas a valores únicos y no nulos.
CREATE TABLE Ejemplo (
  id INT PRIMARY KEY,
  nombre VARCHAR(50)
);

2) Foreign Key (Clave foránea):
Establece una relación entre tablas y garantiza la integridad referencial.
CREATE TABLE Pedido (
  id INT PRIMARY KEY,
  cliente_id INT,
  Restricción de clave foránea
  FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

3) Unique (Único):

Garantiza que los valores en una columna o conjunto de columnas sean únicos.
CREATE TABLE Producto (
  id INT PRIMARY KEY,
  codigo VARCHAR(10) UNIQUE,
  nombre VARCHAR(50)
);

4) Check (Verificación):
Permite especificar una condición o expresión lógica que los valores de una columna deben cumplir.
CREATE TABLE Empleado (
  id INT PRIMARY KEY,
  edad INT,
  Restricción de verificación
  CONSTRAINT CHK_Edad CHECK (edad >= 18)
);

5) Default (Predeterminado):

Establece un valor predeterminado para una columna cuando no se proporciona un valor explícito durante la inserción.
CREATE TABLE Registro (
  id INT PRIMARY KEY,
  fecha_registro DATE DEFAULT GETDATE(),
  descripcion VARCHAR(100)
);

6) Not Null (No nulo):
Garantiza que una columna no acepte valores nulos.
CREATE TABLE Cliente (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  correo VARCHAR(100)
);
*/
Reglas
En SQL Server, las reglas son objetos que se utilizan para establecer restricciones en los valores que se pueden insertar, actualizar o eliminar en una columna de una tabla. Las reglas ayudan a mantener la integridad de los datos y aseguran que los valores cumplan ciertas condiciones.
A continuación, te proporcionaré un ejemplo sencillo y detallado de cómo crear una regla en SQL Server:
Supongamos que tenemos una tabla llamada "Empleados" con las siguientes columnas:
ID (int): identificador único del empleado.
Nombre (varchar): nombre del empleado.
Edad (int): edad del empleado.
Deseamos crear una regla que restrinja la edad de los empleados para que solo se puedan ingresar valores entre 18 y 60 años.
Paso 1: Crear la tabla "Empleados" si aún no existe.
CREATE TABLE Empleados (
    ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Edad INT
);
Paso 2: Crear la regla.
CREATE RULE Regla_Edad
AS
    @Edad >= 18 AND @Edad <= 60;
En este caso, hemos creado una regla llamada "Regla_Edad" que se aplicará a la columna "Edad". La regla establece que el valor de "Edad" debe ser mayor o igual a 18 y menor o igual a 60.
Paso 3: Asociar la regla a la columna de la tabla.
sp_bindrule 'Regla_Edad', 'Empleados.Edad';
Mediante el procedimiento almacenado sp_bindrule, asociamos la regla "Regla_Edad" a la columna "Edad" de la tabla "Empleados".
Ahora, cada vez que intentemos insertar, actualizar o eliminar un registro en la tabla "Empleados", la regla "Regla_Edad" se verificará automáticamente y restringirá los valores que no cumplan con la condición especificada.
Por ejemplo, si intentamos insertar un empleado con una edad fuera del rango permitido:
INSERT INTO Empleados (ID, Nombre, Edad)
VALUES (1, 'John Doe', 65);
Se producirá un error y la operación no se llevará a cabo debido a que la regla no permite valores de edad mayores a 60.
Recuerda que las reglas en SQL Server han sido declaradas como obsoletas a partir de la versión SQL Server 2005, y se recomienda utilizar restricciones CHECK en su lugar. Sin embargo, todavía se pueden usar en versiones posteriores por razones de compatibilidad con versiones anteriores.
