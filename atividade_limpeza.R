#######################################

# Aluno: Victor Barbosa 

# Atividade: limpeza 

#######################################
#######################################

# Remoção de NA

#######################################

# pacotes 

library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

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

View(southern_africa) # visualizando os dados sem os missing values (NAs)
