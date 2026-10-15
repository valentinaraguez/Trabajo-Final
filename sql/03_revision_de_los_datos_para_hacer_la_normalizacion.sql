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

SELECT DISTINCT barrio, comuna
FROM temporal
WHERE barrio <> ''
ORDER BY barrio;

SELECT DISTINCT codigo_postal_argentino, codigo_postal
FROM temporal
WHERE codigo_postal_argentino <> ''
ORDER BY codigo_postal_argentino;

SELECT COUNT(*) AS registros_con_horario
FROM temporal
WHERE horario <> '';

SELECT COUNT(DISTINCT horario) AS horarios_diferentes
FROM temporal
WHERE horario <> '';