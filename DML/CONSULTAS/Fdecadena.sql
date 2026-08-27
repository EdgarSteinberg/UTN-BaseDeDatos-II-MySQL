-- =============================================
-- FUNCIONES DE CADENA (STRING)
-- =============================================

-- Mostrar títulos

SELECT Title
FROM contents;


-- =============================================
-- UPPER
-- Convierte el texto a mayúsculas
-- =============================================

SELECT
    UPPER(Title) AS Titulo_Mayuscula
FROM contents
WHERE UPPER(Title) LIKE UPPER('%Inter%');