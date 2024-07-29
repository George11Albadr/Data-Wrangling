install.packages("dplyr")
install.packages("lubridate")
install.packages("tidyverse")
install.packages("stringr")
install.packages("readr")

require()
library(dplyr)

# Funciones importantes
?filter #ver documentación
getwd() #location
setwd() #location de donde quiero utilizar mis archivos
head() #primeros x records
str() #lista la estructura de la data
length() #tamaño del objeto

# Tipos de datos
string <- "stringssszzz"
string
class(string)
length()

class(5.0)  # Ver la clase de un número decimal (double)

f1 <- 1/8 + 54
print(f1)
print(typeof(f1))

int <- 3i

bool <- FALSE
print(bool)
print(bool * 1)
print(as.logical(1))

## vector
c(1,2,3)
length(c(1, 2, 3))  # Esto debería devolver 3
vec1 <- 1:7
vec1
vec2 <- sample(c(1:7, 7), replace = TRUE)

sample(1:10)
