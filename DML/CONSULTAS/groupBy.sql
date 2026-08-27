-- =============================================
-- GROUP BY
-- =============================================

SELECT
    c.Title,
    MIN(c.Release_Year) AS Mas_Vieja
FROM contents AS c
GROUP BY c.Title;


-- =============================================
-- CANTIDAD DE VISTAS POR CONTENIDO
-- =============================================

SELECT
    c.Title,
    COUNT(v.idViews) AS Cant_Vistas
FROM contents AS c
LEFT JOIN views AS v
    ON c.idContents = v.idContents
GROUP BY c.Title;


-- =============================================
-- PROMEDIO DE RATING + REDONDEO
-- =============================================

SELECT
    c.Title,
    COUNT(v.idViews) AS Cant_Vistas,
    ROUND(AVG(v.Rating), 1) AS Rating
FROM contents AS c
LEFT JOIN views AS v
    ON c.idContents = v.idContents
GROUP BY c.Title;


-- =============================================
-- MAX - MIN RATING + CANTIDAD DE VISTAS
-- =============================================

SELECT
    c.Title,
    COUNT(v.idViews) AS Cant_Vistas,
    ROUND(AVG(v.Rating), 1) AS Rating,
    MIN(v.Rating) AS Rating_Minimo,
    MAX(v.Rating) AS Rating_Maximo
FROM contents AS c
LEFT JOIN views AS v
    ON c.idContents = v.idContents
GROUP BY c.Title;


-- =============================================
-- INNER JOIN
-- =============================================

SELECT *
FROM contents AS c
INNER JOIN contents_types AS ct
    ON c.idContents_Types = ct.idContents_Types;


-- =============================================
-- CANTIDAD DE CONTENIDOS POR TIPO
-- =============================================

SELECT
    ct.Name AS Tipo_Contenido,
    COUNT(c.idContents) AS Cantidad
FROM contents AS c
INNER JOIN contents_types AS ct
    ON c.idContents_Types = ct.idContents_Types
GROUP BY ct.Name;


-- =============================================
-- CANTIDAD DE CONTENIDOS POR CATEGORIA
-- =============================================

SELECT
    c2.Name AS Categoria,
    COUNT(c.idContents) AS Cantidad
FROM contents AS c
INNER JOIN categories AS c2
    ON c.idCategories = c2.idCategories
GROUP BY c2.Name;