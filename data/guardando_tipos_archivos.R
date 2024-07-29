### cargar librerias

library(readr)
library(readxl)
library(openxlsx)

install.packages("openxlsx")


##ejemplo 1:Cargar archivo de excel
?read_excel
leer_excel <- read_excel('example_1.xlsx', sheet = 'Sheet1')
head(leer_excel)

## Ejemplo2: Leer CSV

leer_csv <- read_csv('example_2.csv')
leer_csv

## Ejemplo3 Leer txt:

leer_txt <- read_delim('example_3.txt', delim = ';')
leer_txt

## ejemplo4:

leer_txt1 <- read_delim('example_4.txt', delim = '|')
leer_txt1

##### Ejmeplo5: Exportar un data set a excel
write.xlsx(leer_txt, 'excel_exportado.xlsx')
