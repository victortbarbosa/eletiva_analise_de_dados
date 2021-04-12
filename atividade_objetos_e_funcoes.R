
# Atividades da disciplina analise de dados. 
# Aluno: Victor Barbosa.
# Ressalva: dados ficcionais criado apenas para essa atividade 

##################################################################

# Criando a base de dados 

dados <- data.frame(tempo = c(2, 4, 8, 16, 32, 64),
                    idade = c(15, 20, 20, 40, 50, 55)) # objetos simples

 # visualizando a base 
dados 

# Funcao str para visualizar complexidade 

str(dados)

# modelo de regressao linear 

exemplo_02 <- lm(data = dados, formula = tempo ~ idade) # objeto complexo

# Funcao str para visualizar complexidade 
str(exemplo_02)

# Funcao summary para observar o output da regressao

summary(exemplo_02)
