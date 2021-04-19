#########################################

# Aluno: Victor Barbosa 

# Atividade - indexação 

#########################################

cars$speed # retorna apenas a coluna speed do data.frame cars (nativo do R)

cars$dist #  retorna apenas a coluna dist do data.frame cars (nativo do R)

cars[, 1] # retorna todas as linhas apenas da coluna speed do data.frame cars


cars[, 'dist'] # retorna a coluna dist, indexada pelo nome

cars[, 'speed', drop = FALSE] # retorna a coluna speed, indexada pelo nome, em formato de coluna

# Indexação com operadores lógicos 

cars$speed <= 0 # testa se os valores na coluna speed são menores ou iguais a 0 

cars$speed >= 0 & cars$speed <= 2 # testa se os valores na coluna speed são iguais ou maiores que 0 ou se os valores são menores ou iguais a 2




