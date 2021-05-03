#########################################

# Victor Barbosa 

# Análise de dados 

# Atividade - ETL real 

#########################################

# carregando a base de acidentes de trânsito com ou sem vítima do site da PCR 


# dados para o ano de 2018

sinistros_recife_2018_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2485590a-3b35-4ad0-b955-8dfc36b61021/download/acidentes_2018.csv', sep = ';', encoding = 'UTF-8')

# dados para o ano de 2019

sinistros_recife_2019_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# dados para o ano de 2020 

sinistros_recife_2020_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

# dados para o ano de 2021 

sinistros_recife_2021_raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

#####################################################

# como a base de 2019 tem três colunas a mais que as de 2020 e 2021 estava dando errado para uni-las, como solução, retirei as colunas divergentes 


sinistros_recife_2019_mod <- sinistros_recife_2019_raw[, -(10:12)]

# identificando os rótulos distintos 

names(sinistros_recife_2019_mod) == names(sinistros_recife_2020_raw)

# corrigindo erro causado por nomes distintos de colunas 
  
names(sinistros_recife_2019_mod)[names(sinistros_recife_2019_mod) == "DATA"] <- "data"


# unindo os dados com rbind

sinistros_recife <- rbind(sinistros_recife_2019_mod, sinistros_recife_2020_raw, sinistros_recife_2021_raw)

# modificando a data para formato date 

sinistros_recife$data <- as.Date(sinistros_recife$data, format = "%Y-%m-%d")

# modificando a variáveis da base de texto para fator 

# variavel natureza_acidente

sinistros_recife$natureza_acidente <- as.factor(sinistros_recife$natureza_acidente)

class(sinistros_recife$natureza_acidente) # confirmando a modificação

# variavel situacao

sinistros_recife$situacao <- as.factor(sinistros_recife$situacao)

class(sinistros_recife$situacao) # confirmando
