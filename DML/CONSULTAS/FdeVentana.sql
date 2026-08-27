-- =============================================
-- FUNCIONES DE VENTANA
-- =============================================


-- =============================================
-- SELECT PARA OBTENER EL TIPO DE CONTENIDO
-- =============================================

SELECT *
FROM contents AS c
INNER JOIN contents_types AS ct
    ON c.idContents_Types = ct.idContents_Types
LEFT JOIN views AS v
    ON v.idContents = c.idContents;


-- =============================================
-- RANKING DE CONTENIDOS POR TIPO
-- =============================================

SELECT
    ct.Name AS Tipo,
    COUNT(v.idViews) AS Cantidad_Vistas,
    RANK() OVER (
        PARTITION BY ct.Name
        ORDER BY COUNT(v.idViews) DESC
    ) AS Ranking
FROM contents AS c
INNER JOIN contents_types AS ct
    ON ct.idContents_Types = c.idContents_Types
LEFT JOIN views AS v
    ON v.idContents = c.idContents
GROUP BY
    ct.Name,
    c.idContents;


-- =============================================
-- ROW_NUMBER
-- =============================================

SELECT
    c.Title AS Titulo,
    ct.Name AS Tipo,
    COUNT(v.idViews) AS Cantidad_Vistas,
    ROW_NUMBER() OVER (
        PARTITION BY ct.Name
        ORDER BY COUNT(v.idViews) DESC
    ) AS Ranking
FROM contents AS c
INNER JOIN contents_types AS ct
    ON ct.idContents_Types = c.idContents_Types
LEFT JOIN views AS v
    ON v.idContents = c.idContents
GROUP BY
    c.Title,
    ct.Name;