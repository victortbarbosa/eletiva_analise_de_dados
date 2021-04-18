#######################################
# Aluno: Victor Barbosa 

# Atividade simulações e sequências 

#######################################

# Definindo a semente aleatória de geração de dados
# com a função addTaskCallback deixamos a função set.seed fixa,
# rodando no background

tarefa_semente <- addTaskCallback(function(...) {set.seed(123);TRUE})

tarefa_semente # chama tarefa_semente

# Distribuição normal simulada 

dist_normal <- rnorm(100) # usa a função rnorm para criar uma distribuição normal, com indicação do número de casos

summary(dist_normal) # sumário da distribuição normal 

# Distribuição binomial simulada 

dist_binomial <- rbinom(100, 1, 0.7) # criando uma distribuição binomial com a função binom e "(100, 1, 0.7)" indicando casos, tamanho e probabilidade, respectivamente

# Sequências e index 

index_simulacao <- seq(1, length(dist_normal)) # index dos dados 

# Encerrando a tarefa iniciado no começo do script com a função removeTaskcallback

removeTaskCallback(tarefa_semente)









