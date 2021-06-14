################
#Victor Barbosa 
################
# Atividade - imputação
################
# uma técnica de imputação numérica e uma técnica de hot deck para 
# substituir NA.

#########################

# pacotes 

library(data.table)
library(Hmisc) 


# preparação da base, colocando NA aleatórios
carsDT <- cars %>% setDT() #copiar base iris, usando a data.table



(carsNASeed <- round(runif(10, 1, 50))) # criamos 10 valores aleatórios

(carsDT$speed[carsNASeed] <- NA) # imputamos NA nos valores aleatórios


# tendência central (imputação numérica)

(carsDT$speed <- impute(carsDT$speed, fun = mean)) # média
(carsDT$speed <- impute(carsDT$speed, fun = median)) # mediana


# imputação aleatória (hot deck)
carsDT$speed[carsNASeed ] <- NA # recolocamos os NA

(carsDT$speed <- impute(carsDT$speed, "random")) # fazemos a imputação aleatória




