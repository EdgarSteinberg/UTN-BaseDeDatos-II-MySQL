-- =============================================
-- FUNCIONES DE FECHA
-- =============================================

-- Fecha y hora actual

SELECT NOW();


-- =============================================
-- YEAR - MONTH - DAY
-- Obtener partes de una fecha
-- =============================================

SELECT
    YEAR(NOW()) AS Anio,
    MONTH(NOW()) AS Mes,
    DAY(NOW()) AS Dia;


-- =============================================
-- DATEDIFF
-- Diferencia entre dos fechas
-- =============================================

SELECT
    DATEDIFF(m.Date_From, m.Date_To) AS Diferencia_Dias
FROM memberships AS m;