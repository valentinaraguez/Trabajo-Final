CREATE DATABASE oferta_gastronomica
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE oferta_gastronomica;

CREATE TABLE temporal (
    longitud TEXT,
    latitud TEXT,
    id TEXT,
    nombre TEXT,
    categoria TEXT,
    cocina TEXT,
    ambientacion TEXT,
    telefono TEXT,
    mail TEXT,
    horario TEXT,
    calle_nombre TEXT,
    calle_altura TEXT,
    calle_cruce TEXT,
    direccion_completa TEXT,
    barrio TEXT,
    comuna TEXT,
    codigo_postal TEXT,
    codigo_postal_argentino TEXT
);