USE oferta_gastronomica;

SELECT
COUNT(*) AS cantidad_de_registros,
COUNT(DISTINCT id) AS ids_diferentes
FROM temporal;

SELECT COUNT(DISTINCT categoria) AS categorias_diferentes
FROM temporal
WHERE categoria <> '';

SELECT COUNT(DISTINCT cocina) AS cocinas_diferentes
FROM temporal
WHERE cocina <> '';

SELECT COUNT(DISTINCT ambientacion) AS ambientaciones_diferentes
FROM temporal
WHERE ambientacion <> '';

SELECT COUNT(DISTINCT barrio) AS barrios_diferentes
FROM temporal
WHERE barrio <> '';

SELECT COUNT(DISTINCT comuna) AS comunas_diferentes
FROM temporal
WHERE comuna <> '';

SELECT COUNT(*) AS categorias_vacias
FROM temporal
WHERE categoria = '';

SELECT COUNT(*) AS cocinas_vacias
FROM temporal
WHERE cocina = '';

SELECT COUNT(*) AS ambientaciones_vacias
FROM temporal
WHERE ambientacion = '';

SELECT
barrio,
COUNT(DISTINCT comuna) AS cantidad_de_comunas
FROM temporal
WHERE barrio <> ''
GROUP BY barrio
ORDER BY cantidad_de_comunas DESC;

SELECT
codigo_postal_argentino,
COUNT(DISTINCT codigo_postal) AS cantidad_de_codigos_postales
FROM temporal
WHERE codigo_postal_argentino <> ''
GROUP BY codigo_postal_argentino
ORDER BY cantidad_de_codigos_postales DESC;

SELECT COUNT(*) AS registros_con_horario
FROM temporal
WHERE horario <> '';

SELECT COUNT(DISTINCT horario) AS horarios_diferentes
FROM temporal
WHERE horario <> '';