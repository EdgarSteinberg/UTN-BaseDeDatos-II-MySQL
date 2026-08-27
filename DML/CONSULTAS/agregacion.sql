-- =============================================
-- COUNT
-- =============================================

SELECT COUNT(c.idContents)
FROM contents AS c;

SELECT COUNT(c.Title)
FROM contents AS c;


-- =============================================
-- SUM
-- =============================================

SELECT SUM(m.Value) AS Total
FROM memberships AS m;


-- =============================================
-- AVG - PROMEDIO
-- =============================================

SELECT AVG(m.Value) AS Promedio
FROM memberships AS m;


-- =============================================
-- MIN - MAX
-- =============================================

SELECT MIN(c.Release_Year) AS Mas_Viejos
FROM contents AS c;

SELECT MAX(c.Release_Year) AS Mas_Nueva
FROM contents AS c;