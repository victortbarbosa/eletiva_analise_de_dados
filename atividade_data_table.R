##############################

# Victor Barbosa 

###############################

# Atividade - data table

###############################

# a aplicação direta do sumário de uma regressão linear

###############################

# pacotes 

library(data.table)
library(dplyr)

# dados

mtcarsDT <- mtcars %>% setDT() # chamando os dados e transformando em datatable
class(mtcarsDT)

# a aplicação direta do sumário de uma regressão linear 

mtcarsDT[ , lm(formula = mpg ~ cyl + disp + hp + drat)]
