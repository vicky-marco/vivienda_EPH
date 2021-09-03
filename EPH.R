
#Vivienda EPH 2021 (1er trimestre)

library(tidyverse)

base <- read.delim(file = "https://raw.githubusercontent.com/vicky-marco/vivienda_EPH/master/usu_hogar_T121.csv", sep=";")

base_P1 <- base %>% 
  select(CODUSU, PONDERA, II7, ITF, DECIFR)


base_P1 <-as.data.frame(lapply(base_P1, rep, base_P1$PONDERA))

base_P1_1 <- base_P1 %>% 
  group_by(DECIFR, II7) %>% 
  summarise(cantidad=n()) %>% 
  arrange(desc(cantidad))

base_P1_2 <- base_P1 %>% 
  group_by(II7, DECIFR) %>% 
  summarise(cantidad=n()) %>% 
  arrange(desc(cantidad))

library(xlsx)

base_P1_1 <- write.xlsx(base_P1_1, "base_1.xlsx")



