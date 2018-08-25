#######
# Titulo: Taller de Programacion #1
# Author: Adrian Lucardi
# Creado: 16-08-2018
# Ultima modificacion: 16-08-2018
# Proposito: Breve introduccion a R. Manipulacion de datos
#######

# Bienvenido! R es un paquete estadistico que te permite realizar todo tipo de operaciones, desde calculos aritmeticos basicos hasta tareas mas complejas, como calcular estadisticas descriptivas (media, mediana, desvio estandar, cuartiles), descargar y manipular datos desde la web, correr modelos de regresion y visualizar los resultados en tablas, figuras y/o mapas que puedes abrir en otras aplicaciones.

# Para empezar, nota que el texto que escribas en R puede ser de dos tipos. El texto que esta precedido de signo de numeral ("#"), como esta linea y las anteriores, es interpretado como texto. Eso implica que R no lo toma como codigo y no trata de "correrlo". Dicha funcionalidad es muy util para incluir instrucciones, (auto-)recordar para que escribiste una linea de codigo, etc. En cambio, el texto que NO esta precedido por el signo de numeral es interpretado como codigo. Por ejemplo, si quieres usar R para sumar dos mas dos, puedes escribir:

2 + 2

# (fijate que cuando presionas "Return", R te devuelve el valor de 4)

# R admite multiples operaciones aritmeticas:
2*2 # multiplicacion
2/2 # division
2 * 2 # (los espacios no cuentan)
22.5 * 4 + 37 # comparar con:
22.5 * (4 + 37)
4^3
3^2 + 4^2
(3^2 + 4^2) - 5^2 # teorema de Pitagoras

# Una caracteristica importante de R es que esta basado en la logica de la Programacion Orientada a Objetos (en ingles, Object-Oriented Programming). Es decir, las operaciones en R se basan en la creacion y/o manipulacion de "objetos". Un "objeto" puede ser muchas cosas: un numero, una formula, una base de datos, una variable, un modelo estadistico, un mapa, una figura, una linea de texto, etc:
a <- 5

# presta atencion a la expresion "<-", porque la estaremos usando todo el tiempo. En R, la usamos para "definir" un determinado objeto; en el ejemplo anterior, lo que hicimos fue definir al objeto "a" como el numero 5:
a

# obviamente, podemos redefinirlo, pero eso "borra" la informacion anterior:
a <- 3.8257
a

# tambien podemos definir a un objeto como el resultado de una operacion matematica:
b <- 53/6
b
c <- 3.84 * (-1)
c

# ... o como la combinacion de multiples objetos:
a1 <- b + c
a2 <- b/c
a3 <- b*c

a1; a2; a3

# un objeto puede, estar conformado por la combinacion de multiples objetos. Por ejemplo, podemos tomar los tres objetos creados arriba para construir un VECTOR de tres valores:
vect <- c (a1, a2, a3) # la expresion c() indica que vamos a crear un vector
vect


## Funciones

# Podemos usar funciones para hacer operaciones con multiples objetos. Para indicarle a R que queremos usar una funcion, debemos escribir el nombre de la funcion seguido de parentesis; lo que aparece entre parentesis son los ARGUMENTOS de la funcion, i.e. a que objeto la queremos aplicar, si queremos fijar el valor de determinados parametros, etc

# Por ejemplo, supongamos que queremos calcular la MEDIA del vector que recien creamos:
mean (vect)

# o la mediana:
median (vect)

# o el maximo o el minimo:
max (vect)
min (vect)

# con la funcion summary() podemos obtener varios valores simultaneamente:
summary (vect)

# y por supuesto, podemos crear un objeto que sea el resultado de una funcion; por ejemplo, un objeto que sea el promedio de la funcion que recien definimos:
mean_vect <- mean (vect)
mean_vect # compara con
mean (vect)


##### (1) Importando datos

# Si en R un objeto puede ser (casi) cualquier cosa, entonces tambien puede ser el vinculo a una carpeta o un archivo! O tambien, el NOMBRE de un archivo. Por ejemplo, los nombres de los archivos con los que vamos a trabajar en esta tarea:
nombre1 <- "Regimes and the economy 1947-2010.dta"
nombre2 <- "Regimes and the economy (Brazil) 1947-2010.dta"
nombre3 <- "Regimes and the economy 1968.dta"

# Nota el uso de las comillas ("). En R, las expresiones entrecomilladas indican que un fragmento de texto debe ser interpretado como texto, i.e. no puedes hacer ninguna operacion matematica con el (aunque si es posible hacer operaciones con el texto, como seleccionar determinados caracteres, mover todos los caracteres a mayusculas o minusculas, encontrar palabras que incluyan ciertos caracteres, etc)

# Por ahora, solo tenemos el nombre del archivo:
nombre1

# El siguiente paso es decirle a R que importe un archivo con ese nombre que se encuentra en determinado directorio. Por eso primero indicamos el "working directory"
setwd ("/Users/adrianlucardi/Documents/Teaching/ITAM/2018-C Fall Semester/Metodologia Politica Avanzada/Tareas/Tarea 01/") ## setwd () le dice a R que, a menos que le indiquemos lo contrario, cada vez que busque un archivo lo busque en ese directorio (es posible especificar subdirectorios). Este es el vinculo a la carpeta donde se encuentra el archivo en cuestion en MI computadora. Deberas actualizarlo para la computadora en la que estas trabajando

# Fijate que el nombre del archivo termina con ".dta", lo que indica que es un archivo de Stata. Para importarlo usamos la funcion 
data <- read.dta13 (nombre1)

# aparece un mensaje de error ("Error in read.dta13(nombre1) : could not find function "read.dta13""). Como buena parte de las funciones de R, "read.dta13" NO viene en la version original de R, sino que forma parte de un "paquete" llamado "readstata13" que tienes que instalar antes:

install.packages ("readstata13")

# nota que a los paquetes solo los tienes que instalar una vez; cuando ya lo has hecho, simplemente los "llamas" con la funcion library():
library (readstata13)

# ahora si, puedes importar la base:
data <- read.dta13 (nombre1)  ## este codigo merece un par de comentarios. Lo que estas haciendo es crear un objeto que se llama "data", que resulta de importar una base de datos de Stata cuyo nombre es
nombre1 ## "Regimes and the economy 1947-2010.dta"

# el siguiente paso es importar las otras dos bases. Nota que tienes que darle otros nombres, porque sino R va a sobreescribirlas sobre la base anterior. Eso es un dato importante: a diferencia de Stata, que no te permite sobreescribir si no lo indicas explicitamente, en R puedes sobreescribir (incluso por error) en cualquier momento

# importamos las otras dos bases de datos:
dataBrazil <- read.dta13 (nombre2)
data68 <- read.dta13 (nombre3)


# En suma, has importado tres objetos, llamados "data", "dataBrazil" y "data68". En terminos de R, se trata de objetos de clase "data.frame", es decir, bases de datos:
class (data)
is.data.frame (data)

# puedes hacer lo mismo con los otros dos:
class (dataBrazil); class (data68)
is.data.frame (dataBrazil); is.data.frame (data68)

# Un data.frame consiste de una combinacion de r filas y k columnas. Cada fila es una OBSERVACION, y cada columna corresponde a una VARIABLE. Es decir, cada observacion puede tomar un valor distinto en cada variable.

# para averiguar el numero de filas y columnas de nuestra data.frame:
dim (data)  # es decir, 7848 filas y 13 columnas; recuerda, en R las filas siempre vienen primero que las columnas
dim (dataBrazil)
dim (data68)

# si solo quieres averiguar el numero de filas o columnas, puedes probar con nrow() o ncol(), respectivamente:
nrow (data68)
ncol (data68)

# cada vez que importo una base de datos, lo primero que hago es usar dim() para darme una idea de cuantas observaciones tengo (y descubrir potenciales errores); lo segundo es usar la funcion summary(), que brinda estadisticas descriptivas para cada una de las variables, y me permite darme una idea de (i) los nombres de las variables; (ii) de que tipo son; y (iii) el rango de valores que toman las mismas:
summary (data)

## Esto nos proporciona alguna informacion reveladora sobre la estructura y el contenido de nuestro data.frame:
# los nombres de las columnas te pueden dar una idea del contenido de cada variable (algunas probablemente no; ignoralas)
# para cada variable, puedes ver un poco sobre su distribucion. Por ejemplo, considera la varaible "country": resulta claro que para cada pais tienes 64 observaciones, i.e. un mismo pais aparece hasta 64 veces en la base de datos

# puedes usar las funcioned head() y tail() para analizar los primeros y ultimas observaciones de tu data.frame:
head (data) # los 6 primeros, correspondientes a Afghanistan
head (data, 15) # los 15 primeros
tail (data) # los 6 ultimos
tail (data, 23) # los 23 ultimos

## con esto ya tienes los elementos para responder las pregutnas de la seccion 1!





##### (2) Estadisticas descriptivas

## (2.1)

# con summary() puedes obtener estadisticas descriptivas para TODAS las variables de un data.frame. Eso puede ser problematico si tienes demasiadas variables. Ademas, a ti solo te interesa obtener el promedio. Por ello, en lugar de
summary (data68)

# puedes usar mean() y decirle a R que variable te interesa:
mean (data68$gdpHead) ## observa el codigo aqui. mean() claramente indica que estas interesado en la media. Pero no puedes escribir simplemente
mean (gdpHead)

# porque no existe ningun objeto llamado "gdpHead". gdpHead es mas bien un sub-objeto de otro objeto, en este caso tu base de datos data68. Por eso usas el signo de dolar:
mean (data68$gdpHead)

# lo mismo si queres calcular la media, la mediana o el desvio estandar de otras variables:
mean (data68$democracy)
median (data68$growth)
sd (data68$growth)

# y recuerda, puedes guardar los valores que te interesen como objetos:
mean.gdp <- mean (data68$gdpHead)
mean.gdp

# y hacer operaciones matematicas con ellos:
mean.gdp*1000
log (mean.gdp)  ## logaritmo natural

# con log (mean.gdp) calculaste el logaritmo del valor promedio de la variable gdpHead. Pero que si queires calcular el logaritmo para cada observacion, y "agregarlo" como una nueva variable a tu base? Muy sencillo:
data68$gdpHead_log <- log (data68$gdpHead)  ## es decir, defines a una nueva variable gdpHead_log, como el logaritmo natural de otra. Y aparece en la base:
summary (data68)







## (2.6)

# para responder esta pregunta, recuerda que R trata a (casi) todo como un objeto. Tu vector "vect" y tu data.frame "data" son objetos, pero tambien lo son cada uno de los elementos del mismo. Es decir, si tienes un vector con 3 elementos, puedes extraer simplemente el primer elemento, el segundo, el tercero, o cualesquira dos. Para eso usamos los corchetes []:
vect
vect[1] # para extraer el primer elemento del vector
vect[c(1,3)]  # para extraer el primero y el tercero, pero no el segundo
mean (vect); mean (vect[c(1,3)])  # (las medias son claramente diferentes)

# lo mismo puedes hacer con un data.frame, solo que como se trata de un objeto bidimensional en lugar de unidimensional, debes indicar DOS valores, separados por una coma:
data68[1,]  # para obtener unicamente la primera fila, correspondiente a Afghanistan
data68[2,]  # la segunda fila: Albania
data68[,2]  # la segunda COLUMNA: el anio
data68[5,1] # el nombre del 5to pais incluido en la base: Australia
data68[21:40,1:4] # los valores de las primeras 4 variables para los paises ubicados en los lugares 21 1 40

# en el ejemplo anterior, le indicamos a R que valores queriamos observar, pero simplemente indicando filas y/o columnas. Eso funciona bien cuando conocemos el order de las observaciones de nuestro data.frame, pero que hay si no es el caso? O si queremos estraer los datos de un equipo sin conocer su posicion? Por ejemplo, no sabemos en que fila esta Mexico; pero sabemos el nombre del pais, asi que podemos hacer lo siguiente:
data68[data68$country=="Mexico",] ## Mexico en el anio 1968
data68[data68$region=="Latin America",] ## todos los paises de America Latina en el anio 1968; nota que cambiamos "country" por "region"

# alternativamente, podemos emplear condiciones logicas; por ejemplo, para lista a todos los paises que eran autocracias en 1968:
data68[data68$autocracy==1,]  ## nota el uso de "==" en lugar de "="

# o todos los paises con crecimiento NEGATIVO (i.e., donde la economis se contrajo durante ese anio):
data68[data68$growth<0,]  ## relativamente pocos, como puedes ver

# tambien podemos elegir los paises que crecieron "a tasas chinas", a mas del 9% anual digamos:
data68[data68$growth>0.09,]

# como podemos ver, 3 de esos paises (Israel, Japon y el Libano) eran democracias, el resto autocracias. Pero podemos calcularlo automaticamente:
sum (data68[data68$growth>0.09,]$democracy) ## nota lo que hicimos: sum() nos suma los valores; en este caso, de la variable "democracy", que esta incluida en la data.frame "base68"; pero no nos interesan todas las observaciones de dicha base de datos, sino solo un subconjunto: aquellos que experimentaron una tasa de crecimiento en el anio 1968 de 0.09 anual, o mayor. Si contamos el numero de democracias entre paises que tuvieron contraccion economica, en cambio:
sum (data68[data68$growth<0,]$democracy)  ## son 4

# con lo anterior, ya puedes responder la pregunta (2.6): para calcular el promedio de ingreso per capita en las democracias tenemos
mean (data68[data68$democracy==1,]$gdpHead)




##### (3) Estadisticas descriptivas: Visualizacion

# para hacer graficos en R, vamos a usar el paquete ggplot2, que te permite hacer graficos elegantes con (relativa) facilidad. Para aprender a usarlo, te recomiendo el siguiente sitio:
# https://ggplot2.tidyverse.org/reference/

# pero antes, tenemos que instalarlo:
install.packages ("ggplot2")  ## recuerda, solo tienes que hacer eso una vez

# luego lo llamamos con library()
library (ggplot2)


## (3.1)

# para hacer un grafico de densidad basico, que llamaremos plot3.1 (por el ID de la pregunta), escribimos:
(plot3.1 <- ggplot (data68               ## data68 es el data.frame que usamos
                    , aes (x=gdpHead))   ## aes() es para indicar las "esteticaS" del grafico; en este caso, le indicamos que la variable que queremos plotear en el eje x es gdpHead
  + geom_density ()                       ## el tipo de "geometria" que queremos plotear; en este caso, se trata de un plot de densidad
  )

# si en vez de un plot de densidad quisieras un histograma, podrias probar con
(plot3.1b <- ggplot (data68
                    , aes (x=gdpHead))
  + geom_histogram ()
  ) ## fijate que lo unico que cambia es (i) el nombre del grafico; y (ii) el uso de geom_histogram()

# R nos recomienda Pick better value with `binwidth`. Lo podemos hacer con
(plot3.1c <- ggplot (data68
                     , aes (x=gdpHead))
  + geom_histogram (bins=20)
  ) ## fijate que especificamos manualmente el numero de bins

# volviendo al grafico original, recuerda que tienes que agregar dos lineas verticales correspondientes a la media y la mediana:
(plot3.1 <- ggplot (data68
                     , aes (x=gdpHead))
  + geom_density ()
  + geom_vline (xintercept=mean (data68$gdpHead))
  )

# para agregar color, simplemente
(plot3.1 <- ggplot (data68
                    , aes (x=gdpHead))
  + geom_density ()
  + geom_vline (xintercept=mean (data68$gdpHead), color="red"))  ## puedes probar con otros colores; la lista esta aqui: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

# y ahora el grafico completo, con la densidad en color y las DOS lineas:
(plot3.1 <- ggplot (data68
                    , aes (x=gdpHead))
  + geom_density (fill="khaki")
  + geom_vline (xintercept=mean (data68$gdpHead), color="red")
  + geom_vline (xintercept=median (data68$gdpHead), color="blue")
  )



## (3.4) Para hacer un scatterplot, la idea general es similar, pero algunas cosas cambian:
(plot3.4 <- ggplot (data68
                    , aes (x=gdpHead_lag, y=gdpHead))
  + geom_point (color="lightcoral"))
## Fijate los cambios que introducimos: antes teniamos solo aes (x=gdpHead), ahora tenemos x=... e y=..., porque el grafico tiene dos dimensiones, no solo una. Y en lugar de geom_density() usamos geom_point(), porque estamos ploteando puntos. (Tambien cambiamos el color de los puntos a "lightcoral", porque el negro es feo)

# para agregar la linea de 45 grados, simplemente:
(plot3.4b <- ggplot (data68
                    , aes (x=gdpHead_lag, y=gdpHead))
  + geom_abline ()  ## el predeterminado: una linea de 45 grados
  + geom_point (color="lightcoral")
  )



