-- Consulta básica 

SELECT * FROM contents;
SELECT * FROM clients;
SELECT * FROM views;
SELECT * FROM contents_types;
SELECT * FROM categories;

-- Consulta columnas específicas

SELECT Title, Release_Year FROM contents;
SELECT Email FROM clients;


-- ==========================================
-- CONSULTAS BÁSICAS (SELECT)
-- ==========================================


SELECT * FROM contents;

SELECT
	* 
FROM 
	contents c 
WHERE 
	c.Release_Year > 2000;


-- ==========================================
-- JOIN CLÁSICO (Sintaxis antigua)
-- ========================================== 


SELECT
	* 
FROM 
	contents c , contents_types ct
WHERE 
	c.Release_Year > 2000
and
    c.idContents_Types = ct.idContents_Types
;

-- union de dos tablas con el where
SELECT
	ct.Name content_type,
    c.Title , 
    c.Release_Year
FROM 
	contents c , contents_types ct
WHERE 
	c.Release_Year > 2000
and
    c.idContents_Types = ct.idContents_Types
;


-- ==========================================
-- INNER JOIN
-- ==========================================


SELECT
	ct.Name content_type,
    c.Title,
    c.Release_Year
FROM
	contents c
INNER JOIN
	contents_types ct
ON
	c.idContents_Types = ct.idContents_Types
WHERE
	c.Release_Year > 2000
;

-- ==========================================
-- INNER JOIN ENTRE TRES TABLAS
-- ==========================================


SELECT
	ct.Name content_type,
    c.Title,
    c.Release_Year,
    cat.Name  categories
FROM
	contents c
INNER JOIN
	contents_types ct
ON
	c.idContents_Types = ct.idContents_Types
INNER JOIN
	categories cat
ON
	c.idCategories = cat.idCategories
WHERE
	c.Release_Year > 2000
ORDER BY
	c.Release_Year DESC
;

-- ==========================================
-- AGRUPAMIENTO (GROUP BY + HAVING)
-- ==========================================

SELECT
    COUNT(c.idContents) AS cantidad,
    c.Release_Year
FROM 
    contents c
WHERE 
    c.Release_Year > 2000
GROUP BY
     c.Release_Year
HAVING 
    COUNT(c.idContents) > 1
ORDER BY 
    c.Release_Year ASC;