Laboratorio \#1 George Albadr
================

## GitHub Documents

This is an R Markdown format used for publishing markdown documents to
GitHub. When you click the **Knit** button all R code chunks are run and
a markdown file (.md) suitable for publishing to GitHub is generated.

## Including Code

You can include R code in the document as follows:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Including Plots

You can also embed plots, for example:

![](Lab1_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.

``` r
modificar <-  function(archives){
  data = read_excel(archives)
  data = select(data, COD_VIAJE, CLIENTE, UBICACION, CANTIDAD, PILOTO, Q, CREDITO, UNIDAD)
  mes = substr(archives, 3, 4)
  ano = substr(archives, 6, 9)
  data$Fecha = paste0(mes, "-", ano)
  return(data)
}
ruta = 'Lab1'
lista = list.files(pattern = "\\.xlsx", full.names = TRUE)
print(lista)
```

    ##  [1] "./01-2023.xlsx" "./02-2023.xlsx" "./03-2023.xlsx" "./04-2023.xlsx"
    ##  [5] "./05-2023.xlsx" "./06-2023.xlsx" "./07-2023.xlsx" "./08-2023.xlsx"
    ##  [9] "./09-2023.xlsx" "./10-2023.xlsx" "./11-2023.xlsx"

``` r
listadf=lapply(lista, modificar)
```

    ## New names:
    ## • `` -> `...10`

``` r
tabla = bind_rows(listadf)
print(tabla)
```

    ## # A tibble: 2,180 × 9
    ##    COD_VIAJE CLIENTE        UBICACION CANTIDAD PILOTO     Q CREDITO UNIDAD Fecha
    ##        <dbl> <chr>              <dbl>    <dbl> <chr>  <dbl>   <dbl> <chr>  <chr>
    ##  1  10000001 EL PINCHE OBE…     76002     1200 Ferna… 300        30 Camio… 01-2…
    ##  2  10000002 TAQUERIA EL C…     76002     1433 Hecto… 358.       90 Camio… 01-2…
    ##  3  10000003 TIENDA LA BEN…     76002     1857 Pedro… 464.       60 Camio… 01-2…
    ##  4  10000004 TAQUERIA EL C…     76002      339 Angel…  84.8      30 Panel  01-2…
    ##  5  10000005 CHICHARRONERI…     76001     1644 Juan … 411        30 Camio… 01-2…
    ##  6  10000006 UBIQUO LABS |…     76001     1827 Luis … 457.       30 Camio… 01-2…
    ##  7  10000007 CHICHARRONERI…     76002     1947 Ismae… 487.       90 Camio… 01-2…
    ##  8  10000008 TAQUERIA EL C…     76001     1716 Juan … 429        60 Camio… 01-2…
    ##  9  10000009 EL GALLO NEGR…     76002     1601 Ismae… 400.       30 Camio… 01-2…
    ## 10  10000010 CHICHARRONERI…     76002     1343 Ferna… 336.       90 Camio… 01-2…
    ## # ℹ 2,170 more rows

``` r
write_xlsx(tabla, "tabla.csv")
```

``` r
# Nueva lista de vectores
lista_vectores <- list(
  c(5, 10, 10, 15, 20, 10, 25),
  c(7, 14, 14, 21, 14, 28, 7),
  c(2, 4, 4, 6, 8, 4, 10)
)

# Función para calcular la moda
calcular_moda <- function(x) {
  tabla_frec <- table(x)
  moda <- as.numeric(names(tabla_frec)[tabla_frec == max(tabla_frec)])
  return(moda)
}

# Aplicar la función a cada vector de la lista
modas <- lapply(lista_vectores, calcular_moda)
print(modas)
```

    ## [[1]]
    ## [1] 10
    ## 
    ## [[2]]
    ## [1] 14
    ## 
    ## [[3]]
    ## [1] 4

``` r
file_path <- "/Users/georgealbadr/Documents/GitHub/Data-Wrangling/Lab1/INE_PARQUE_VEHICULAR_080219.txt"

data <- read_delim(file_path, delim = "|", col_names = TRUE)
```

    ## New names:
    ## • `` -> `...11`

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## Rows: 2435294 Columns: 11
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: "|"
    ## chr (8): MES, NOMBRE_DEPARTAMENTO, NOMBRE_MUNICIPIO, MODELO_VEHICULO, LINEA_...
    ## dbl (2): ANIO_ALZA, CANTIDAD
    ## lgl (1): ...11
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
# Cambiar opciones globales para mostrar más filas y columnas
options(tibble.print_max = 50, tibble.print_min = 10, tibble.width = Inf)

# Mostrar el tibble con las nuevas opciones
data
```

    ## # A tibble: 2,435,294 × 11
    ##    ANIO_ALZA MES   NOMBRE_DEPARTAMENTO NOMBRE_MUNICIPIO MODELO_VEHICULO
    ##        <dbl> <chr> <chr>               <chr>            <chr>          
    ##  1      2007 05    HUEHUETENANGO       "HUEHUETENANGO"  2007           
    ##  2      2007 05    EL PROGRESO         "EL JICARO"      2007           
    ##  3      2007 05    SAN MARCOS          "OCOS"           2007           
    ##  4      2007 05    ESCUINTLA           "SAN JOS\xc9"    2006           
    ##  5      2007 05    JUTIAPA             "MOYUTA"         2007           
    ##  6      2007 05    GUATEMALA           "FRAIJANES"      1997           
    ##  7      2007 05    QUETZALTENANGO      "QUETZALTENANGO" 2007           
    ##  8      2007 05    SUCHITEPEQUEZ       "CHICACAO"       2007           
    ##  9      2007 05    ESCUINTLA           "ESCUINTLA"      2007           
    ## 10      2007 05    GUATEMALA           "MIXCO"          2007           
    ##    LINEA_VEHICULO          TIPO_VEHICULO USO_VEHICULO MARCA_VEHICULO CANTIDAD
    ##    <chr>                   <chr>         <chr>        <chr>             <dbl>
    ##  1 SPORT125                MOTO          MOTOCICLETA  ASIA HERO             1
    ##  2 BT-50 DBL CAB 4X2 TURBO PICK UP       PARTICULAR   MAZDA                 1
    ##  3 JL125                   MOTO          MOTOCICLETA  KINLON                1
    ##  4 JL125T-15               MOTO          MOTOCICLETA  JIALING               1
    ##  5 JH100-2                 MOTO          MOTOCICLETA  JIALING               1
    ##  6 TACOMA XTRA CAB 4X4 V6  PICK UP       PARTICULAR   TOYOTA                1
    ##  7 ALTO LHD 800 STANDARD   AUTOMOVIL     PARTICULAR   SUZUKI                1
    ##  8 AUTORIKSHA              MOTO          MOTOCICLETA  BAJAJ                 4
    ##  9 SC 125 ELITE            MOTO          MOTOCICLETA  HONDA                11
    ## 10 GN125H                  MOTO          MOTOCICLETA  SUZUKI               15
    ##    ...11
    ##    <lgl>
    ##  1 NA   
    ##  2 NA   
    ##  3 NA   
    ##  4 NA   
    ##  5 NA   
    ##  6 NA   
    ##  7 NA   
    ##  8 NA   
    ##  9 NA   
    ## 10 NA   
    ## # ℹ 2,435,284 more rows
