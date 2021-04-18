##############################################

# Aluno: Victor Barbosa
# Eletiva de analise de dados 
# Atividade: tipos de objetivos no R

##############################################

#  Criando os vetores para o data frame 

nome_aluno <- c('Jefferson', 'Pedro', 'Danrley', 'Adriano', 'Rafael') # vetor com o nome dos alunos 

peso_aluno <- c(80, 75, 90, 82, 68) # vetor com o nome dos alunos

idade_aluno <- c(22, 30, 29, 25, 32) # vetor com a idade dos alunos 

# Criando o data frame com os vetores 

lista_alunos <- data.frame(
  nome = nome_aluno, # vetor com os nomes
  idade = idade_aluno, # vetor com as idades
  peso = peso_aluno # vetor com os pesos 
)

# Visualizando o data frame criado
View(lista_alunos)



