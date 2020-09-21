# pedro daniel velasquez gonzales
install.packages("dplyr")
install.packages("magrittr")
install.packages("modeest")
library(dplyr)
library(magrittr)
library(modeest)

ambiente_marciano = read.csv("mars-weather.csv")
View(ambiente_marciano)
ambiente_marciano %>% colnames()
ambiente_marciano %>% ncol()
ambiente_marciano %>% nrow()
ambiente_marciano$sol %>% is.na() %>% sum() #no hay valores perdidos

#limpieza
ambiente_marciano %>% 
  filter(min_temp!="NaN")%>%
  filter(max_temp!="NaN")%>%
  filter(pressure!="NaN")%>%
  select(-wind_speed)    -> marte

# marte %>%
#  summarise(media_presion = mean(pressure)) %>% View() #media de la presión en marte


#■Cuando la mision termina el dia marciano numero 1000 (sol 1000), halle e interprete
#■la mediana de la temperatura minima para los meses de orden 5 que tengan una presión menor a 750 Pa

marte %>%
  filter(sol<=1000) %>% 
  filter(month=="Month 5") %>% 
  filter(pressure<750)     %>% 
  summarise(mediana = median(min_temp)) 
#■cuando la mision alcance a terminar el dia marciano numero 1000(sol 1000) 
#■por lo menos la mitad (50%) de los meses de orden 5 que tienen una presión menor a 750 Pa,
#■registran una temperatura minima menor o igual a -78 (°C)  




#■determine e interprete el cuartil 1 de las presiones, dentro del intervalo <1000,1500> de los dias marcianos
marte %>% 
  filter(sol>1000 & sol<1500) %>% 
  summarise(Q1 = quantile(pressure,0.25)) 

#■al menos el 25% de los dias marcianos comprendidos en el intervalo <1000,1500> ,
#■tienen como registro una presion menor o igual a 777.5 Pa

