###########################
# Victor Barbosa 
###########################
# Atividade valores ausentes 

###########################

# uma shadow matrix e um teste de aleatoriedade de valores ausentes. 

############################
############################

# pacotes 

library(data.table)
library(funModeling) 
library(tidyverse) 

# carregando os dados 

acidentes2015 <- fread("http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/db610fdc-18fa-41a1-9b26-72038c56ffc8/download/acidentes-transito-2015.csv")

# identificando valores ausentes 

status(acidentes2015)

## Shadow Matrix 

acidentes2015NA <- as.data.frame(abs(is.na(acidentes2015))) # cria a matriz sombra da base de covid19

acidentes2015NA <- acidentes2015NA[which(sapply(acidentes2015NA, sd) > 0)] # mantém variáveis com NA
round(cor(acidentes2015NA), 3) # calcula correlações (resultado: baixa em todos os casos)

## teste aleatoriedade de valores ausentes

acidentes2015NA <- cbind(acidentes2015NA, bairro = acidentes2015$bairro) # trazemos uma variável de interesse (bairro) de volta pro frame
acidentes2015NABai <- acidentes2015NA %>% group_by(bairro) %>% summarise(across(everything(), list(sum))) # sumarizamos e observamos que os NA se concentram nos bairros com mais casos


