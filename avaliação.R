#################################

# Victor Barbosa 

################################

# Avaliação 

################################

# Questões 

# 1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html.
# 2. Calcule, para cada município do Estado, o total de casos confirmados e o total de óbitos por semana epidemiológica [atenção, você terá de criar uma variável de semana epidemiológica com base na data].
# 3. Enriqueça a base criada no passo 2 com a população de cada município, usando a tabela6579 do sidra ibge.
# 4. Calcule a incidência (casos por 100.000 habitantes) e letalidade (óbitos por 100.000 habitantes) por município a cada semana epidemiológica.

################################

# pacotes úteis 

library(data.table)
library(dplyr)
library(tidyverse)
library(validate)
library(funModeling)
library(Hmisc)
library(zoo)
library(lubridate)
library(openxlsx)


######################## Questão 1 #################################

# 1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html.


dados <- fread("https://dados.seplag.pe.gov.br/apps/basegeral.csv", sep =';', na.strings=c(""," ","NA")) # extraindo os dados

View(dados) # observando os dados 


######################### Questão 2 ##################################

# 2. Calcule, para cada município do Estado, o total de casos confirmados e o total 
# de óbitos por semana epidemiológica [atenção, você terá de criar uma variável de 
# semana epidemiológica com base na data].

### criando variável de semana epidemiológica chamada "semana epi" e inserindo em uma base
### modificada chamada "dados_mod"

epiweek(dados$dt_notificacao) # observando o comportamento

dados_mod <- dados %>% mutate("semana epi" = epiweek(dados$dt_notificacao)) # criando e inserindo a variavel

View(dados_mod) # observando a nova base com a nova variavel "semana epi"

### Calculando, para cada município do Estado, o total de casos confirmados e o total 
# de óbitos por semana epidemiológica

confirmados <- dados_mod %>% filter(classe == "CONFIRMADO") %>% group_by(municipio) %>% count(`semana epi`) # total de casos confirmados por semana epidemiologica, para cada municipio

obitos <- dados_mod %>% filter(evolucao == "OBITO") %>% group_by(municipio) %>% count(`semana epi`) # total de obitos por semana epidemiologica, para cada municipio

base_confirmados <- confirmados
base_obitos <- obitos

########################### Questão 3 #########################################

# 3. Enriqueça a base criada no passo 2 com a população de cada município, 
# usando a tabela6579 do sidra ibge.

## organizando

tabela <- read.xlsx("bases_originais/tabela6579.xlsx", sep =',') # carregando a tabela


tabela <- tabela[-(1:4), ] #Retirando as 4 primeiras linhas


colnames(tabela) <- c("municipio", "populacao") # editando titulo das colunas

tabela$populacao <- as.numeric(tabela$populacao) # Transformando em numerico


## modificando texto para realizar o join 

unwanted_array <- list(    'S'='S', 's'='s', 'Z'='Z', 'z'='z', 'À'='A', 'Á'='A', 'Â'='A', 'Ã'='A', 'Ä'='A', 'Å'='A', 'Æ'='A', 'Ç'='C', 'È'='E', 'É'='E',
                           'Ê'='E', 'Ë'='E', 'Ì'='I', 'Í'='I', 'Î'='I', 'Ï'='I', 'Ñ'='N', 'Ò'='O', 'Ó'='O', 'Ô'='O', 'Õ'='O', 'Ö'='O', 'Ø'='O', 'Ù'='U',
                           'Ú'='U', 'Û'='U', 'Ü'='U', 'Ý'='Y', 'Þ'='B', 'ß'='Ss', 'à'='a', 'á'='a', 'â'='a', 'ã'='a', 'ä'='a', 'å'='a', 'æ'='a', 'ç'='c',
                           'è'='e', 'é'='e', 'ê'='e', 'ë'='e', 'ì'='i', 'í'='i', 'î'='i', 'ï'='i', 'ð'='o', 'ñ'='n', 'ò'='o', 'ó'='o', 'ô'='o', 'õ'='o',
                           'ö'='o', 'ø'='o', 'ù'='u', 'ú'='u', 'û'='u', 'ý'='y', 'ý'='y', 'þ'='b', 'ÿ'='y' ) # lista com todos os acentos

for(i in seq_along(unwanted_array)) # funcao para retirar os acentos
  tabela$municipio <- gsub(names(unwanted_array)[i],unwanted_array[i],tabela$municipio) # retirando os acentos


tabela <- tabela %>%  mutate(municipio = str_remove_all(municipio, "(PE)")) %>% mutate(municipio = gsub("[:space:][()]", "", municipio)) %>% mutate(municipio = str_trim(municipio))

tabela <- tabela %>% select(municipio, populacao) %>% mutate(municipio = str_to_upper(municipio))

dados_mod <- left_join(dados_mod, populacao, by = "municipio")

View(dados_mod)

############################ Questão 4 ###########################################

# Calcule a incidência (casos por 100.000 habitantes) e letalidade 
# (óbitos por 100.000 habitantes) por município a cada semana epidemiológica.


(base_confirmados %>% group_by(municipio) %>% count(`semana epi`) %>% mutate(n = n/100000))
(base_obitos %>% group_by(municipio) %>% count(`semana epi`) %>% mutate(n/100000))
