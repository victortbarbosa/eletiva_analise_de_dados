#################################

# Aluno: Victor Barbosa 

# Atividade amostragem e bootstrapping 

##################################


# Criando o objeto distribuição normal

dist_normal <- rnorm(100) # usa a função rnorm para criar uma distribuição normal, com indicação do número de casos

# amostragem com reposição usando função sample

sample(dist_normal, 15, replace = TRUE) # ex.: sem reposição seria replace = FALSE


# Bootstrapping com função replicate

set.seed(412) #fixando a semente 

boots_dist_normal10 <- replicate(10, sample(dist_normal, 10, replace = TRUE)) # replicando 10 vezes a amostra criando um bootstrapping  

boots_dist_normal10 # visualizando as amostras

# Calculando uma estatística com boostrapping 

media_boots_dist_normal100 <- replicate(100, mean(sample(dist_normal, 10, replace = TRUE))) # média de 100 amostra de 10 casos 

# Comparação entre os dados originais e bootstrapping 

mean(media_boots_dist_normal100) # media do bootstrapping 100
mean(dist_normal) # media dos dados originais 





