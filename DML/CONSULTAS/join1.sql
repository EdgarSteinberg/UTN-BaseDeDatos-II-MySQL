-- INNER JOIN no significa simplemente "sin NULL". Significa "solo coincidencias entre ambas tablas".
 
 
-- Mostrar todos los contenidos junto con el nombre de su categoría.
SELECT
	c.Title as Titulo_Pelicula,
    ca.Name as Categoria_Pelicula
FROM
	contents c
iNNER JOIN
	categories ca
ON
	c.idCategories = ca.idCategories;
    
-- Mostrar todos los contenidos junto con:
SELECT
	c.Title as Titulo_pelicula,
    ct.Name as Tipo_pelicula
FROM
	contents c
INNER JOIN 
	contents_types ct
ON 
	 c.idContents_Types = ct.idContents_Types;
     
-- Mostrar todos los contenidos junto con:
-- Title → Titulo
-- languages.Name → Idioma
-- categories.Name → Categoria

SELECT
	c.Title as Titulo_pelicula,
    l.Name as Language_pelicula,
    ca.Name as Categoria_pelicula
FROM
	contents c
INNER JOIN
	languages l
ON
	c.idLanguages = l.idLanguages
INNER JOIN
	categories ca
ON
	c.idCategories = ca.idCategories
;

-- Mostrar todos los clientes junto con el nombre del país al que pertenecen.
-- clients.Name → Cliente
-- countries.Name → Pais

SELECT
	cl.Name as nombre_cliente,
    c.Name as pais
FROM
	clients cl
INNER JOIN
	countries c
ON
	cl.idCountries = c.idCountries;
    
-- Mostrar todas las membresías junto con el nombre del cliente que la posee.
-- memberships.Description → Membresia
-- clients.Name → Cliente
-- memberships.Value → Valor

SELECT 
	m.Description as Descricion_Membresia,
    c.Name as Nombre_cliente,
    m.Value as Valor_Membresia
FROM
	memberships m
INNER JOIN
	clients c
ON
	m.idClients = c.idClients;
    
-- Queremos saber qué cliente vio qué contenido.
-- nombre del cliente → Cliente
-- título del contenido → Contenido
-- fecha de visualización → Fecha
-- Tenés que descubrir cómo llegar desde clients hasta contents.

SELECT
    c.Name AS nombre_cliente,
    ct.Title AS nombre_pelicula,
    v.View_Date AS Fecha
FROM 
	clients c
INNER JOIN 
	views v
ON 
	c.idClients = v.idClients
INNER JOIN 
	contents ct
ON 
    v.idContents = ct.idContents;
    
-- ¿Qué cliente vio qué película y de qué categoría era?
-- Cliente
-- Contenido
-- Categoria

SELECT 
	cl.Name as cliente,
    c.Title as Titulo,
    ct.Name as categories
FROM 
	views v
INNER JOIN
	clients cl
ON
	v.idClients = cl.idClients
INNER JOIN
	contents c
ON
	v.idContents = c.idContents
INNER JOIN
	categories ct
ON
	c.idCategories = ct.idCategories;
    
SELECT * FROM clients;
SELECT * FROM languages;
SELECT * FROM contents;
SELECT * FROM views;
-- Cliente → Contenido → Categoría → Idioma
-- Cliente
-- Contenido
-- Categoria
-- Idioma

SELECT 
	cl.Name as nombre_cliente,
    c.Title as titulo,
    ca.Name as categoria,
    l.Name as lenguage
FROM
	contents c
INNER JOIN
	categories ca
ON
	c.idCategories = ca.idCategories
INNER JOIN
	languages l
ON
	c.idLanguages = l.idLanguages
INNER JOIN
	views v
ON
	v.idContents = c.idContents
INNER JOIN
	clients cl
ON
	v.idClients = cl.idClients;
