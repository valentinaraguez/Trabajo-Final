Introducción.
Para este trabajo final de Bases de Datos II, los profesores decidieron hacerlo en grupo. Este quedó conformado por Martín Ortiz y Valentín Aragüez.
Una vez que nos pusimos de acuerdo de cómo avanzar, empezamos así.
1. 
Elegir el CSV con el que quisimos trabajar.
Cuando nos pusimos a ver los diferentes CSV que había en las páginas que nos dieron los profes Ariel y Matías, elegimos oferta_gastronomica.csv.
Como dice el nombre, tenía la información de los establecimientos gastronómicos de la ciudad de Buenos Aires.
La página contaba sobre sus campos. Por ejemplo longitud, latitud, identificador, nombre, categoría, cocina, ambientación, teléfono, mail, horario, dirección, barrio, comuna y códigos postales.
Después abrimos nosotros el CSV primero en Excel, para ver cómo estaba armado realmente.
Ahí encontramos estas columnas:
long
lat
id
nombre
categoria
cocina
ambientacion
telefono
mail
horario
calle_nombre
calle_altura
calle_cruce
direccion_completa
barrio
comuna
codigo_postal
codigo_postal_argentino
El profesor Matías nos había explicado que CSV significaba que el archivo eran datos separados por coma o punto y coma, así que lo abrimos en el Bloc de notas para ver cómo estaba el que elegimos nosotros.
En este caso estaban separados por punto y coma.
La primera línea empezaba así:
long;lat;id;nombre;categoria;cocina;ambientacion;telefono...
2. 
Decidir cómo íbamos a trabajar entre los dos.
Después de elegir el CSV, pensamos cómo nos íbamos a organizar para trabajar.
Como el trabajo final tenía que estar en GitHub, decidimos usar un repositorio público para guardar los archivos del proyecto y también para que quede registrado cómo fue avanzando todo.
La idea que tuvimos fue que cada uno tenga su propia base de datos MariaDB dentro de Docker en su computadora, y que los dos vayamos trabajando en el repositorio de GitHub.
De esa forma, si uno de los dos hacía una consulta, creaba una tabla o modificaba algún archivo del proyecto, guardaba ese cambio en el repositorio y el otro después iba a poder descargarlo y hacer lo mismo en su propia base.
También decidimos no guardar solamente el resultado final. A medida que fuéramos avanzando decidimos guardar las consultas SQL que usamos, las explicaciones de lo que fuimos haciendo y los cambios importantes del proyecto.
Para eso pensamos organizar el repositorio de una manera que nos sirva para eso, con algunos archivos y carpetas, y nos quedó más o menos así:
README.md: Este sería el archivo donde quedaría la explicación principal del proyecto. Ahí vamos contando qué base hicimos, qué datos usamos, cómo está organizada y demás.
proceso.md: Este sería el archivo donde vamos escribiendo lo que fuimos haciendo paso a paso, como lo estamos contando en este trabajo.
compose.yaml: Este sería el archivo donde quedaría guardada la configuración que vamos a usar para trabajar con MariaDB dentro de Docker.
datos/: Esta sería la carpeta donde guardaríamos el archivo CSV con el que elegimos trabajar.
sql/: Esta sería la carpeta donde vamos guardando las consultas y demás sentencias SQL que vayamos usando a medida que avancemos.
diagrama/: Esta sería la carpeta donde más adelante guardaríamos el diagrama de la base de datos.
También tuvimos en cuenta otra cosa importante para decidir cómo íbamos a trabajar.
Durante la materia, varios compañeros trabajan con XAMPP, prendiendo los servicios de Apache y MySQL/MariaDB, y después se conectan a la base usando HeidiSQL.
En el caso de Martín eso es un problema, porque usa lector de pantalla y HeidiSQL no le resulta accesible para trabajar de esa forma.
Por eso con Valentín decidimos que cada uno iba a probar primero la forma de trabajar que conocía y que le resultaba más cómoda.
Martín iba a probar trabajando con MariaDB dentro de Docker y usando la consola, mientras que Valentín podía probar también la forma que venía usando durante la materia.
La idea fue que la forma que nos funcionara mejor para hacer el trabajo la íbamos a ir documentando en proceso.md.
También decidimos que si en algún momento cambiábamos la forma de trabajar, por ejemplo si dejábamos de usar una herramienta y empezábamos a usar otra, también lo íbamos a dejar anotado explicando por qué hicimos ese cambio.
3. 
Crear y organizar el repositorio.
Después de decidir cómo nos íbamos a organizar, Valentín creó el repositorio público en GitHub e invitó a Martín para que los dos podamos trabajar en el mismo proyecto.
Martín descargó el repositorio en su computadora usando:
git clone https://github.com/valentinaraguez/Trabajo-Final
Resultado:
Cloning into 'Trabajo-Final'...
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
Receiving objects: 100% (3/3), done.
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio>
También creamos las carpetas y archivos que habíamos pensado para ordenar el proyecto.
Primero creamos las carpetas:
New-Item -ItemType Directory -Force datos, sql, diagrama
Después creamos el archivo proceso.md:
New-Item -ItemType File -Force proceso.md
Creamos también el archivo compose.yaml:
New-Item -ItemType File -Force compose.yaml
El repositorio ya tenía su README.md, así que no tuvimos que volver a crearlo.
Aprendiendo de GitHub, entendimos que no guarda carpetas vacías, así que pusimos un archivo vacío llamado .gitkeep dentro de sql y diagrama para que esas carpetas también puedan quedar guardadas en el repositorio:
New-Item -ItemType File -Force sql\.gitkeep
New-Item -ItemType File -Force diagrama\.gitkeep
Después copiamos el archivo oferta_gastronomica.csv dentro de la carpeta datos.
Desde la carpeta del repositorio usamos:
Copy-Item "..\..\oferta_gastronomica.csv" ".\datos\oferta_gastronomica.csv"
Con eso la estructura inicial nos quedó más o menos así:
README.md
proceso.md
compose.yaml

datos/
    oferta_gastronomica.csv

sql/
    .gitkeep

diagrama/
    .gitkeep
README.md: Este sería el archivo donde quedaría la explicación principal del proyecto. Ahí vamos contando qué base hicimos, qué datos usamos, cómo está organizada y demás.
proceso.md: Este sería el archivo donde vamos escribiendo lo que fuimos haciendo paso a paso, como lo estamos contando en este trabajo.
compose.yaml: Este sería el archivo donde quedaría guardada la configuración que vamos a usar para trabajar con MariaDB dentro de Docker.
datos/: Esta sería la carpeta donde guardaríamos el archivo CSV con el que elegimos trabajar.
sql/: Esta sería la carpeta donde vamos guardando las consultas y demás sentencias SQL que vayamos usando a medida que avancemos.
diagrama/: Esta sería la carpeta donde más adelante guardaríamos el diagrama de la base de datos.
Después comprobamos qué archivos nuevos había detectado Git:
git status
Resultado:
On branch main
Your branch is up to date with 'origin/main'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        compose.yaml
        datos/
        diagrama/
        proceso.md
        sql/

nothing added to commit but untracked files present (use "git add" to track)
Pusimos la documentación hasta este momento en proceso.md.
Agregamos esos archivos al próximo cambio que íbamos a guardar:
git add .
Volvimos a comprobar:
git status
Resultado:
On branch main
Your branch is up to date with 'origin/main'.

Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   compose.yaml
        new file:   datos/oferta_gastronomica.csv
        new file:   diagrama/.gitkeep
        new file:   proceso.md
        new file:   sql/.gitkeep
Después guardamos esta primera parte del trabajo con un commit:
git commit -m "crear las carpetas y archivos del proyecto"
Resultado:
[main 4e2ba89] crear las carpetas y archivos del proyecto
 5 files changed, 2824 insertions(+)
 create mode 100644 compose.yaml
 create mode 100644 datos/oferta_gastronomica.csv
 create mode 100644 diagrama/.gitkeep
 create mode 100644 proceso.md
 create mode 100644 sql/.gitkeep
Y finalmente subimos los cambios al repositorio de GitHub:
git push
Resultado:
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 4 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 135.85 KiB | 3.31 MiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)
To https://github.com/valentinaraguez/Trabajo-Final
   7e31bdc..4e2ba89  main -> main
De esa forma ya teníamos el repositorio organizado y GitHub empezaba a guardar cómo iba avanzando nuestro trabajo.
4. 
Buscar cómo crear MariaDB dentro de Docker.
Como elegimos trabajar con MariaDB dentro de Docker, no armamos directamente un comando sin saber qué hacía porque lo habíamos ocupado durante el año para algunas bases de datos, pero decidimos investigar para aprender mejor los comandos que teníamos que usar.
Primero buscamos cómo se crea un contenedor de MariaDB en Docker.
Ahí encontramos un documento de José Juan Sánchez, donde explicaba la creación de un contenedor MariaDB con docker run.
En ese documento él explica el uso de:
docker run
-d
--name
-e
-p
-v
También explica que MariaDB guarda sus bases de datos en /var/lib/mysql y que se puede usar un volumen para que la información no se borre por más que el contenedor se elimine o se vuelva a crear.
Fuente: José Juan Sánchez Hernández, “Práctica 6. Creación de un contenedor Docker con MariaDB”.
Link:
https://josejuansanchez.org/bd/practica-06/index.html
Ahí entendimos bien cómo empezar, pero buscamos más para ver si otras personas explicaban diferente a él.
Buscando, encontramos un artículo de Javier Cañete sobre MariaDB con Docker.
Ahí él enseña el uso de un volumen en /var/lib/mysql.
Desde su experiencia él da esta recomendación: fijar una versión de MariaDB en el comando en vez de usar siempre latest, porque latest puede apuntar a otra versión cuando se actualiza la imagen de Docker.
Fuente: Javier Cañete, “Cómo instalar MariaDB con Docker”.
Link:
https://jacar.es/como-instalar-mariadb-con-docker/
Después de volver a leer las dos fuentes decidimos crear el contenedor con un volumen para guardar los datos y usar una versión específica de MariaDB.
Investigando, aprendimos que MariaDB tiene 2 versiones, estable que se actualiza mucho pero tiene menos tiempo de soporte y LTS que se actualiza menos pero tiene más tiempo de soporte, así que decidimos usar la última rama LTS.
Abrimos PowerShell.
Después, para iniciar Docker hicimos:
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"
Y después el comando que armamos:
docker run --name mariadb_establecimientos_gastronomicos -e MARIADB_ROOT_PASSWORD=rootpass -p 3306:3306 -v mariadb_establecimientos_data:/var/lib/mysql -d mariadb:lts
Resultado:
06ccd8673fbf03197380759f660657cc9b96e3c4480167956473e13b65c9830a
Dejamos qué significaba cada parte para que nos sirviera de referencia si en otro momento teníamos que hacer algo parecido.
docker run ... creó y arrancó un contenedor nuevo en Docker.
--name mariadb_establecimientos_gastronomicos ... le puso el nombre que habíamos elegido al contenedor.
-e MARIADB_ROOT_PASSWORD=rootpass ... puso rootpass como contraseña del usuario administrador root.
-p 3306:3306 ... conectó el puerto 3306 de nuestra computadora con el puerto 3306 de MariaDB dentro del contenedor.
-v mariadb_establecimientos_data:/var/lib/mysql ... creó un volumen para conservar la información de MariaDB.
-d ... dejó el contenedor funcionando en segundo plano.
mariadb:lts ... especificó que use la última versión LTS de MariaDB.
Después comprobamos la versión de MariaDB por si las dudas:
docker exec mariadb_establecimientos_gastronomicos mariadb --version
Resultado:
mariadb from 12.3.3-MariaDB, client 15.2 for debian-linux-gnu (x86_64) using EditLine wrapper
5. 
Comprobar que el contenedor hubiera arrancado.
En la explicación de José Juan Sánchez encontramos que después de crear un contenedor se podía usar:
docker ps
para comprobar cuáles estaban funcionando.
Por eso ejecutamos:
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos> docker ps
CONTAINER ID   IMAGE         COMMAND                  CREATED         STATUS         PORTS                                         NAMES
06ccd8673fbf   mariadb:lts   "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp   mariadb_establecimientos_gastronomicos
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos>
Ahí comprobamos que aparezca:
mariadb_establecimientos_gastronomicos
6. 
Buscar cómo pasar nuestro CSV al contenedor.
Cuando buscamos sobre Docker y los contenedores, entendimos que el siguiente problema fue que el archivo estaba en nuestra computadora y MariaDB estaba dentro del contenedor.
Por eso buscamos cómo copiar archivos desde la computadora a un contenedor Docker.
Para eso encontramos un tutorial de Docker en español de Bruno Cascio donde explicaba el comando docker cp.
El ejemplo que él usa tiene más o menos esta forma:
docker cp archivo contenedor:/destino
Fuente: Bruno Cascio, “Docker en español”, apartado sobre copiar datos entre el host y los contenedores.
Link:
https://github.com/brunocascio/docker-espanol
Como solamente necesitábamos pasar el CSV para importar los datos, decidimos usar docker cp.
Antes de copiarlo también investigamos un problema que podía aparecer con la codificación del archivo, porque más o menos sabíamos que si tenía ñ, acentos y así teníamos que aprender cómo abordar eso.
7. 
Revisar la codificación del CSV.
Antes de importar el archivo buscamos sobre la codificación en los CSV.
Encontramos que cuando un archivo está guardado con una codificación y se abre usando otra pueden aparecer textos extraños como:
Ã±
Ã¡
ï¿½
Fuente: AdvertMind, “¿Cómo corregir caracteres ilegibles al exportar formatos de impresión?”.
Link:
https://helpdesk.advertmind.com/es/support/solutions/articles/27000086194--c%C3%B3mo-corregir-caracteres-ilegibles-al-exportar-formatos-de-impresi%C3%B3n-
También encontramos en Stack Overflow un caso muy interesante, donde un archivo estaba guardado como ANSI y los caracteres con tilde o ñ estaban dando problemas. La solución que usaron fue convertir el archivo a UTF-8 desde Notepad++, así que eso hicimos.
Fuente: Stack Overflow en español, “Problema al copiar código en otro documento”.
Link:
https://es.stackoverflow.com/questions/25214/problema-al-copiar-c%C3%B3digo-en-otro-documento
Por eso antes de modificar nuestro archivo original hicimos una copia.
Después abrimos el CSV original con Notepad++.
En la barra de estado que aparece abajo a la derecha pudimos ver la codificación con la que Notepad++ estaba interpretando el archivo.
En nuestro caso aparecía como:
ANSI
Como ANSI puede depender de la página de códigos de Windows, también probamos desde:
Codificación
Conjunto de caracteres
Europa occidental
Windows-1252
Al interpretar el archivo como Windows-1252 los caracteres normales del español se mostraban correctamente.
Por eso entendimos que el archivo podía leerse correctamente usando Windows-1252.
Después quisimos comprobar si había textos que ya estuvieran dañados dentro del CSV.
Para hacer eso usamos Ctrl+F en Notepad++ y buscamos caracteres que aparecen cuando hay problemas de codificación.
Por ejemplo buscamos:
Ã
Encontramos casos como:
PORTEÃ‘A
ESPAÃ‘OLA
A CORUÃƒâ€˜A
Esto fue importante porque nos mostró dos cosas diferentes.
Una cosa era la codificación del archivo que estábamos abriendo.
Otra cosa eran algunos textos que ya estaban escritos de forma incorrecta dentro del archivo original.
Por eso no intentamos corregir esos textos automáticamente, porque no sabíamos cómo hacer eso.
Si por ejemplo reemplazábamos todos los Ã del archivo, podíamos modificar datos que no correspondía modificar.
Así que hicimos una copia del archivo para trabajar con UTF-8.
En Notepad++ usamos:
Codificación
Convertir a UTF-8
Después guardamos la copia con el nombre:
oferta_gastronomica_utf8.csv
Usamos la opción Convertir a UTF-8 y no solamente Codificar en UTF-8, porque quisimos convertir realmente los caracteres desde la codificación anterior a UTF-8.
El archivo original quedó sin modificar.
De esa forma pudimos seguir trabajando con una copia en UTF-8, pero guardamos el CSV original por si necesitábamos volver a comprobar algún dato después.
8. 
Copiar el CSV al contenedor.
Después usamos lo que habíamos aprendido sobre docker cp.
Ejecutamos:
docker cp oferta_gastronomica_utf8.csv mariadb_establecimientos_gastronomicos:/temporal.csv
Resultado:
Successfully copied 441kB (transferred 443kB) to mariadb_establecimientos_gastronomicos:/temporal.csv
docker cp ... copió un archivo desde nuestra computadora hacia el contenedor.
oferta_gastronomica_utf8.csv ... fue la copia del CSV que quisimos importar.
mariadb_establecimientos_gastronomicos:/temporal.csv ... especificó que se copió dentro de ese contenedor y que adentro se llamó temporal.csv.
Decidimos llamarlo temporal.csv porque primero pensamos en importar la información a una tabla temporal antes de repartirla entre las tablas separadas.
9. 
Buscar cómo crear la base con la codificación correcta para que no dé errores.
Como estábamos trabajando con textos en español buscamos también qué codificación teníamos que usar para la base de datos.
Encontramos una explicación de Norvic Software donde mostraba la creación de una base usando utf8mb4 para poder guardar correctamente caracteres como tildes, eñes y otros símbolos.
Fuente: Norvic Software, “Crear una base de datos en MySQL: CREATE DATABASE paso a paso”.
Link:
https://norvicsoftware.com/crear-una-base-de-datos-en-mysql/
Así que decidimos usar eso.
10. 
Entrar a MariaDB.
Entramos a la consola de MariaDB con:
docker exec -it mariadb_establecimientos_gastronomicos mariadb -uroot -prootpass
Resultado:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 3
Server version: 12.3.3-MariaDB-ubu2404 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
docker exec ... ejecutó un comando dentro de un contenedor que ya estaba funcionando.
-it ... permitió que pudiéramos escribir comandos y trabajar de forma interactiva.
mariadb_establecimientos_gastronomicos ... especificó el contenedor en el que quisimos ejecutar el comando.
mariadb ... abrió la consola de MariaDB.
-uroot ... especificó que entramos con el usuario root.
-prootpass ... especificó que la contraseña era rootpass.
11. 
Crear la base de datos.
Creamos:
CREATE DATABASE oferta_gastronomica
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
Resultado:
Query OK, 1 row affected (0.056 sec)
CHARACTER SET utf8mb4: elegimos este juego de caracteres según lo que aprendimos de Norvic Software, porque nos permite guardar correctamente letras, tildes y los símbolos del español.
COLLATE utf8mb4_unicode_ci: elegimos esta configuración para ordenar y comparar textos sin que nos dé problemas el español. Vimos que Unicode ayuda a comparar correctamente letras y caracteres especiales, y ci significa que no diferencia entre mayúsculas y minúsculas.
Después usamos la base que creamos:
USE oferta_gastronomica;
Resultado:
Database changed
MariaDB [oferta_gastronomica]>
12. 
Buscar cuál era la mejor forma de importar un CSV que podía tener datos con errores.
Antes habíamos pensado crear directamente las tablas finales.
Pero cuando buscamos cómo hacer una importación de un CSV encontramos algo que cambió nuestra forma de trabajar.
En la guía de Underc0de recomendaban, para archivos que podían tener errores o formatos diferentes, usar primero una tabla intermedia con las columnas como texto.
Después los datos se podían revisar, limpiar y recién entonces pasar a las tablas definitivas.
Fuente: Underc0de, “Cómo importar un CSV en MySQL y PostgreSQL”.
Link:
https://underc0de.org/guias/bases-de-datos/como-importar-un-csv-en-mysql-y-postgresql/index.html
Por eso no creamos todavía las tablas finales.
Primero creamos:
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
Resultado:
Query OK, 0 rows affected (0.119 sec)
El CSV tenía las columnas long y lat pero nosotros usamos longitud y latitud porque nos resultaba más claro así.
Como la importación respetaba el orden de las columnas, eso no iba a cambiar la información que iba a estar en nuestra base de datos.
Después salimos de la consola:
EXIT;
13. 
Buscar cómo importar el CSV en consola.
Buscamos cómo importar un CSV desde la consola de MySQL/MariaDB.
Ahí aprendimos de mysqlimport, que es la herramienta equivalente a mariadb-import en MariaDB.
Ahí vimos opciones como:
--fields-terminated-by
--ignore-lines
--local
También se explicaba que el archivo debía tener el mismo nombre que la tabla en donde se quiere importar los datos.
Fuente: Nat Apuntes, “Importar datos desde CMD (MySQL)”.
Link:
https://www.natapuntes.es/importar-datos-desde-cmd-mysql/
Por eso llamamos al archivo:
temporal.csv
Así la herramienta pudo tomar temporal como el nombre de la tabla.
Después seguimos buscando y encontramos otra guía donde se explicaba que el separador podía ser una coma, un punto y coma u otro carácter y que había que usar el que realmente tuviera el archivo.
Fuente: Martyna Sławińska, LearnSQL.es, “Cómo importar un archivo CSV a una base de datos MySQL”.
Link:
https://learnsql.es/blog/como-importar-un-archivo-csv-a-una-base-de-datos-mysql/
Como nosotros ya habíamos comprobado que nuestro CSV estaba separado por ;, hicimos este comando con lo que fuimos aprendiendo:
docker exec -i mariadb_establecimientos_gastronomicos mariadb-import --user=root --password=rootpass --fields-terminated-by=";" --ignore-lines=1 --local oferta_gastronomica /temporal.csv
Resultado:
oferta_gastronomica.temporal: Records: 2823  Deleted: 0  Skipped: 0  Warnings: 0
docker exec ... ejecutó un comando dentro del contenedor.
-i ... mantuvo disponible la entrada mientras se ejecutó el comando.
mariadb_establecimientos_gastronomicos ... especificó el contenedor.
mariadb-import ... fue la herramienta que usamos para importar el archivo.
--user=root ... especificó el usuario.
--password=rootpass ... especificó la contraseña.
--fields-terminated-by=";" ... especificó que las columnas estaban separadas por punto y coma.
--ignore-lines=1 ... ignoró la primera línea porque ahí estaban los nombres de las columnas.
--local ... hizo que la herramienta lea el archivo indicado.
oferta_gastronomica ... fue la base donde cargamos los datos.
/temporal.csv ... fue el archivo que quisimos importar.
14. 
Comprobar si realmente se importaron los datos.
Volvimos a entrar a MariaDB para ver si todo fue bien:
docker exec -it mariadb_establecimientos_gastronomicos mariadb -uroot -prootpass
Resultado:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 6
Server version: 12.3.3-MariaDB-ubu2404 mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>
Después:
USE oferta_gastronomica;
Resultado:
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
MariaDB [oferta_gastronomica]>
Queríamos ver si la importación había salido bien.
Por eso lo primero que hicimos fue:
SELECT COUNT(*)
FROM temporal;
El resultado fue:
+----------+
| COUNT(*) |
+----------+
|     2823 |
+----------+
1 row in set (0.050 sec)
Por lo tanto teníamos 2823 registros cargados.
15. 
Investigar qué revisar antes de elegir los tipos de datos.
En la misma web donde aprendimos sobre importaciones vimos que antes de pasar los datos a columnas más estrictas era bueno revisar valores vacíos, formatos, valores diferentes y problemas en los datos.
Hubo otra web que también nos sirvió de Alex Ayala sobre perfilado de datos, donde él trabajaba con valores distintos, valores únicos y problemas como espacios en blanco.
Fuente: Alex Ayala, “Dominar el perfilado de datos”.
Link:
https://blog.alexayala.es/2025/10/09/dominar-el-perfilado-de-datos-en-power-bi-la-base-invisible-que-marca-la-diferencia/
Nosotros no usamos Power BI, pero agarramos la idea de revisar los datos antes de decidir el tipo y demás.
SELECT, COUNT, AS y FROM ya los habíamos ido aprendiendo y usando durante el año en las distintas consultas que fuimos haciendo con los ejercicios que nos dieron los 2 profes de bases de datos.
Lo que necesitábamos entender mejor era DISTINCT, así que buscamos una explicación sobre eso. Encontramos un artículo de Tihomir Babic donde explica que COUNT(DISTINCT columna) sirve para contar los valores diferentes de una columna sin contar los repetidos.
Fuente: Tihomir Babic, “¿Cuál es la diferencia entre COUNT(*), COUNT(1), COUNT(nombre de columna) y COUNT(DISTINCT nombre de columna)?”.
Link:
https://learnsql.es/blog/cual-es-la-diferencia-entre-count-count1-countnombre-de-columna-y-countdistinct-nombre-de-columna/
Con eso entendimos que podíamos usar COUNT(DISTINCT id) para saber cuántos id diferentes había en nuestra tabla, así que aprovechamos eso.
Hicimos:
SELECT
    COUNT(*) AS cantidad_de_registros,
    COUNT(DISTINCT id) AS ids_diferentes
FROM temporal;
El resultado fue:
+-----------------------+----------------+
| cantidad_de_registros | ids_diferentes |
+-----------------------+----------------+
|                  2823 |           2823 |
+-----------------------+----------------+
1 row in set (0.062 sec)
Ahí vimos que teníamos 2823 registros y también 2823 id diferentes, por lo tanto no había id repetidos en la tabla temporal.
16. 
Ver cómo compartir la configuración de MariaDB entre los dos.
Hasta este momento Martín había creado su contenedor de MariaDB usando directamente docker run y ya tenía la base funcionando ahí.
Pero nos dimos cuenta de que muchas de las cosas que habíamos hecho desde el punto 3 hasta acá estaban solamente en la computadora de Martín y explicadas en proceso.md.
Como queríamos que el repositorio también mostrara el trabajo que realmente fuimos haciendo, empezamos a guardar ahí los archivos que correspondían.
Primero copiamos a la carpeta datos/ la copia del CSV que habíamos convertido a UTF-8 y que fue la que usamos para hacer la importación.
Desde la carpeta del repositorio usamos:
Copy-Item "..\..\oferta_gastronomica_utf8.csv" ".\datos\oferta_gastronomica_utf8.csv"
De esa forma quedó guardado en:
datos/oferta_gastronomica_utf8.csv
También empezamos a usar la carpeta sql/ que habíamos creado al principio.
Ahí guardamos las sentencias SQL que ya habíamos usado durante el trabajo.
Creamos:
sql/01_crear_base_y_tabla_temporal.sql
En ese archivo guardamos las sentencias que usamos para crear la base oferta_gastronomica, seleccionar la base y crear la tabla temporal.
También creamos:
sql/02_comprobaciones.sql
Ahí guardamos las primeras consultas que usamos para comprobar que los datos se habían importado correctamente.
De esa forma el repositorio no solamente tenía la explicación de lo que hicimos en proceso.md, sino también el CSV con el que realmente trabajamos y las sentencias SQL que fuimos usando.
Después apareció otro problema.
Como el trabajo lo hacemos entre los dos, nos dimos cuenta de que necesitábamos una forma de guardar también la configuración de MariaDB que estábamos usando para que el otro pueda crear un entorno parecido en su computadora.
Cuando armamos el repositorio habíamos dejado creado el archivo compose.yaml justamente pensando en guardar ahí más adelante la configuración de Docker, pero hasta este momento todavía estaba vacío.
Por eso antes de escribirlo decidimos investigar cómo funciona Docker Compose y cómo podíamos pasar a ese archivo la configuración que Martín ya había probado con docker run.
También tuvimos en cuenta que no queríamos borrar ni perder la base que Martín ya tenía funcionando, así que primero íbamos a entender bien cómo hacerlo y después probarlo.
17. 
Comprobar que Valentín también pueda hacer la importación usando Heidi.
Mientras Martín había hecho la importación usando MariaDB dentro de Docker y trabajando desde la consola, Valentín probó hacerlo con la forma que venía usando durante la materia.
Cuando terminó le confirmó a Martín que también pudo hacer la importación de los datos del csv usando HeidiSQL.
Eso sirvió para comprobar que la forma de trabajo que habíamos pensado al principio podía funcionar: no fue necesario que los dos usáramos exactamente las mismas herramientas para trabajar con la base.
Martín podía seguir usando Docker y la consola porque le resultaban accesibles con el lector de pantalla, mientras que Valentín podía trabajar con HeidiSQL.
Lo importante era que los dos trabajáramos sobre la misma estructura de la base y que las consultas y cambios importantes quedaran guardados en los archivos SQL y en el repositorio.
18. Investigar cómo funciona Docker Compose y cómo pasar nuestra configuración de MariaDB.
Como habíamos dejado escrito antes, hasta este momento Martín había creado MariaDB usando directamente docker run.
El comando que ya nos había funcionado era:
docker run --name mariadb_establecimientos_gastronomicos -e MARIADB_ROOT_PASSWORD=rootpass -p 3306:3306 -v mariadb_establecimientos_data:/var/lib/mysql -d mariadb:lts
El problema era que toda esa configuración estaba dentro del comando que Martín había ejecutado en su computadora.
Como queríamos que Valentín pueda tener una configuración parecida y que además quedara guardada en el repositorio, empezamos a buscar cómo funciona Docker Compose.
Encontramos un artículo de Mauro Bernal donde él explica que Docker Compose permite guardar la configuración de los contenedores dentro de un archivo compose.yaml, en vez de tener que recordar y volver a escribir todos los parámetros de docker run.
También él explica que dentro de services se pueden indicar cosas como la imagen, los puertos, las variables de entorno y los volúmenes.
Fuente: Mauro Bernal, “Docker Compose de cero a producción — Parte 1: Qué es y cómo funciona”.
Link:
https://maurobernal.com.ar/blog/docker-compose-de-cero-a-produccion-parte-1/
Ahí también vimos que actualmente se usa:
docker compose
sin el guion que aparecía antes como:
docker-compose
También vimos que en la versión actual no hacía falta poner al principio del archivo algo como:
version: "3.8"
Con eso empezamos a comparar nuestro comando con las partes de un archivo Compose.
En nuestro comando teníamos:
mariadb:lts
que era la imagen.
Teníamos:
3306:3306
que era el puerto.
Teníamos:
MARIADB_ROOT_PASSWORD
como variable de entorno.
Y teníamos:
mariadb_establecimientos_data:/var/lib/mysql
que era el volumen donde MariaDB estaba guardando los datos.
Después buscamos otra explicación para ver un ejemplo más sencillo de cómo se podía usar Compose para que otra persona pueda levantar un entorno parecido.
Encontramos un artículo de Lucas Juárez donde él explica que una de las ventajas de Docker Compose es poder guardar la configuración en un archivo y después repetirla en otra computadora usando ese mismo archivo.
Fuente: Lucas Juárez, “Docker Compose para principiantes: tu primer proyecto”.
Link:
https://lucasjuarez.com/blog/docker-compose-principiantes/
En su explicación él recomienda no escribir las contraseñas directamente dentro de compose.yaml, sino guardarlas en un archivo .env y hacer que Compose lea el valor desde ahí.
También él explica que ese archivo .env no se debería subir al repositorio.
Eso nos pareció mejor que dejar:
MARIADB_ROOT_PASSWORD=rootpass
escrito directamente dentro de compose.yaml.
Por eso pensamos que el archivo podía usar una variable así:
MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}
y que cada uno tuviera el valor correspondiente en su archivo .env.
Pero todavía nos quedaba una duda importante.
Martín ya tenía creado el volumen:
mariadb_establecimientos_data
y ahí estaba la base que habíamos importado.
No queríamos que al empezar a usar Compose se creara otro volumen diferente y pareciera que habíamos perdido la base.
Por eso buscamos específicamente cómo se hacía cuando el volumen ya existía antes de crear el archivo Compose.
Encontramos un artículo de Guido Collino donde él explica la diferencia entre los volúmenes y los bind mounts de Docker.
También él explica que un volumen puede haber sido creado anteriormente fuera de Docker Compose y que, si queremos usar ese mismo volumen desde Compose, se puede declarar como externo usando:
external: true
Fuente: Guido Collino, “Docker: la verdadera diferencia entre volumes y bind mounts”.
Link:
https://medium.com/unagi/docker-la-verdadera-diferencia-entre-volumes-y-bind-mounts-aa7ed61d06ab
Esto era justamente lo que necesitábamos porque nuestro volumen no había sido creado por Compose.
Lo habíamos creado cuando ejecutamos docker run.
Por eso entendimos que no necesitábamos crear otro volumen para MariaDB.
Podíamos decirle a Compose que utilizara el volumen que ya existía.
Con todo lo que fuimos encontrando vimos que nuestra configuración podía quedar parecida a esta:
services:
  mariadb:
    image: mariadb:lts
    container_name: mariadb_establecimientos_gastronomicos
    environment:
      MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}
    ports:
      - "3306:3306"
    volumes:
      - mariadb_establecimientos_data:/var/lib/mysql

volumes:
  mariadb_establecimientos_data:
    external: true
Pero todavía no ejecutamos esta configuración.
Antes quisimos comprobar bien que el volumen que ya teníamos seguía existiendo y después hacer el cambio sin borrar los datos de la base.
No queríamos cambiar directamente algo que ya nos estaba funcionando sin antes comprobar bien qué iba a pasar.
Primero investigamos cómo pasar a Compose la configuración que ya teníamos y cómo usar el mismo volumen.
Después íbamos a comprobar el volumen que ya estaba creado y recién ahí probar compose.yaml.
19. Comprobar el volumen que ya teníamos creado.
Antes de probar el archivo compose.yaml quisimos comprobar que el volumen donde estaba nuestra base seguía existiendo y que el contenedor que ya teníamos estaba usando ese volumen.
Como no queríamos hacer algo que pueda borrar los datos, primero buscamos cómo se podían consultar los volúmenes que ya estaban creados en Docker.
Encontramos una explicación de José Domingo Muñoz donde él muestra algunos comandos para trabajar con los volúmenes.
Ahí él explica que:
docker volume ls
sirve para ver los volúmenes que tenemos creados.
También muestra:
docker volume inspect nombre_del_volumen
para ver la información de un volumen en particular.
Fuente: José Domingo Muñoz, “Asociando almacenamiento a los contenedores: volúmenes Docker”.
Link:
https://plataforma.josedomingo.org/pledin/cursos/docker2024/contenido/modulo4/03_volumen/
En la misma explicación él también muestra que se puede usar docker inspect para comprobar los puntos de montaje de un contenedor.
Eso nos servía porque nosotros no solamente queríamos saber si el volumen existía.
También queríamos comprobar que nuestro contenedor:
mariadb_establecimientos_gastronomicos
seguía teniendo conectado:
mariadb_establecimientos_data
en:
/var/lib/mysql
Primero decidimos listar los volúmenes:
docker volume ls
ahí en el resultado encontramos:
local     mariadb_establecimientos_data                                                                                 
Después decidimos ver la información de ese volumen:
docker volume inspect mariadb_establecimientos_data
Con eso podíamos comprobar cosas como su nombre, el driver que estaba usando y el lugar donde Docker guardaba ese volumen.
El resultado fue:
[                                                                                                                       
    {                                                                                                                   
        "CreatedAt": "2026-10-02T14:28:22Z",                                                                            
        "Driver": "local",                                                                                              
        "Labels": null,                                                                                                 
        "Mountpoint": "/var/lib/docker/volumes/mariadb_establecimientos_data/_data",                                    
        "Name": "mariadb_establecimientos_data",                                                                        
        "Options": null,                                                                                                
        "Scope": "local"                                                                                                
    }                                                                                                                   
]                                                                                                                       
PS C:\Users\ortiz>
Después quisimos comprobar también qué volumen tenía conectado nuestro contenedor de MariaDB.
Para eso usamos:
docker inspect mariadb_establecimientos_gastronomicos --format "{{range .Mounts}}{{.Type}} {{.Name}} -> {{.Destination}}{{end}}"
Lo que nos interesaba comprobar era que aparezca el volumen:
mariadb_establecimientos_data
relacionado con:
/var/lib/MySQL
El resultado fue:
volume mariadb_establecimientos_data -> /var/lib/mysql                                                                  
PS C:\Users\ortiz>
Antes de seguir no usamos ningún comando para borrar volúmenes ni contenedores.
Primero quisimos ver lo que ya teníamos y comprobar que el volumen que contenía nuestra base seguía ahí.
Después de comprobar eso recién íbamos a pensar cómo pasar del contenedor que habíamos creado con docker run al que íbamos a manejar con Docker Compose.
21. 
Preparar el cambio del contenedor a Docker Compose.
Después de comprobar que el volumen seguía existiendo y que nuestro contenedor de MariaDB lo estaba usando, quisimos ver cómo podíamos pasar a Docker Compose sin perder la base que ya teníamos.
Buscamos cómo se podía detener y borrar solamente un contenedor sin borrar el volumen donde estaban guardados los datos.
Encontramos una explicación de Eduardo Zepeda donde él muestra que los volúmenes sirven justamente para guardar información fuera del contenedor y que esa información puede seguir estando aunque el contenedor se borre.
Fuente: Eduardo Zepeda, “Comandos de Docker más útiles para manejar contenedores”.
Link:
https://coffeebytes.dev/es/docker/tutorial-basicos-de-comandos-de-docker/
En su explicación él primero crea un volumen, lo usa dentro de un contenedor y después hace:
docker stop nombre_del_contenedor
docker rm nombre_del_contenedor
Después comprueba que el contenido del volumen sigue existiendo.
Eso nos sirvió porque era parecido a lo que nosotros necesitábamos hacer.
Nuestro contenedor se llamaba:
mariadb_establecimientos_gastronomicos
y el volumen que ya habíamos comprobado era:
mariadb_establecimientos_data
Por eso entendimos que podíamos detener y borrar solamente el contenedor viejo para después volver a crear uno con Docker Compose usando el mismo volumen.
No queríamos usar ningún comando para borrar el volumen.
Primero decidimos detener el contenedor:
docker stop mariadb_establecimientos_gastronomicos
Después íbamos a comprobar que estuviera detenido:
docker ps -a
resultado:
CONTAINER ID   IMAGE                                                   COMMAND                   CREATED        STATUS                          PORTS                                           NAMES                                           
06ccd8673fbf   mariadb:lts                                             "docker-entrypoint.s…"    11 days ago    Exited (137) 45 hours ago                                                       mariadb_establecimientos_gastronomicos          
afbf03d9d93b   mariadb:latest                                          "docker-entrypoint.s…"    6 weeks ago    Exited (137) 6 weeks ago                                                        mariadb                                         
341e0806f2e2   public.ecr.aws/supabase/postgres:17.6.1.158             "sh -c '\ncat <<'EOF'…"   2 months ago   Up 18 minutes (healthy)         0.0.0.0:54322->5432/tcp, [::]:54322->5432/tcp   supabase_db_sistema-biblioteca-rdd              
75a918e14ffb   public.ecr.aws/supabase/studio:2026.08.10-sha-5b68af1   "docker-entrypoint.s…"    2 months ago   Up 18 minutes (healthy)         0.0.0.0:54323->3000/tcp, [::]:54323->3000/tcp   supabase_studio_sistema-biblioteca-rdd          
34979692ae87   public.ecr.aws/supabase/postgres-meta:v0.97.0           "docker-entrypoint.s…"    2 months ago   Up 18 minutes (healthy)         8080/tcp                                        supabase_pg_meta_sistema-biblioteca-rdd         
cd16b0a5338a   public.ecr.aws/supabase/edge-runtime:v1.74.3            "sh -c 'edge-runtime…"    2 months ago   Exited (255) 8 weeks ago                                                        supabase_edge_runtime_sistema-biblioteca-rdd    
0a076e34e569   public.ecr.aws/supabase/storage-api:v1.69.0             "docker-entrypoint.s…"    2 months ago   Up 18 minutes (healthy)         5000/tcp                                        supabase_storage_sistema-biblioteca-rdd         
1f6b4daa19ee   public.ecr.aws/supabase/postgrest:v16.1                 "/bin/postgrest"          2 months ago   Up 18 minutes                   3000/tcp                                        supabase_rest_sistema-biblioteca-rdd            
9a4ec8ab1478   public.ecr.aws/supabase/realtime:v2.124.4               "/usr/bin/tini -s -g…"    2 months ago   Up 18 minutes (healthy)         4000/tcp                                        supabase_realtime_sistema-biblioteca-rdd        
3e9c428a456f   public.ecr.aws/supabase/mailpit:v1.30.2                 "/mailpit"                2 months ago   Up 18 minutes (healthy)         0.0.0.0:54324->8025/tcp, [::]:54324->8025/tcp   supabase_inbucket_sistema-biblioteca-rdd        
db74c25e74b4   public.ecr.aws/supabase/gotrue:v2.195.0                 "auth"                    2 months ago   Up 18 minutes (healthy)         9999/tcp                                        supabase_auth_sistema-biblioteca-rdd            
f60c6ffb710d   public.ecr.aws/supabase/kong:2.8.1                      "sh -c 'cat <<'EOF' …"    2 months ago   Up 18 minutes (healthy)         0.0.0.0:54321->8000/tcp, [::]:54321->8000/tcp   supabase_kong_sistema-biblioteca-rdd            
177977de4f13   public.ecr.aws/supabase/vector:0.53.0-alpine            "sh -c 'cat <<'EOF' …"    2 months ago   Restarting (0) 44 seconds ago                                                   supabase_vector_sistema-biblioteca-rdd          
5aab8e7ff625   public.ecr.aws/supabase/logflare:1.50.2                 "sh -c 'cat <<'EOF' …"    2 months ago   Up 18 minutes (healthy)         0.0.0.0:54327->4000/tcp, [::]:54327->4000/tcp   supabase_analytics_sistema-biblioteca-rdd       
af0d20a24b36   mariadb:latest                                          "docker-entrypoint.s…"    2 months ago   Exited (255) 2 months ago       0.0.0.0:3306->3306/tcp                          mariadb-cotel                                   
25e928766b3f   mariadb:latest                                          "docker-entrypoint.s…"    3 months ago   Exited (255) 2 months ago       0.0.0.0:3307->3306/tcp                          mi-mariadb                                      
PS C:\Users\ortiz>                                                                                                      

Y recién después podíamos borrar solamente ese contenedor:
docker rm mariadb_establecimientos_gastronomicos
Antes de hacerlo tuvimos en cuenta que no queríamos usar comandos como:
docker volume rm
ni:
docker volume prune
porque esos comandos sí trabajan directamente con los volúmenes.
La idea era borrar solamente el contenedor que habíamos creado con docker run, pero conservar:
mariadb_establecimientos_data
para después volver a usarlo desde compose.yaml.
Después de borrar el contenedor íbamos a volver a comprobar que el volumen todavía aparezca con:
docker volume ls
Si seguía apareciendo, recién ahí íbamos a crear el nuevo contenedor usando Docker Compose.
resultado:
DRIVER    VOLUME NAME                                                                                                   
local     mariadb_establecimientos_data                                                                                 
22. 
Crear los archivos .env y compose.yaml.
Después de comprobar que el volumen mariadb_establecimientos_data seguía existiendo, recién ahí seguimos con la preparación de Docker Compose.
Antes ya habíamos investigado que Compose permite guardar la configuración de los contenedores dentro de un archivo compose.yaml, para no tener que recordar y volver a escribir todos los parámetros de docker run.
También habíamos visto que dentro de services se podían indicar cosas como la imagen, los puertos, las variables de entorno y los volúmenes.
Fuente: Mauro Bernal, “Docker Compose de cero a producción — Parte 1: Qué es y cómo funciona”.
Link:
https://maurobernal.com.ar/blog/docker-compose-de-cero-a-produccion-parte-1/
También habíamos encontrado una explicación de Lucas Juárez donde decía que una de las ventajas que podemos aprovechar si usamos Docker Compose era poder guardar la configuración en un archivo y repetirla después en otra computadora usando ese mismo archivo.
En esa misma explicación vimos que no era bueno escribir la contraseña directamente dentro de compose.yaml, sino ponerla en un archivo .env y hacer que Compose la lea desde ahí.
Fuente: Lucas Juárez, “Docker Compose para principiantes: tu primer proyecto”.
Link:
https://lucasjuarez.com/blog/docker-compose-principiantes/
Por eso primero nos ubicamos en la carpeta raíz del proyecto, es decir, en la misma carpeta donde veníamos guardando los archivos del trabajo y donde también iba a quedar el archivo compose.yaml.
Desde PowerShell entramos a la carpeta del proyecto y comprobamos dónde estábamos ubicados con:
pwd
resultado:
Path                                                                                                                    
----                                                                                                                    
H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trab... 
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>                                                                                                               

Después listamos los archivos para confirmar que estábamos en la carpeta correcta:
dir
resultado:
dir
    Directorio: H:\Mi unidad\escuela comercio\2026\materias\Bases de datos                                              
    II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final                                                  
Mode                 LastWriteTime         Length Name                                                                  
----                 -------------         ------ ----                                                                  
d-----         2/10/2026     15:30                datos                                                                 
d-----         2/10/2026     16:27                sql                                                                   
d-----         2/10/2026     14:33                diagrama                                                              
------         2/10/2026     14:26             89 README.md                                                             
------         2/10/2026     16:38          30471 proceso.md                                                            
------         2/10/2026     14:31              0 compose.yaml                                                          
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>                                                                                                               
Ahí creamos primero el archivo .env.con:
notepad .env
Como el archivo no existía todavía, Notepad nos preguntó si queríamos crearlo.
Apretamos si y escribimos dentro lo necesario para que docker pueda usar mariadb ósea la contarseña que le habíamos puesto:
MARIADB_ROOT_PASSWORD=rootpass
Después guardamos el archivo.
Con eso ya creamos una variable llamada MARIADB_ROOT_PASSWORD y le dimos como valor la contraseña que veníamos usando.
No queríamos escribir directamente:
rootpass
dentro de compose.yaml.
Por eso después, en el archivo Compose, la íbamos a llamar así:
${MARIADB_ROOT_PASSWORD}
Eso para que docker entienda la referencia y todo funcione bien.
También tuvimos en cuenta que el archivo .env no debería subirse al repositorio, porque ahí teníamos la contraseña y por más que esto sea un trabajo de clase nos servía para cuando trabajemos con proyectos mas grandes.
Después creamos el archivo compose.yaml.
Para eso, en la misma carpeta del proyecto usamos el mismo comando:
notepad compose.yaml
Como el archivo no existía todavía, Notepad también nos preguntó si queríamos crearlo.
Apretamos en si y empezamos a escribir la configuración.
No fue difícil porque en el archivo pasamos la configuración que antes estaba escrita dentro del comando docker run.
Nuestro comando anterior tenía:
mariadb:lts
que era la imagen.
También tenía:
3306:3306
que era el puerto.
Tenía la variable:
MARIADB_ROOT_PASSWORD
y también tenía el volumen:
mariadb_establecimientos_data:/var/lib/mysql
Como ese volumen ya existía y no había sido creado por Compose, usamos:
external: true
Esto lo hicimos porque antes habíamos investigado que, cuando un volumen fue creado antes de usar Compose, se podía declarar como externo para que Compose use ese mismo volumen y no creara otro nuevo.
Fuente: Guido Collino, “Docker: la verdadera diferencia entre volumes y bind mounts”.
Link:
https://medium.com/unagi/docker-la-verdadera-diferencia-entre-volumes-y-bind-mounts-aa7ed61d06ab
Con todo eso, el archivo compose.yaml quedó así:
services:
  mariadb:
    image: mariadb:lts
    container_name: mariadb_establecimientos_gastronomicos
    environment:
      MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}
    ports:
      - "3306:3306"
    volumes:
      - "mariadb_establecimientos_data:/var/lib/mysql"

volumes:
  mariadb_establecimientos_data:
    external: true
Después guardamos el archivo.
En este archivo:
services indicaba los servicios o contenedores que Compose iba a manejar.
mariadb era el nombre del servicio que estábamos usando.
image: mariadb:lts indicaba la imagen que queríamos usar.
container_name: mariadb_establecimientos_gastronomicos indicaba el nombre que queríamos que tuviera el contenedor.
environment indicaba las variables de entorno.
MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD} tomaba la contraseña desde el archivo .env.
ports conectaba el puerto 3306 de nuestra computadora con el puerto 3306 del contenedor.
volumes conectaba el volumen mariadb_establecimientos_data con /var/lib/mysql, que era donde MariaDB guardaba sus datos.
Y al final:
volumes:
  mariadb_establecimientos_data:
    external: true
indicaba que ese volumen ya existía y que Docker Compose no tenía que crear uno nuevo.
23.
Comprobar que compose.yaml estuviera bien escrito.

Después de crear .env y compose.yaml no quisimos levantar directamente el contenedor.

Primero quisimos comprobar que Docker Compose pueda leer bien lo que habíamos escrito, porque habíamos visto que YAML depende de la sangría y además estábamos usando una variable que venía del archivo .env.

Buscamos si Docker Compose tenía alguna forma de revisar la configuración antes de levantar los contenedores.

Buscando, encontramos la segunda parte de la explicación de Mauro Bernal sobre Docker Compose.

Ahí él explicaba:

docker compose config

y contaba que ese comando permite ver la configuración que Compose entendió después de leer el archivo y reemplazar las variables de entorno.

Fuente: Mauro Bernal, “Docker Compose de cero a producción — Parte 2: CLI, dependencias robustas y perfiles”.

Link: [Docker Compose de cero a producción — Parte 2](https://maurobernal.com.ar/blog/docker-compose-de-cero-a-produccion-parte-2/?utm_source=chatgpt.com)

Por eso, desde la carpeta del proyecto donde ya estaban .env y compose.yaml, ejecutamos:

docker compose config

Resultado:
name: trabajo-final                                                                                                     
services:                                                                                                               
  mariadb:                                                                                                              
    container_name: mariadb_establecimientos_gastronomicos                                                              
    environment:                                                                                                        
      MARIADB_ROOT_PASSWORD: rootpass                                                                                   
    image: mariadb:lts                                                                                                  
    networks:                                                                                                           
      default: null                                                                                                     
    ports:                                                                                                              
      - mode: ingress                                                                                                   
        target: 3306                                                                                                    
        published: "3306"                                                                                               
        protocol: tcp                                                                                                   
    volumes:                                                                                                            
      - type: volume                                                                                                    
        source: mariadb_establecimientos_data                                                                           
        target: /var/lib/mysql                                                                                          
        volume: {}                                                                                                      
networks:                                                                                                               
  default:                                                                                                              
    name: trabajo-final_default                                                                                         
volumes:                                                                                                                
  mariadb_establecimientos_data:                                                                                        
    name: mariadb_establecimientos_data                                                                                 
    external: true                                                                                                      
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>
Explicación para recordar:
docker compose indicaba que queríamos trabajar con Docker Compose.

config hacía que Compose lea nuestra configuración y mostrara cómo la había interpretado, pero sin levantar todavía el contenedor.

En el resultado quisimos comprobar que aparezca:

mariadb:lts

como imagen.

También:

3306

como puerto.

La variable:

MARIADB_ROOT_PASSWORD

y el volumen:

mariadb_establecimientos_data

También quisimos comprobar que no aparezca ningún error relacionado con la escritura de compose.yaml.
Todo fue bien así que seguimos.

24.

Evitar que .env se suva al repositorio.

Cuando creamos .env habíamos puesto ahí:

MARIADB_ROOT_PASSWORD=rootpass

Como era un archivo que podía contener contraseñas, no quisimos subirlo a GitHub.

Buscamos cómo se hacía normalmente en un proyecto.

Encontramos una explicación de Miguel A. C. M. sobre la gestión de secretos.
Ya habíamos trabajado en GitHub ante pero como queríamos aprender mas de el tema nos pusimos a ver que podíaos aprender.
En lo que escribió Él explica que los archivos .env con valores reales no deberían quedar guardados dentro del repositorio y recomienda agregarlos a .gitignore.

También explica la idea de tener un archivo de ejemplo que muestre qué variables necesita el proyecto, pero sin guardar los valores reales.

Fuente: Miguel A. C. M., “Gestión de secretos: cómo no filtrar API keys, .env ni tokens”.

Link: [Gestión de secretos: cómo no filtrar API keys, .env ni tokens](https://miguelacm.es/blog/gestion-de-secretos?utm_source=chatgpt.com)

Por eso desde la carpeta principal del proyecto decidimos crear el archivo gitignore

Para hacerlo usamos:

notepad .gitignore

Como el archivo todavía no existía, Notepad nos preguntó si queríamos crearlo.

Apretamos si y adentro escribimos:

.env

Después guardamos el archivo.

Explicación para recordar:
.gitignore es un archivo donde se pueden indicar archivos o carpetas que no queremos que Git agregue normalmente al repositorio.

En nuestro caso pusimos:

.env

porque queríamos que cada uno tuviera su propio archivo con su contraseña, pero que ese archivo no quedara publicado en GitHub.

Después creamos:

.env.example

Usamos:

notepad .env.example

Y adentro escribimos:

MARIADB_ROOT_PASSWORD=

Después guardamos.

Este archivo sí se podía subir al repositorio porque no tenía ninguna contraseña.

Solamente lo pusimos para mostrar y dejar claro que para usar el proyecto había que tener una variable que sea:

MARIADB_ROOT_PASSWORD

Después comprobamos:

git status

Resultado:
On branch main                                                                                                          
Your branch is up to date with 'origin/main'.                                                                           
Changes not staged for commit:                                                                                          
  (use "git add <file>..." to update what will be committed)                                                            
  (use "git restore <file>..." to discard changes in working directory)                                                 
        modified:   compose.yaml                                                                                        
Untracked files:                                                                                                        
  (use "git add <file>..." to include in what will be committed)                                                        
        .env.example                                                                                                    
        .gitignore                                                                                                      
no changes added to commit (use "git add" and/or "git commit -a")                                                       
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>
Lo que quisimos comprobar especialmente fue que:

.env

no aparezca entre los archivos que Git quería agregar.
Como fue así seguimos.
25.

Levantar MariaDB usando Docker Compose.

Después de comprobar la configuración y preparar .gitignore, recién ahí quisimos probar Docker Compose.

Para eso usamos la explicación de Lucas Juárez donde mostraba:

docker compose up -d

para levantar los servicios definidos en el archivo Compose.

También mostraba:

docker compose ps

para comprobar cuáles estaban funcionando.

Él explicaba además que -d deja los contenedores ejecutándose en segundo plano.

Fuente: Lucas Juárez, “Docker Compose para principiantes: tu primer proyecto”.

Link: [Docker Compose para principiantes](https://lucasjuarez.com/blog/docker-compose-principiantes/?utm_source=chatgpt.com)

Por lo tanto desde la carpeta del proyecto ejecutamos:

docker compose up -d

Resultado:
[+] up 0/1                                                                                                              
 - Network trabajo-final_default Creating                                                                           0.1s
1/2
✔
ed
0.1s
 - Container mariadb_establecimientos_gastronomicos Creating                                      
0
2
✔
ed 
4
1
-
Starting
5
2
✔
ed 
1.0
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>
Explicación para después.
docker compose indicó que queríamos trabajar con la configuración de Docker Compose.

up indicó que queríamos crear o arrancar los servicios definidos en compose.yaml.

-d hizo que el contenedor quedara funcionando en segundo plano.

Después comprobamos:

docker compose ps

Resultado:
NAME                                     IMAGE         COMMAND                  SERVICE   CREATED          STATUS          PORTS                                                                                                                
mariadb_establecimientos_gastronomicos   mariadb:lts   "docker-entrypoint.s…"   mariadb   54 seconds ago   Up 52 seconds   0.0.0.0:3306->3306/tcp, [::]:3306->3306/tcp                                                                          
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>
expicación.
ps mostró los servicios del proyecto y su estado.

Lo que quisimos comprobar fue que aparezca:

mariadb_establecimientos_gastronomicos

Todo estaba funcionando bien así que seguimos.

26.

Comprobar que seguíamos usando la base anterior.

Aunque el contenedor arrancó, , queríamos estar seguros de que todo estaba bien.

Nosotros habíamos puesto:

external: true

justamente porque queríamos que Compose vuelva a utilizar el volumen:

mariadb_establecimientos_data

donde ya estaba nuestra base de datos.

Por eso no alcanzaba con comprobar que el contenedor estuviera funcionando.

También teníamos que comprobar que los datos anteriores siguieran ahí.

Entramos a MariaDB con:

docker compose exec mariadb mariadb -uroot -p
explicación.
docker compose exec permitió ejecutar un comando dentro de un servicio que ya estaba funcionando.

mariadb después de exec fue el nombre del servicio que habíamos definido dentro de compose.yaml.

El segundo mariadb fue el programa que abrió la consola de MariaDB.

-uroot indicó que queríamos entrar con el usuario root.

-p hizo que MariaDB nos pidiera la contraseña sin escribirla directamente dentro del comando.
resultado:
Enter password:                                                                                                         

obviamente docker nos pidió la conraseña así que la pusimos y entramos.
rootpass
resultado:
Welcome to the MariaDB monitor.  Commands end with ; or \g.                                                             
Your MariaDB connection id is 3                                                                                         
Server version: 12.3.3-MariaDB-ubu2404 mariadb.org binary distribution                                                  
en blanco
Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.                                                    
en blanco
Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.                                          
MariaDB [(none)]>                                                                                                       

Después usamos:

USE oferta_gastronomica;

Resultado:
Reading table information for completion of table and column names                                                      
You can turn off this feature to get a quicker startup with -A                                                          
en blanco
Database changed                                                                                                        
MariaDB [oferta_gastronomica]>                                                                                          
Después para comprobar que los registros  sigan ahí hicimos:

SELECT COUNT(*)
FROM temporal;

Resultado:
+----------+                                                                                                            
| count(*) |                                                                                                            
+----------+                                                                                                            
|     2823 |                                                                                                            
+----------+                                                                                                            
1 row in set (0.002 sec)                                                                                                
MariaDB [oferta_gastronomica]>                                                                                          
Ovbiamente lo que esperábamos volver a encontrar era:

2823

porque esa era la cantidad de registros que ya habíamos comprobado antes.
Como estaba todo bien seguimosasí que salimos:

EXIT;

Después volvimos a comprobar qué volumen estaba conectado al contenedor:

docker inspect mariadb_establecimientos_gastronomicos --format "{{range .Mounts}}{{.Type}} {{.Name}} -> {{.Destination}}{{end}}"

Resultado:
volume mariadb_establecimientos_data -> /var/lib/mysql                                                                  
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>                                                                                                               
explicación.
docker inspect mostró la información interna del contenedor.

--format nos permitió elegir solamente la parte de esa información que queríamos mostrar.

{{range .Mounts}} recorrió los puntos de montaje del contenedor.

{{.Type}} mostró si era un volumen u otro tipo de montaje.

{{.Name}} mostró el nombre del volumen.

{{.Destination}} mostró en qué lugar del contenedor estaba conectado.

Lo que esperábamos volver a encontrar era:

volume mariadb_establecimientos_data -> /var/lib/mysql

Con esas dos comprobaciones podíamos saber que el contenedor creado con Compose estaba leyendo el mismo volumen que habíamos usado antes.
Como todo estaba así seguimos.
27.

Guardar la configuración de Docker Compose en GitHub.

Después de comprobar que Compose funcionaba bien y que la base seguía estando ahí, guardamos lo que pudimos hacer hasta ahí en el repositorio.
Para eso hicimos:

git status

Resultado:
On branch main                                                                                                          
Your branch is up to date with 'origin/main'.                                                                           
Changes not staged for commit:                                                                                          
  (use "git add <file>..." to update what will be committed)                                                            
  (use "git restore <file>..." to discard changes in working directory)                                                 
        modified:   compose.yaml                                                                                        
Untracked files:                                                                                                        
  (use "git add <file>..." to include in what will be committed)                                                        
        .env.example                                                                                                    
        .gitignore                                                                                                      
no changes added to commit (use "git add" and/or "git commit -a")                                                       
PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>
explicacion
git status mostró qué archivos habían cambiado y cuáles todavía no estaban preparados para un commit.

Después agregamos:

git add compose.yaml .gitignore .env.example proceso.md

git add preparó esos archivos para el próximo commit.

No agregamos .env porque justamente queríamos que ese archivo quedara solamente en nuestra computadora.

Volvimos a comprobar:

git status

Resultado:
On branch main                                                                                                          
Your branch is up to date with 'origin/main'.                                                                           
Changes to be committed:                                                                                                
  (use "git restore --staged <file>..." to unstage)                                                                     
        new file:   .env.example                                                                                        
        new file:   .gitignore                                                                                          
        modified:   compose.yaml                                                                                        
        modified:   proceso.md                                                                                        

PS H:\Mi unidad\escuela comercio\2026\materias\Bases de datos II\oferta_establecimientos_gastronomicos\repositorio\Trabajo-Final>
