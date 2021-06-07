####################################

# Victor Barbosa 

# Eletiva de análise de dados

####################################
####################################

# Atividade - mais fatores 

# um processo de one hot encoding ou de discretização, 
# e também a transformação dos fatores de uma base de dados em 3 tipos: 
# mais frequente, segundo mais frequente e outros.

#####################################

# pacotes 

install.packages("ade4")
install.packages("arules")
installed.packages("forcats")
library(ade4)
library(arules)
library(forcats)

# carregando dados

facebook <- read.table("bases_originais/dataset_Facebook.csv", sep=";", header = T)

# observando a estrutura 

str(facebook) 

# conversão em fatores

for(i in 2:7) {facebook[,i] <- as.factor(facebook[,i]) }

str(facebook) # observando a estrutura novamente com a consersão em fator de 2 a 7

# filtro por tipo de dado

factorsFacebook <- unlist(lapply(facebook, is.factor)) # função lapply para indentificar se é fator (is.factor) e retirar a lista (unlist) 

facebookFactor <- facebook[ , factorsFacebook] # objeto apenas com as colunas que são fatores

str(facebookFactor) # observando a estrutura

# Hot one coding

facebookDummy <- acm.disjonctif(facebookFactor) # função disjunção 

View(facebookDummy) # observando a base em dummy

# forcats - usando tidyverse para fatores

fct_count(facebookFactor$Type) # conta os fatores

fct_lump(facebookFactor$Type, n = 2) # reclassifica os fatores em mais comum, segundo mais comum e outros
