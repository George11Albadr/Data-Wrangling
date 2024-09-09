
# ---- Cargar Librerias ----
library(tidyverse)
library(ggplot2)
library(openxlsx)
#install.packages("scorecard")
library(scorecard)
# ---- Cargar Data Set German Credit ----
df <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/statlog/german/german.data")
colnames(df) <- c("chk_acct", "duration", "credit_his", "purpose", 
                             "amount", "saving_acct", "present_emp", "installment_rate", "sex", "other_debtor", 
                             "present_resid", "property", "age", "other_install", "housing", "n_credits", 
                             "job", "n_people", "telephone", "foreign", "response")

df$response[df$response==2] <- 0
df %>% summary()

# ---- Tablas de Frecuencia por Edad ----

df.age <- df %>% select(age, response) %>% 
  group_by(age) %>% summarise(bad_credit = sum(response==1)
                              ,good_credit = sum(response==0)
                              ,total_credit = sum(good_credit,bad_credit)
                              ,bad_rate = bad_credit/total_credit)
df.age %>% View()


# ---- Graficando La Edad por la Tasa de Malos ----

## Graficando el bad rate
ggplot(df.age, aes(x = age, y = bad_rate )) +
  geom_line() +
  labs(title = "Tasa de Malos de la variable Age" ,
       x = "Edad",
       y = "Bad_Rate" ) +
  theme_minimal()

## Graficando el bad rate y la frecuencia de creditos


ggplot(df.age, aes(x = age)) +
  # Barras para total_credit
  geom_bar(aes(y = total_credit), stat = "identity", fill = "skyblue", alpha = 0.7) +
  # Línea para bad_rate
  geom_line(aes(y = bad_rate * max(total_credit)), color = "red", size = 1) +
  # Añadir un segundo eje y para bad_rate
  scale_y_continuous(
    name = "Total de Créditos",
    sec.axis = sec_axis(~ . / max(df.age$total_credit), name = "Tasa de Malos (Bad Rate)")
  ) +
  labs(title = "Tasa de Malos de la Variable Age",
       x = "Edad") +
  theme_minimal()



# ---- misma grafica con chatgpt ----
ggplot(df.age, aes(x = age)) +
  # Barras para total_credit con colores personalizados
  geom_bar(aes(y = total_credit), stat = "identity", fill = "#69b3a2", alpha = 0.8) +
  # Línea para bad_rate con un color contrastante
  geom_line(aes(y = bad_rate * max(total_credit)), color = "#404080", size = 1.2) +
  # Puntos en la línea para destacar los valores de bad_rate
  geom_point(aes(y = bad_rate * max(total_credit)), color = "#404080", size = 3) +
  # Añadir un segundo eje y para bad_rate
  scale_y_continuous(
    name = "Total de Créditos",
    sec.axis = sec_axis(~ . / max(df.age$total_credit), name = "Tasa de Malos (Bad Rate)")
  ) +
  # Añadir etiquetas de datos sobre las barras
  geom_text(aes(y = total_credit, label = total_credit), vjust = -0.5, color = "#404080", size = 3.5) +
  # Añadir etiquetas de datos sobre la línea
  geom_text(aes(y = bad_rate * max(total_credit), label = scales::percent(bad_rate, accuracy = 0.1)), 
            vjust = -0.5, color = "#404080", size = 3.5) +
  labs(title = "Tasa de Malos y Total de Créditos por Edad",
       x = "Edad", y = "Total de Créditos") +
  theme_minimal(base_size = 14) +
  # Personalizar el tema para un mejor aspecto
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    axis.title.y = element_text(color = "#69b3a2"),
    axis.title.y.right = element_text(color = "#404080"),
    legend.position = "none",
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(color = "grey80")
  )


# ---- Binning con Dplyr ----
df.age_bin <- df %>% select(age,response) %>% 
   mutate(age_bin = ntile(age,5)) %>% 
  group_by(age_bin) %>% summarise(bad_credit = sum(response==1),
                              good_credit= sum(response == 0),
                              total_credit=sum(good_credit,bad_credit),
                              bad_rate = bad_credit/sum(total_credit),
                              min_age = min(age),
                              max_age = max(age)
  )

df.age_bin



ggplot(df.age_bin, aes(x = age_bin)) +
  # Barras para total_credit
  geom_bar(aes(y = total_credit), stat = "identity", fill = "skyblue", alpha = 0.7) +
  # Línea para bad_rate
  geom_line(aes(y = bad_rate * max(total_credit)), color = "red", size = 1) +
  # Añadir un segundo eje y para bad_rate
  scale_y_continuous(
    name = "Total de Créditos",
    sec.axis = sec_axis(~ . / max(df.age_bin$total_credit), name = "Tasa de Malos (Bad Rate)")
  ) +
  labs(title = "Tasa de Malos de los Bines de la Variable Age",
       x = "Bines de Edad") +
  theme_minimal()



# ---- Calculando el WoE y el Information Value con Dplyr ----
df.age_bin_woe <- df.age_bin %>% 
   mutate(
    pct_good = 
    ,pct_bad = 
    ,woe = 
    ,iv_bin = 
    ,iv_var = sum()
  )
df.age_bin_woe
# ---- Binning con paquete Scorecard ----

bins <- woebin(df, y = "response", x = c("age"))
bins$age

df_binned <- woebin_ply(df,bins)
head(df_binned)

plot <- woebin_plot(bins)
plot[[1]]



# ---- Ejercicio - binning con dplyr y la variable amount. ----
df.amount_bin <- 
  )

df.amount_bin


ggplot(df.amount_bin, aes(x =  y = )) +
  geom_line() +
  labs(title = "Tasa de Malos por los bines de Amount",
       x = "Amount bin",
       y= "Bad Rate") +
  theme_minimal()


ggplot(df.amount_bin, aes(x = amount_bin)) +
  # Barras para total_credit
  geom_bar(aes(y = total_credit), stat = "identity", fill = "skyblue", alpha = 0.7) +
  # Línea para bad_rate
  geom_line(aes(y = bad_rate * max(total_credit)), color = "red", size = 1) +
  # Añadir un segundo eje y para bad_rate
  scale_y_continuous(
    name = "Total de Créditos",
    sec.axis = sec_axis(~ . / max(df.age$total_credit), name = "Tasa de Malos (Bad Rate)")
  ) +
  labs(title = "Tasa de Malos por los bines de Amount",
       x = "Bines de Amount") +
  theme_minimal()


# ---- Mismo ejercicio con amount con el paquete Scorecard ----
bins <- woebin(df, y = "response", x = c("age","n_credits","amount"))
bins$amount

df_binned <- woebin_ply(df,bins)
head(df_binned)

plot <- woebin_plot(bins)
plot[[3]]
