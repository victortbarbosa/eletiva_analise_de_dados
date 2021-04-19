######################################

# Aluno: Victor Tavares 

# Atividade - Funções de repetição/family apply

#######################################


# devio padrão de cada variável do data frame nativo cars 

apply(cars[,], 2, sd) # o 2 indica que o resultado será o desvio padrão das colunas (1 indicaria que era a média das linhas) 

lapply(cars[,], sd) # sintaxe simplificada, pois não há indicação se é coluna ou linha

sapply(cars[,], sd) # mesma sintaxe que do lapply, mas o sapply tenta simplificar o resultado