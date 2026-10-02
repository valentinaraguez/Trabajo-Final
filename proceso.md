Introducción.



Para este trabajo final de Bases de Datos II, los profesores decidieron hacerlo en grupo. Este quedó conformado por Martín Ortiz y Valentín Aragues.



Una vez que nos pusimos de acuerdo de cómo avanzar, empezamos así.



1\. Elegir el csv con el que quisimos trabajar.

Cuando nos pusimos a ver los diferentes csv que había en las páginas que nos dieron los profes Ariel y Matías, elegimos oferta\_gastronomica.csv.

Como dice el nombre, tenía la información de los establecimientos gastronómicos de la ciudad de Buenos Aires.

La página contaba sobre sus campos. Por ejemplo longitud, latitud, identificador, nombre, categoría, cocina, ambientación, teléfono, mail, horario, dirección, barrio, comuna y códigos postales.

Después abrimos nosotros el csv primero en excel, para ver cómo estaba armado realmente.

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

calle\_nombre

calle\_altura

calle\_cruce

direccion\_completa

barrio

comuna

codigo\_postal

codigo\_postal\_argentino

```



EL profesor Matías nos había explicado que csv significada que el archivo eran datos separados por coma o punto y coma, así que lo abrimos en el blog de notas para ver como estaba el que elegimos nosotros.

En este caso estaban separados por punto y coma.



La primera línea empezaba así:



```text

long;lat;id;nombre;categoria;cocina;ambientacion;telefono...





2\. Decidir cómo íbamos a trabajar entre los dos.

Después de elegir el csv, pensamos cómo nos íbamos a organizar para trabajar.

Como el trabajo final tenía que estar en GitHub, decidimos usar un repositorio público para guardar los archivos del proyecto y también para que quede registrado cómo fue avanzando todo.

La idea que tuvimos fue que cada uno tenga su propia base de datos MariaDB dentro de Docker en su computadora, y que los dos bayamos trabajando en el repositorio de GitHub.

De esa forma, si uno de los dos hacía una consulta, creaba una tabla o modificaba algún archivo del proyecto, guardaba ese cambio en el repositorio y el otro después iva a poder descargarlo y hacer lo mismo en su propia base.

También decidimos no guardar solamente el resultado final. A medida que fuéramos avanzábamos decidimos guardar las consultas SQL que  usamos, las explicaciones de lo que fuimos haciendo y los cambios importantes del proyecto.

Para eso pensamos organizar el repositorio de una manera que nos sirva para eso, con algunos archivos y carpetas,y nos quedó mas o menos así:

README.md: Este sería el archivo donde quedaría la explicación principal del proyecto. Ahí vamos contando qué base hicimos, qué datos usamos, cómo está organizada y demás.

proceso.md: Este sería el archivo donde vamos escribiendo lo que fuimos haciendo paso a paso, como lo estamos contando en este trabajo.

compose.yaml: Este sería el archivo donde quedaría guardada la configuración que vamos a usar para trabajar con MariaDB dentro de Docker.

datos/: Esta sería la carpeta donde guardaríamos el archivo csv con el que elegimos trabajar.

sql/: Esta sería la carpeta donde vamos guardando las consultas y demás sentencias SQL que vayamos usando a medida que avancemos.

diagrama/: Esta sería la carpeta donde más adelante guardaríamos el diagrama de la base de datos.

3\. 

Crear y organizar el repositorio.

Después de decidir cómo nos íbamos a organizar, Valentín creó el repositorio público en GitHub e invitó a Martín para que los dos podamos trabajar en el mismo proyecto.

Martín descargó el repositorio en su computadora usando:

git clone https://github.com/valentinaraguez/Trabajo-Final

resultado:

Cloning into 'Trabajo-Final'...                                                                                         

remote: Enumerating objects: 3, done.                                                                                   

remote: Counting objects: 100% (3/3), done.                                                                             

remote: Compressing objects: 100% (2/2), done.                                                                          

remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)                                                   

Receiving objects: 100% (3/3), done.                                                                                    

PS H:\\Mi unidad\\escuela comercio\\2026\\materias\\Bases de datos II\\oferta\_establecimientos\_gastronomicos\\repositorio>     



También creamos las carpetas y archivos que habíamos pensado para ordenar el proyecto.

Primero creamos las carpetas:

New-Item -ItemType Directory -Force datos, sql, diagrama

Después creamos el archivo proceso.md:

New-Item -ItemType File -Force proceso.md

Creamos también el archivo compose.yaml:

New-Item -ItemType File -Force compose.yaml

El repositorio ya tenía su README.md, así que no tuvimos que volver a crearlo.

Aprendiendo de github, entendimos que no guarda carpetas vacías, así que pusimos un archivo vacío llamado .gitkeep dentro de sql y diagrama para que esas carpetas también puedan quedar guardadas en el repositorio:

New-Item -ItemType File -Force sql\\.gitkeep

New-Item -ItemType File -Force diagrama\\.gitkeep

Después copiamos el archivo oferta\_gastronomica.csv dentro de la carpeta datos.

Desde la carpeta del repositorio usamos:

Copy-Item "..\\..\\oferta\_gastronomica.csv" ".\\datos\\oferta\_gastronomica.csv"

Con eso la estructura inicial nos quedó más o menos así:

README.md

proceso.md

compose.yaml



datos/

&#x20;   oferta\_gastronomica.csv



sql/

&#x20;   .gitkeep



diagrama/

&#x20;   .gitkeep

README.md: Este sería el archivo donde quedaría la explicación principal del proyecto. Ahí vamos contando qué base hicimos, qué datos usamos, cómo está organizada y demás.

proceso.md: Este sería el archivo donde vamos escribiendo lo que fuimos haciendo paso a paso, como lo estamos contando en este trabajo.

compose.yaml: Este sería el archivo donde quedaría guardada la configuración que vamos a usar para trabajar con MariaDB dentro de Docker.

datos/: Esta sería la carpeta donde guardaríamos el archivo csv con el que elegimos trabajar.

sql/: Esta sería la carpeta donde vamos guardando las consultas y demás sentencias SQL que vayamos usando a medida que avancemos.

diagrama/: Esta sería la carpeta donde más adelante guardaríamos el diagrama de la base de datos.

Después comprobamos qué archivos nuevos había detectado Git:

git status

resultado:

On branch main                                                                                                          

Your branch is up to date with 'origin/main'.                                                                           

en blanco

Untracked files:                                                                                                        

&#x20; (use "git add <file>..." to include in what will be committed)                                                        

&#x20;       compose.yaml                                                                                                    

&#x20;       datos/                                                                                                          

&#x20;       diagrama/                                                                                                       

&#x20;       proceso.md                                                                                                      

&#x20;       sql/                                                                                                            

en blanco

nothing added to commit but untracked files present (use "git add" to track)                                            

PS H:\\Mi unidad\\escuela comercio\\2026\\materias\\Bases de datos II\\oferta\_establecimientos\_gastronomicos\\repositorio\\Traba

Pusimos la documentación hasta este momento en proceso.md

Agregamos esos archivos al próximo cambio que íbamos a guardar:

git add .

Volvimos a comprobar:

git status

resultado:

On branch main                                                                                                          

Your branch is up to date with 'origin/main'.                                                                           

en blanco

Changes to be committed:                                                                                                

&#x20; (use "git restore --staged <file>..." to unstage)                                                                     

&#x20;       new file:   compose.yaml                                                                                        

&#x20;       new file:   datos/oferta\_gastronomica.csv                                                                       

&#x20;       new file:   diagrama/.gitkeep                                                                                   

&#x20;       new file:   proceso.md                                                                                          

&#x20;       new file:   sql/.gitkeep                                                                                        

en blanco



Después guardamos esta primera parte del trabajo con un commit:

git commit -m "crear las carpetas y archivos del proyecto"

resultado:

\[main 4e2ba89] crear las carpetas y archivos del proyecto                                                               

&#x20;5 files changed, 2824 insertions(+)                                                                                    

&#x20;create mode 100644 compose.yaml                                                                                        

&#x20;create mode 100644 datos/oferta\_gastronomica.csv                                                                       

&#x20;create mode 100644 diagrama/.gitkeep                                                                                   

&#x20;create mode 100644 proceso.md                                                                                          

&#x20;create mode 100644 sql/.gitkeep                                                                                        

PS H:\\Mi unidad\\escuela comercio\\2026\\materias\\Bases de datos II\\oferta\_establecimientos\_gastronomicos\\repositorio\\Traba





Y finalmente subimos los cambios al repositorio de GitHub:

git push

Enumerating objects: 7, done.                                                                                           

Counting objects: 100% (7/7), done.                                                                                     

Delta compression using up to 4 threads                                                                                 

Compressing objects: 100% (4/4), done.                                                                                  

Writing objects: 100% (6/6), 135.85 KiB | 3.31 MiB/s, done.                                                             

Total 6 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)                                                           

To https://github.com/valentinaraguez/Trabajo-Final                                                                     

&#x20;  7e31bdc..4e2ba89  main -> main                                                                                       

PS H:\\Mi unidad\\escuela comercio\\2026\\materias\\Bases de datos II\\oferta\_establecimientos\_gastronomicos\\repositorio\\Traba

De esta forma ya teníamos el repositorio organizado y GitHub empezaba a guardar cómo iba avanzando nuestro trabajo.



