########################################

# Aluno: Victor Barbosa 

# Atividade - estruturas de controle 

########################################

#######################################

#  Criando os vetores para o data frame 

nome_aluno <- c('Jefferson', 'Pedro', 'Danrley', 'Adriano', 'Rafael') # vetor com o nome dos alunos 

peso_aluno <- c(80, 75, 90, 82, 68) # vetor com o nome dos alunos

idade_aluno <- c(22, 30, 29, 25, 32) # vetor com a idade dos alunos

raca_aluno <- c('branco', 'negro', 'branco', 'branco', 'negro')

# Criando o data frame com os vetores 

lista_alunos <- data.frame(
  nome = nome_aluno, # vetor com os nomes
  idade = idade_aluno, # vetor com as idades
  peso = peso_aluno, # vetor com os pesos
  raca = raca_aluno # vetor com os pesos 
)

############### resposta da atividade ########################

# controle condicional simples 

lista_alunos$raca_dummy <- ifelse(lista_alunos$raca == 'negro', 1, 0) # se na coluna raca for 'negro', recebe o valor correspondente 1, se n for, recebe 0)

View(lista_alunos) # visualizando os dado agora com a variável dummy de raça
