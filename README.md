# \# Trabajo Final

# 

# Base de Datos II – Gestión de Proyectos de Software

# 

# Este repositorio lo usamos para nuestro trabajo final de Bases de Datos II.

# 

# Integrantes:

# 

# Martín Ortiz

# Valentín Aragüez

# 

# Para hacer el trabajo, elegimos un archivo CSV con información sobre establecimientos gastronómicos de la Ciudad de Buenos Aires.

# 

# El archivo tenía datos como el nombre del local, categoría, tipo de cocina, ambientación, dirección, barrio, comuna, código postal, teléfono, mail y horarios.

# 

# La idea del trabajo fue a partir de esos datos, revisarlos, importarlos a MariaDB y después ir organizándolos para crear una base de datos normalizada en la medida de lo posible.

# 

# \## Forma de trabajo

# 

# Durante el proyecto fuimos guardando el resultado final de cada cosa, sino también documentamos los pasos que seguimos.

# 

# En `proceso.md` dejamos escrito qué hicimos, los problemas que fueron apareciendo, las consultas que usamos y las decisiones que fuimos tomando.

# 

# También guardamos los archivos SQL para no tener las consultas solamente escritas dentro de la documentación.

# 

# \## Organización del repositorio

# 

# | Archivo o carpeta | Para qué sirve                                                                                                                                                                                                    |

# | ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

# | `datos/`          | Acá guardamos el archivo CSV con el que trabajamos.                                                                                                                                                               |

# | `sql/`            | Acá guardamos las consultas y sentencias SQL que fuimos usando durante el trabajo. Por ejemplo, tenemos archivos para crear la base y la tabla temporal y para hacer las primeras comprobaciones sobre los datos. |

# | `diagrama/`       | Acá guardamos el trabajo relacionado con el diagrama de la base de datos.                                                                                                                                         |

# | `proceso.md`      | Acá está documentado paso por paso cómo fuimos haciendo el trabajo.                                                                                                                                               |

# | `compose.yaml`    | Acá dejamos guardada la configuración de MariaDB que usamos con Docker Compose.                                                                                                                                   |

# | `.env.example`    | Este archivo muestra la variable que hay que configurar para la contraseña de MariaDB, pero sin guardar una contraseña real dentro del repositorio.                                                               |

# 

# \## Cómo usar el proyecto

# 

# Para usar el proyecto por primera vez hay que tener instalado Git y Docker y tener Docker funcionando.

# 

# Primero hay que descargar el repositorio:

# 

# ```powershell

# git clone https://github.com/valentinaraguez/Trabajo-Final.git

# ```

# 

# Después hay que entrar a la carpeta:

# 

# ```powershell

# cd Trabajo-Final

# ```

# 

# Dentro del proyecto está el archivo:

# 

# ```text

# .env.example

# ```

# 

# Ese archivo sirve como ejemplo.

# 

# Hay que crear otro archivo llamado:

# 

# ```text

# .env

# ```

# 

# y adentro escribir:

# 

# ```text

# MARIADB\_ROOT\_PASSWORD=contraseña

# ```

# 

# En lugar de `contraseña` se puede poner la contraseña que se quiera usar para MariaDB.

# 

# El archivo `.env` queda solamente en la computadora y no se sube al repositorio.

# 

# Después hay que crear el volumen que usa MariaDB:

# 

# ```powershell

# docker volume create mariadb\_establecimientos\_data

# ```

# 

# Eso solamente hace falta la primera vez.

# 

# Después hay que levantar MariaDB con:

# 

# ```powershell

# docker compose up -d

# ```

# 

# Para comprobar que el contenedor quedó funcionando se puede usar:

# 

# ```powershell

# docker compose ps

# ```

# 

# Para entrar a MariaDB hay que usar:

# 

# ```powershell

# docker compose exec mariadb mariadb -uroot -p

# ```

# 

# MariaDB va a pedir la contraseña que se puso antes en el archivo `.env`.

# 

# Los archivos SQL para crear la base, preparar la tabla temporal y hacer las comprobaciones están dentro de la carpeta:

# 

# ```text

# sql

# ```

# 

# El archivo CSV está dentro de:

# 

# ```text

# datos

# ```

# 

# La base no se carga automáticamente solamente con levantar Docker.

# 

# En `proceso.md` está explicado paso por paso cómo crear la base, cómo importar el CSV y cómo ejecutar las consultas.

# En el caso de HeidiSQL, con uso de XAMPP es similar. Explicado en procesoHX

# 

# De esa forma, cualquier persona puede preparar MariaDB y después seguir los pasos de `proceso.md` para trabajar con los mismos datos que nosotros.

# 

# \## Diagrama

# 

# Este es el diagrama de la bases de datos final.

# 

# <img width="1480" height="1004" alt="diagrama full" src="https://github.com/user-attachments/assets/5c4eed6e-04c9-4551-8cde-9629e1f249f0" />

#

# Hicimos varios cambios basados en el diagrama basado a problemas y explicaciones de los profesores.



