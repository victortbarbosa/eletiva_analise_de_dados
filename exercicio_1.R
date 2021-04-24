#######################################

# Aluno: Victor Barbosa 
# Disciplina Eletiva de Análise de dados
# Exercício 1

########################################
######### Questão 1 ####################

# Data frame com pelo menos 500 casos
# duas variáveis normais com desvio padrão distintos
# uma variável de contagem (poisson)
# uma variável de contagem com dispersão (binomial negativa)
# uma variável binomial (0, 1)
# uma variável qualitativa que apresenta um valor quando a variável binomial é 0 e outro quando é 1
# uma variável de index 

############################################
############## Resposta - 1 ################

# Definindo a semente aleatória de geração de dados

semente <- addTaskCallback(function(...) {set.seed(123);TRUE}) # atribui a tarefa a variável semente

semente # chama a semente

#########################################

# Criando as variãveis 

# Variáveis normais com desvio padrão distintos

normal_1 <- rnorm(500, sd = 1)

normal_2 <- rnorm(500, sd = 1.2)

# Uma variável de contagem (poisson)

poisson <- rpois(500, 3)

# uma variável de contagem com dispersão (binomial negativa)

binomial_negativa <- rnbinom(500, mu = 3, size = 10)

# uma variável binomial (0, 1)

binomial <- rbinom(500, size = 1, prob = 0.5)

# uma variável qualitativa que apresenta um valor quando a variável binomial é 0 e outro quando é 1

qualitativa <- ifelse(binomial == 1, 'branco', 'negro')

# uma variável de index

dados_index <- data.frame(
  col_1 = rnorm(1000, sd = 1.6),
  col_2 = rnorm(1000, sd = 1.4)
) # criando base de dados com a quantidade de observações suficientes para executar o exercício 

index <- dados_index[1:500, 1] # variável de index

###############################################

# Criando a base de dados

questao_1 <- data.frame(
  var_normal_1 = normal_1,
  var_normal_2 = normal_2,
  var_poisson = poisson,
  var_binomial_neg = binomial_negativa,
  var_binomial = binomial,
  var_qualitativa = qualitativa,
  var_index = index
)

View(questao_1) # Visualizando a data.frame criado

######################################################
#################### Questão 2 #######################

# Centralize as variáveis normais

##################### Resposta 2 ###################### 
centralizacao <- function(x) {
  x <- x - mean(x)
  return(x)
} # criando a função pra centralizar 

centra_normal_1 <- centralizacao(normal_1) # centralizando a variavel normal 1 e alocando os valores em uma nova variável

centra_normal_2 <- centralizacao(normal_2) # centralizando a variavel normal 2 e alocando os valores em uma nova variável


#############################################################
##################### Questão 3 #############################

# Troque os zeros (0) por um (1) nas variáveis de contagem.

###################### Resposta 3 ###########################

questao_3_poisson <- ifelse(poisson == 0, 1, poisson)

questao_3_poisson # Visualizando os 0 trocados por 1

questao_3_bineg <- ifelse(binomial_negativa == 0, 1, binomial_negativa) 

questao_3_bineg # Visualizando os 0 trocados por 1

#############################################################
######################## Questão 4 ##########################

# Crie um novo data.frame com amostra (100 casos) da base de dados original. 

######################## Resposta 4 #########################

questao_4 <- questao_1[1:100,] # indexando os 100 primeiros casos de todas as colunas do data.frame criado para a questão 1 

View(questao_4) # Visualizando no novo data.frama com amostra de 100 casos 

############################################################

removeTaskCallback(semente) # por fim, removendo a semente de geração de dados 




