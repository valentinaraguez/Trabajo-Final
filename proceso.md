Introducción.
Para este trabajo final de Bases de Datos II, los profesores decidieron hacerlo en grupo. Este quedó conformado por Martín Ortiz y Valentín Aragues.
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
--local ... hizo que la herramienta leyera el archivo indicado.
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
Como el trabajo lo hacemos entre los dos, nos dimos cuenta de que necesitábamos una forma de guardar también la configuración de MariaDB que estábamos usando para que el otro pudiera crear un entorno parecido en su computadora.
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