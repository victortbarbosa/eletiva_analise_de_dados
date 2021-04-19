################################

# Aluno: Victor Barbosa 

# Atividade calculando

################################

# Criando o objeto\base de dados 

exemplo <- rpois(5000, 3) # distribuição de poisson

# Visualizando o histograma 

hist(exemplo)

# Centralizando

exemplo_centralizado <- exemplo - mean(exemplo)

# Visualização do histograma dos dados agora mais centralizados 

hist(exemplo_centralizado)

