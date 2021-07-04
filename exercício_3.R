##############################

# Victor Barbosa 

# Exercicio 3

################ Questões ##########################

# 1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html

# 2. Corrija os NAs da coluna sintomas através de imputação randômica 

# 3. Calcule, para cada município do Estado, o total de casos confirmados e negativos

# 4. Crie uma variável binária se o sintoma inclui tosse ou não e calcule quantos casos confirmados e negativos tiveram tosse como sintoma

# 5. Agrupe os dados para o Estado, estime a média móvel de 7 dias de confirmados e negativos


####################### Questão 1 #######################################

# bases úteis 

library(data.table)
library(dplyr)
library(tidyverse)
library(validate)
library(funModeling)
library(Hmisc)
library(zoo)


# Extraindo a base 

dados_gerais <- fread("https://dados.seplag.pe.gov.br/apps/basegeral.csv", sep =';', na.strings=c(""," ","NA"))


View(dados_gerais) # observando a base 

########################### Questão 2 #####################################

# Corrijindo os NAs da coluna sintomas através de imputação randômica 

status(dados_gerais) # estrutura dos dados

dados_gerais$sintomas <- impute(dados_gerais$sintomas, "random") # imputação aleatória 

########################### Questão 3 #####################################

# Calculando, para cada município do Estado, o total de casos confirmados e negativos


confirmados <- dados_gerais %>% filter(classe == "CONFIRMADO") %>% group_by(municipio) %>% count(classe)

negativos <- dados_gerais %>%  filter(classe == "NEGATIVO") %>% group_by(municipio) %>% count(classe)

########################## Questão 4 #######################################

# Criando uma variável binária se o sintoma inclui tosse ou não e calculando quantos 
# casos confirmados e negativos tiveram tosse como sintoma

#inserindo uma nova variavel binaria (sintomas_tosse), onde "1" representa que apresentou tosse e "0" que não apresentou

dados_gerais <- dados_gerais %>% mutate(sintomas_tosse = ifelse(grepl(paste("TOSSE", collapse="|"), sintomas), '1', '0')) 

# calculando quantos casos confirmados e negativos tiveram tosse como sintoma

confirmados_tosse <- dados_gerais %>% filter(classe == "CONFIRMADO") %>% group_by(sintomas_tosse) %>% count(classe)

negativos_tosse <- dados_gerais %>% filter(classe == "NEGATIVO") %>% group_by(sintomas_tosse) %>% count(classe)


########################### Questão 5 #######################################

# Agrupando os dados para o Estado, estimando a média móvel de 7 dias de confirmados e negativos

dados_gerais <- dados_gerais %>% mutate(confMM7 = round(rollmean(x = (classe == "CONFIRMADO"), 7, align = "right", fill = NA), 2)) # média movel de 7 dias de confirmados

dados_gerais <- dados_gerais %>% mutate(negMM7 = round(rollmean(x = (classe == "NEGATIVO"), 7, align = "right", fill = NA), 2)) # média móvel de 7 dias de negativos 

View(dados_gerais) # visualizando a base com as novas variaveis com as medias moveis de 7 dias de confirmados (confMM7) e negativos negMM7
