dw-2024-parcial-1
================
Tepi
25/09/2024

# Examen parcial

Indicaciones generales:

- Usted tiene el período de la clase para resolver el examen parcial.

- La entrega del parcial, al igual que las tareas, es por medio de su
  cuenta de github, pegando el link en el portal de MiU.

- Pueden hacer uso del material del curso e internet (stackoverflow,
  etc.). Sin embargo, si encontramos algún indicio de copia, se anulará
  el exámen para los estudiantes involucrados. Por lo tanto, aconsejamos
  no compartir las agregaciones que generen.

## Sección 0: Preguntas de temas vistos en clase (20pts)

- Responda las siguientes preguntas de temas que fueron tocados en
  clase.

1.  ¿Qué es una ufunc y por qué debemos de utilizarlas cuando
    programamos trabajando datos?

- Una ufunc es una función universal que esta diseñada para manejar de
  manera eficiente grandes volúmnes y arreglos de datos o ya sea dtf,
  estas no solo ayudan con el soporte de varias operaciones que se estén
  trabajando si no que también con eficiencia en memoria y paralelismo
  mejorando el rendomiento de uso de funciones en bases de datos que se
  trabajen localmente en el CPU.

2.  Es una técnica en programación numérica que amplía los objetos que
    son de menor dimensión para que sean compatibles con los de mayor
    dimensión. Describa cuál es la técnica y de un breve ejemplo en R.

- El broadcasting maneja la compatibilidad dimensional entre objetos de
  diferentes tamaños o dimensiones extendiendo automáticamente los datos
  más pequeños para que coincidan con los datos más grandes.

``` r
matriz <- matrix(1:9, nrow = 3, byrow = TRUE)
vector <- c(1, 2, 3)
resultado <- matriz + vector

print(resultado)
```

    ##      [,1] [,2] [,3]
    ## [1,]    2    3    4
    ## [2,]    6    7    8
    ## [3,]   10   11   12

3.  ¿Qué es el axioma de elegibilidad y por qué es útil al momento de
    hacer análisis de datos?

- El axioma de elegibilidad establece que, al analizar varios conjuntos
  se escoge uno en base a criterios establecidos para ser considerada
  como elegible. Es útil ya que ayuda con la filtración de datos al
  definir criterios específicos, Optimiza la toma de decisiones dentro
  de una empresa ej: al momento de querer hacer un análisis de los
  eventos de una página de una base de datos al querer por ejemplo
  maximizar o minimizar eventos por usuario en cieras áreas se les
  facilitará la toma de desiciones en base a la elección de alternativas
  por filtración de datos.

4.  Cuál es la relación entre la granularidad y la agregación de datos?
    Mencione un breve ejemplo. Luego, exploque cuál es la granularidad o
    agregación requerida para poder generar un reporte como el
    siguiente:

| Pais | Usuarios |
|------|----------|
| US   | 1,934    |
| UK   | 2,133    |
| DE   | 1,234    |
| FR   | 4,332    |
| ROW  | 943      |

- La relación entre granularidad y la agregación de datos es la
  combinación de la búsqueda en mayor fidelidad en la recolección de
  datos, es decir, que tan finos o específicos sean estos mientras que
  la agregación se encarga de tomar específicamente estos datos de mayor
  granularidad y que se obtengan mejores resúmenes o análisis basados en
  la data trabajada.

- La granularidad requerida para el el reporte es una más baja ya que se
  quiere trabajar con un grán volúmen de datos y el objeto de estudio
  cuenta con varias características como para incluirlas en el conteo de
  Usuarios por país

## Sección I: Preguntas teóricas. (50pts)

- Existen 10 preguntas directas en este Rmarkdown, de las cuales usted
  deberá responder 5. Las 5 a responder estarán determinadas por un
  muestreo aleatorio basado en su número de carné.

- Ingrese su número de carné en `set.seed(20210580)` y corra el chunk de
  R para determinar cuáles preguntas debe responder.

``` r
set.seed("20210580") 
v<- 1:10
preguntas <-sort(sample(v, size = 5, replace = FALSE ))


paste0("Mis preguntas a resolver son: ",paste0(preguntas,collapse = ", "))
```

    ## [1] "Mis preguntas a resolver son: 1, 2, 4, 5, 8"

### Listado de preguntas teóricas

1.  Para las siguientes sentencias de `base R`, liste su contraparte de
    `dplyr`:
    - `str()`

    - `df[,c("a","b")]`

    - `names(df)[4] <- "new_name"` donde la posición 4 corresponde a la
      variable `old_name`

    - `df[df$variable == "valor",]`

    - Con su uso de pipes (%\>%)

    - GLIMPSE()

    - SELECT()

    - RENAME()

    - FILTER()
2.  Al momento de filtrar en SQL, ¿cuál keyword cumple las mismas
    funciones que el keyword `OR` para filtrar uno o más elementos una
    misma columna?

- IN

4.  ¿Cuál es la diferencia entre utilizar `==` y `=` en R?

- (Compaaración == ) (Asignación = )

5.  ¿Cuál es la forma correcta de cargar un archivo de texto donde el
    delimitador es `:`?

- Usando Read.table() o read_delim()

``` r
# Cargar el archivo usando read.delim() con sep = ":"
#datos <- read.delim("archivo.txt", sep = ":", header = TRUE)
```

8.  Si en un dataframe, a una variable de tipo `factor` le agrego un
    nuevo elemento que *no se encuentra en los niveles existentes*,
    ¿cuál sería el resultado esperado y por qué?
    - El nuevo elemento
    - `NA`

- Sera ‘NA’ porque los factores en R solo toman valkores dentro de los
  niveles existentes.

Extra: ¿Cuántos posibles exámenes de 5 preguntas se pueden realizar
utilizando como banco las diez acá presentadas? (responder con código de
R.)

``` r
n <- 10
k <- 5
total_examenes <- choose(n, k)
total_examenes
```

    ## [1] 252

## Sección II Preguntas prácticas. (30pts)

- Conteste las siguientes preguntas utilizando sus conocimientos de R.
  Adjunte el código que utilizó para llegar a sus conclusiones en un
  chunk del markdown.

A. De los clientes que están en más de un país,¿cuál cree que es el más
rentable y por qué?

- De los clientes que están en más de un país el cliente más rentable es
  el cliente a17a7558 porque tiene la mayor venta total entre todos.
  primero identificar clientes que están en más de un país, luego
  calcular la venta total de esos clientes en todos los países y por
  último se ordenó los clientes por venta total en orden descendente y
  este es el que tiene el primer puesto.

B. Estrategia de negocio ha decidido que ya no operará en aquellos
territorios cuyas pérdidas sean “considerables”. Bajo su criterio,
¿cuáles son estos territorios y por qué ya no debemos operar ahí?

- En cuanto a rentabilidad en base a la tabla obtenida los territorios
  que generan mayores pérdidas para no seguir operando ahi se filtraron
  territorios que tienen baja venta por unidad y bajo volumen total de
  ventas. Los territorios mostrados en la tabla son los que la empresa
  puede considerar abandonar o dejar de operar, ya que generan bajos
  ingresos tanto en términos de rendimiento por unidad como en volumen
  total de ventas, lo que los convierte en territorios con pérdidas
  considerables bajo este criterio.

### I. Preguntas teóricas

## A

``` r
library("dplyr")
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
df <- readRDS("/Users/georgealbadr/Documents/GitHub/Data-Wrangling/ParcialDataWrangling2024/parcial_anonimo.rds")

head(df)
```

    ##         DATE Codigo Material Descripcion     Pais Distribuidor Territorio
    ## 1 2018-12-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 2 2018-11-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 3 2018-10-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 4 2018-09-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 5 2018-08-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 6 2018-07-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ##    Cliente    Marca Canal Venta Unidades plaza  Venta
    ## 1 9d6e1d65 61d7fbfc    7b48292e              2  26.50
    ## 2 9d6e1d65 61d7fbfc    7b48292e              0   0.00
    ## 3 9d6e1d65 61d7fbfc    7b48292e              3  39.75
    ## 4 9d6e1d65 61d7fbfc    7b48292e              3  39.75
    ## 5 9d6e1d65 61d7fbfc    7b48292e              8 106.00
    ## 6 9d6e1d65 61d7fbfc    7b48292e              3  39.75

``` r
clientes_varios_paises <- df %>%
  group_by(Cliente) %>%
  summarise(paises = n_distinct(Pais)) %>%
  filter(paises > 1)

venta_clientes <- df %>%
  filter(Cliente %in% clientes_varios_paises$Cliente) %>%
  group_by(Cliente) %>%
  summarise(venta_total = sum(Venta, na.rm = TRUE))


clientes_ordenados <- venta_clientes %>%
  arrange(desc(venta_total))


print(clientes_ordenados)
```

    ## # A tibble: 7 × 2
    ##   Cliente  venta_total
    ##   <chr>          <dbl>
    ## 1 a17a7558      19818.
    ## 2 ff122c3f      15359.
    ## 3 c53868a0      13813.
    ## 4 044118d4       9436.
    ## 5 f676043b       3635.
    ## 6 f2aab44e        400.
    ## 7 bf1e94e9          0

## B

``` r
# Cargar el paquete dplyr
library(dplyr)

# Verificar los primeros datos para asegurarnos de que las columnas sean correctas
head(df)
```

    ##         DATE Codigo Material Descripcion     Pais Distribuidor Territorio
    ## 1 2018-12-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 2 2018-11-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 3 2018-10-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 4 2018-09-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 5 2018-08-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ## 6 2018-07-01        637caff5    0cf3ec3d 4046ee34     9a47575c   69c1b705
    ##    Cliente    Marca Canal Venta Unidades plaza  Venta
    ## 1 9d6e1d65 61d7fbfc    7b48292e              2  26.50
    ## 2 9d6e1d65 61d7fbfc    7b48292e              0   0.00
    ## 3 9d6e1d65 61d7fbfc    7b48292e              3  39.75
    ## 4 9d6e1d65 61d7fbfc    7b48292e              3  39.75
    ## 5 9d6e1d65 61d7fbfc    7b48292e              8 106.00
    ## 6 9d6e1d65 61d7fbfc    7b48292e              3  39.75

``` r
# Paso 1: Agrupar por territorio y calcular la venta total y las unidades plaza totales
territorios_perdidas <- df %>%
  group_by(Territorio) %>%
  summarise(
    venta_total = sum(Venta, na.rm = TRUE),
    unidades_plaza_total = sum(`Unidades plaza`, na.rm = TRUE)
  )

# Paso 2: Calcular las pérdidas/ganancias por unidad de plaza
territorios_perdidas <- territorios_perdidas %>%
  mutate(perdida_por_unidad = venta_total / unidades_plaza_total)

# Paso 3: Ordenar los territorios por pérdida/ganancia por unidad de plaza
territorios_ordenados <- territorios_perdidas %>%
  arrange(perdida_por_unidad)

# Mostrar los territorios ordenados
print(territorios_ordenados)
```

    ## # A tibble: 104 × 4
    ##    Territorio venta_total unidades_plaza_total perdida_por_unidad
    ##    <chr>            <dbl>                <dbl>              <dbl>
    ##  1 13b223c9          49.9                   11               4.54
    ##  2 e6fd9da9          18.2                    4               4.54
    ##  3 e034e3c8         247.                    49               5.04
    ##  4 cf970512        6375.                  1166               5.47
    ##  5 67696f68       47176.                  7734               6.10
    ##  6 6c8335a4        3594.                   578               6.22
    ##  7 d02bf225        1315.                   202               6.51
    ##  8 0bfe69a0         384.                    58               6.63
    ##  9 5d43dd39        6479.                   976               6.64
    ## 10 1a9b2b4c        6437.                   939               6.86
    ## # ℹ 94 more rows
