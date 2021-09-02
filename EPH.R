
#Vivienda EPH 2021 (1er trimestre)

library(tidyverse)

base <- read.delim(file = "https://raw.githubusercontent.com/vicky-marco/vivienda_EPH/master/usu_hogar_T121.csv", sep=";")

base_P1 <- base %>% 
  select(CODUSU, PONDERA, II7, ITF, DECIFR)


base_P1 <-as.data.frame(lapply(base_P1, rep, base_P1$PONDERA))



