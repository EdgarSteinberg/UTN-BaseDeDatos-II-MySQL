-- =============================================
-- HAVING
-- FROM -> WHERE -> GROUP BY -> HAVING
-- =============================================

SELECT
    ct.Name AS Tipo_Contenido,
    COUNT(c.idContents) AS Cantidad,
    ROUND(AVG(c.Release_Year), 0) AS Ano_Promedio
FROM contents AS c
INNER JOIN contents_types AS ct
    ON c.idContents_Types = ct.idContents_Types
GROUP BY ct.Name
HAVING
    COUNT(c.idContents) >= 5
    AND ROUND(AVG(c.Release_Year), 0) >= 2020;





