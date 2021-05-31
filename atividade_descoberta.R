###############################

# Aluno: Victor Barbosa

# Atividade: descoberta 

###############################
###############################

# Implementando EDA sobre uma base

###############################

# instalando pacotes 

install.packages("funModeling")
install.packages("tidyverse")

# chamando os pacotes 

library(funModeling) 
library(tidyverse) 

###############################

glimpse(mtcars) # observando os dados
status(mtcars) # estrutura dos dados (missing etc)
freq(mtcars) # frequência das variáveis fator (nessa base, nenhuma é fator ou categórica)
plot_num(mtcars) # exploração das variáveis numéricas
profiling_num(iris) # estatísticas das variáveis numéricas

