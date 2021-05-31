#######################################

# Aluno: Victor Barbosa 

# Atividade: limpeza 

#######################################
#######################################

# Aplicação de validação

#######################################

# pacotes 

install.packages("validate")

library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling)
library(validate) # chamamando pacote que será usado na validação

# dados

general_data <-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo


southern_africa_countries <-c("Angola", "Botswana", "Eswatini", "Lesotho", "Malawi", "Mozambique", "Namibia", "South Africa", "Zambia", "Zimbabwe") # vetor que identifica países da africa austral

southern_africa<- general_data %>% filter(location %in% southern_africa_countries) # filtra casos apenas por vetor

southern_africa <- southern_africa %>% select(location, new_cases, new_deaths) # selecionando apenas essas três variáveis

# análise exploratória de dados 

status(southern_africa) # estrutura dos dados (missing etc)
freq(southern_africa) # frequência das variáveis fator
plot_num(southern_africa) # exploração das variáveis numéricas
profiling_num(southern_africa) # estatísticas das variáveis numéricas

southern_africa %>% filter(new_cases < 0)

southern_africa <- southern_africa %>% filter(new_cases>=0)

#######################################################
#######################################################

# Removendo NAs

southern_africa <- na.omit(southern_africa)

View(southern_africa) # visualizando os dados sem os missing values (NAs).


#######################################################
#######################################################

# validando

regras_southern_africa <- validator(new_cases >= 0, new_deaths >= 0) # novos casos e novas mortes devem ser maior ou igual a 0

validacao_southern_africa <- confront(southern_africa, regras_southern_africa) # usando a função confront para comparar a base de dados com as regras que criamos

summary(validacao_southern_africa) # sumário dos resultados (houve apenas duas falhas)

plot(validacao_southern_africa) #gráfico



