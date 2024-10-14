library(nycflights13)
library(dplyr)
library(lubridate)

##### Funciones Basicas

### Fecha de hoy 
today()
now()

##### Generar una variable de fecha
make_date(year = 2024, month = 10, day = 07)

##### Parsear fechas
x <- "1994 October 27th"
ymd(x)

y <- "1994.10.27"
ymd(y)

##### Diferencia de tiempo
# La fecha de aterrizaje a la luna
date_landing <- mdy("July 20, 1969")
moment_step <- mdy_hms("July 20, 1969, 02:56:15", tz = "UTC")
##### Cuántos dias desde el primer aterrizaje en la luna
difftime(today(), date_landing, units = "days")
difftime(today(), moment_step, units = "secs")

round_date(today(), unit = "month")
##### nycflights13
view(flights)


