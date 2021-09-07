
#Vivienda EPH 2021 (1er trimestre)

library(tidyverse)

base <- read.delim(file = "https://raw.githubusercontent.com/vicky-marco/vivienda_EPH/master/usu_hogar_T121.csv", sep=";")

base_P1 <- base %>% 
  select(CODUSU, PONDERA, II7, ITF, DECIFR)


base_P1 <-as.data.frame(lapply(base_P1, rep, base_P1$PONDERA))
write_xlsx(base_P1, "base_base.xlsx")

base_P1_1 <- base_P1 %>% 
  group_by(DECIFR, II7) %>% 
  summarise(cantidad=n()) %>% 
  arrange(desc(cantidad))

base_P1_2 <- base_P1 %>% 
  group_by(II7, DECIFR) %>% 
  summarise(cantidad=n()) %>% 
  arrange(desc(cantidad))

library(xlsx)

library(readxl)


library(rJava)

library(writexl)

write_xlsx(base_P1_1, "base_11.xlsx")

quiebres <- c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)

base_3 <- mutate(base_P1, decil=cut(ITF,breaks = quantile(ITF,quiebres,na.rm = TRUE, dig.lab = 10),include.lowest = TRUE))

base_4 <- base_P1 %>% select(ITF)

class(base_4$ITF)


quantiles <-  quantile(base_P1$ITF, prob = seq(0, 1, length = 11), type = 5, na.rm = TRUE) 
  
data_cortada <- cut(base_P1$ITF, breaks = as.numeric(quantiles))

devtools::install_github("holatam/eph")
1
library(eph)
library(tidyverse)

base_2021t1_hog <- get_microdata(year = 2021, trimester = 1, type = 'hogar')

TABLA <- calculate_tabulates(base, x = "DECIFR", y = "II7", add.totals = "row", add.percentage = "col")

TABLA_2 <- calculate_tabulates(base, x = "DECCFR", y = "II7", add.totals = "row", add.percentage = "col")

write_xlsx(TABLA, "TABLA.xlsx")

write_xlsx(TABLA_2, "TABLA2.xlsx")


TABLA_3 <- calculate_tabulates(base, x = "II7", y = "DECIFR", add.totals = "row", add.percentage = "col")

TABLA_4 <- calculate_tabulates(base, x = "II7", y = "DECCFR", add.totals = "row", add.percentage = "col")

TABLA_5 <- calculate_tabulates(base, x = "DECIFR", y = "IV1", add.totals = "row", add.percentage = "col")

write_xlsx(TABLA_5, "TABLA5.xlsx")

write_xlsx(TABLA_3, "TABLA3.xlsx")

write_xlsx(TABLA_4, "TABLA4.xlsx")

TABLA_6 <- calculate_tabulates(base, x = "IV1", y = "DECIFR", add.totals = "row", add.percentage = "col")

write_xlsx(TABLA_6, "TABLA6.xlsx")

TABLA_7 <- calculate_tabulates(base, x = "DECIFR", y = "IV12_3", add.totals = "row", add.percentage = "col")

TABLA_8 <- calculate_tabulates(base, x = "IV12_3", y = "DECIFR", add.totals = "row", add.percentage = "col")

write_xlsx(TABLA_7, "TABLA7.xlsx")

write_xlsx(TABLA_8, "TABLA8.xlsx")

TABLA_9 <- base_2021t1_hog %>% 
  mutate(DECIFR = factor(DECIFR, levels = 0:12)) %>% 
  calculate_tabulates(x = "DECIFR", 
                      y = "II7",
                      weights = "PONDIH",
                      add.percentage = "col",
                      add.totals = "row")

write_xlsx(TABLA_9, "TABLA9.xlsx")


TABLA_10 <- base_2021t1_hog %>% 
  mutate(DECIFR = factor(DECIFR, levels = 0:12)) %>% 
  calculate_tabulates(x = "DECCFR", 
                      y = "II7",
                      weights = "PONDIH",
                      add.percentage = "col",
                      add.totals = "row")


write_xlsx(TABLA_10, "TABLA10.xlsx")

TABLA_11 <- base_2021t1_hog %>% 
  mutate(DECIFR = factor(DECIFR, levels = 0:12)) %>% 
  calculate_tabulates(x = "DECIFR", 
                      y = "IV1",
                      weights = "PONDIH",
                      add.percentage = "col",
                      add.totals = "row")

write_xlsx(TABLA_11, "TABLA11.xlsx")

TABLA_12 <- base_2021t1_hog %>% 
  mutate(DECIFR = factor(DECIFR, levels = 0:12)) %>% 
  calculate_tabulates(x = "DECIFR", 
                      y = "IV12_3",
                      weights = "PONDIH",
                      add.percentage = "col",
                      add.totals = "row")

write_xlsx(TABLA_12, "TABLA12.xlsx")

TABLA_13 <- base_2021t1_hog %>% 
  mutate(DECIFR = factor(DECIFR, levels = 0:12)) %>% 
  calculate_tabulates(x = "II7", 
                      y = "DECIFR",
                      weights = "PONDIH",
                      add.percentage = "row",
                      add.totals = "col")


write_xlsx(TABLA_13, "TABLA13.xlsx")


TABLA_14 <- base_2021t1_hog %>% 
  mutate(DECIFR = factor(DECIFR, levels = 0:12)) %>% 
  calculate_tabulates(x = "IV12_3", 
                      y = "DECIFR",
                      weights = "PONDIH",
                      add.percentage = "row",
                      add.totals = "col")

write_xlsx(TABLA_14, "TABLA14.xlsx")

