#####################################

# Victor Barbosa 

# Eletiva de Análise de dados

# Atividade Extração com scraping

#####################################

# Fazer scraping de alguma págima, criando um data.frame

#####################################

# pacotes para arquivos html

library(rvest)
library(dplyr)

# tabelas da wikipedia 

url <- "https://en.wikipedia.org/wiki/Grammy_Awards" # escolhemos a tabela com as audiências dos eventos de premiação do Grammy

urlTables <- url %>% read_html %>% html_nodes("table") # visualizando que a tabela que desejamos está na linha 7

audiencia <- as.data.frame(html_table(urlTables[7])) # criando o data.frame

View(audiencia) # visualizando o data.frame criado
