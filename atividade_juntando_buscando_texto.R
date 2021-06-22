###################
# Victor  Barbosa 
# Atividade - juntando e buscando texto

###################

# junta duas bases por nomes não categorizados e, 
# em seguida, realiza uma busca por determinados 
# textos em uma das colunas. Atenção: a base de dados 
# pode ser simulada! não precisa ser real.

####################

install.packages("fuzzyjoin")
library(fuzzyjoin)

####################

# simulando os dados ################# 

## criando as variaveis
pais <- c("México", "Reino Unido", "Brasil", "Austrália", "Estados Unidos")
cidade <- c("Cidade do México", "Londres", "São Paulo", "Sidney", "Chicago")
musica_mais_reproduzida <- c("Shallow", "Bad romance", "Rain on me", "Always remember us this way", "Poker face")

## criando o data frame

gaga_dados <- as.data.frame(cbind(pais, cidade, musica_mais_reproduzida))

## criando variaveis 

pais <- c("Reino Unido", "México", "Brasil", "Austrália", "Reino Unido")
cidade <- c("Londres", "Cidade do México", "São Paulo", "Sidney", "Birmingham")
musica_mais_stream <- c("Say you love me", "Hot and heavy", "What's your pleasure?", "Please", "Spotlight")

## criando o data frame

jessieware_dados <- as.data.frame(cbind(pais, cidade))


########################

# juntando as duas bases com fuzzy 


gagaware <- stringdist_join(gaga_dados, jessieware_dados, mode = 'left')

View(gagaware)
########################

# buscando texto 

musicas_que_eu_gosto <- c("Babylon", "Shallow", "Rain on me", "Eletric chapel", "Joane") # criando variavel para efetuar a busca

(musicas <- fuzzy_base %>% mutate(genero = ifelse(grepl(paste(musicas_que_eu_gosto, collapse="|"), musica_mais_reproduzida), 'boa', 'nem tão boa')))

View(musicas) # visualizando 
