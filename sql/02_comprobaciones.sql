USE oferta_gastronomica;

SELECT COUNT(*)
FROM temporal;

SELECT
    COUNT(*) AS cantidad_de_registros,
    COUNT(DISTINCT id) AS ids_diferentes
FROM temporal;