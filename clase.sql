USE pretifly;

SELECT *
FROM contents_types
WHERE Name = 'Short';

SELECT * FROM contents_types;
SELECT * FROM categories;
SELECT * FROM contents;
SELECT * FROM clients;
SELECT * FROM countries;
SELECT * FROM memberships;
SELECT * FROM languages;
SELECT * FROM views;

-- Count
SELECT COUNT(c.idContents)
FROM contents as c;

SELECT COUNT(c.Title)
FROM contents as c;

-- Sum
SELECT SUM(m.Value) Total
FROM memberships m;

-- Avg (Promedio)
SELECT AVG(m.Value) Promedio
FROM memberships m;

-- Max - Min
SELECT MIN(c.Release_Year) mas_Viejos
FROM contents  c;

SELECT MAX(c.Release_Year) mas_nueva
FROM contents  c;

-- Criterio de agrupamiento GROUP BY
SELECT 
	c.title,
	MIN(c.Release_Year) mas_vieja
FROM contents c
GROUP BY c.title;


SELECT
	c.Title,
	COUNT(v.idViews) as cant_vistas
FROM contents c
LEFT JOIN views v
ON c.idContents = v.idContents
GROUP BY c.Title;

-- cantidad de vistas 
-- Promedio de Rating + Redondeo Raund() se le agrega el decimal
SELECT
	c.Title,
	COUNT(v.idViews) as cant_vistas,
    ROUND(AVG(v.Rating), 1) as rating
FROM contents c
LEFT JOIN views v
ON c.idContents = v.idContents
GROUP BY c.Title;

-- Max y Min Rating , cantidad de vistas
-- Promedio de Rating + Redondeo Raund() se le agrega el decimal
SELECT
	c.Title,
	COUNT(v.idViews) as Cant_vistas,
    ROUND(AVG(v.Rating), 1) as Rating,
    MIN(v.Rating) as Rating_minimo,
    MAX(v.Rating) as Rating_maximo
FROM contents c
LEFT JOIN views v
ON c.idContents = v.idContents
GROUP BY c.Title;

-- ejemplo 2
SELECT * 
FROM contents c
INNER JOIN
	contents_types ct
ON c.idContents_Types = ct.idContents_Types;

-- Contar cantidad de contenidos agrupados por tipo de contenido
SELECT 
	ct.Name as Name,
	COUNT(c.idContents) cantidad
FROM contents c
INNER JOIN
	contents_types ct
ON c.idContents_Types = ct.idContents_Types
GROUP BY
	ct.Name;
    
-- Cantidad de contenidos agrupado por tipo de contenidos
SELECT 
	c2.Name,
	COUNT(c.idContents)
FROM contents c
INNER JOIN
	categories c2
ON c.idCategories = c2.idCategories
GROUP BY 
	c2.Name;


-- FROM -> WHERE -> GROUP BY -> HAVING

-- HAVING para filtrar funciones de agregado
SELECT
    ct.Name AS Tipo_Contenido,
    COUNT(c.idContents) AS Cantidad,
    ROUND(AVG(c.Release_Year), 0) AS Ano_promedio -- sin decimales
FROM
    contents c
INNER JOIN
    contents_types ct
    ON c.idContents_Types = ct.idContents_Types
GROUP BY
    ct.Name
HAVING
    COUNT(c.idContents) >= 5 AND  ROUND(AVG(c.Release_Year), 0) >= 2020;