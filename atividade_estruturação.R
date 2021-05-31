#######################################

# Aluno: Victor Barbosa 

# Atividade: estruturação 

#######################################
#######################################

# Implementando um pivô long to wide ou iwde to long.

#######################################

# pacotes 

library(data.table)
library(dplyr)
library(tidyverse)

# dados

general_data <-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo


southern_africa_countries <-c("Angola", "Botswana", "Eswatini", "Lesotho", "Malawi", "Mozambique", "Namibia", "South Africa", "Zambia", "Zimbabwe") # vetor que identifica países da africa austral

southern_africa<- general_data %>% filter(location %in% southern_africa_countries)

mafrica <- southern_africa %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row) # cria matriz dos países, agrupando por local, criando uma nova linha com index e selecionando apenas algumas variáveis

# filtrandos os dados para garantir que todos os países tenham mesmo nro de casos

result <- mafrica %>% group_by(location) %>% filter(row == max(row))
mafrica <- mafrica %>% filter(row<=min(result$row)) 

# pivota o data frame de long para wide
mafricaw <- mafrica %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var="location") 

View(mafricaw) # visualizando o restuldado 
