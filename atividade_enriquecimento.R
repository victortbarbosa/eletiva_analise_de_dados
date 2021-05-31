############################################
############################################

# Aluno: Victor Barbosa 

# Atividade: enriquecimento 

############################################

# pacotes 

library(dplyr)
library(tidyverse)

############################################

# tive dificuldades de encontrar dados que se complementassem, então, estou utilizando os dados 
# presentes em https://www.fulljoin.com.br/posts/2016-05-12-tudo-sobre-joins/

############################################

# primeira base 

# criando as variáveis 
id.empregado <- 1:11
nome.empregado <- c('Renato', 'Miguel', 'Paulo', 'Patrícia', 'Inês', 'Saulo', 'Diego', 'Maria', 'Jose', 'Julia', 'Tiago')
idade <- c(30, 31, 29, 30, 25, 30, 30, 35, 24, 31, 29)
uf <- c('MG', 'DF', 'CE', 'DF', 'DF', 'DF', 'RJ', 'SP', 'RS', 'SC', 'BA')
id.cargo <- c(4, 4, 4, 4, 5, 4, 6, 3, 1, 2, 8)

#formando a base
(empregados <- data.frame(id.empregado, nome.empregado, idade, uf, id.cargo))

# segunda base 

# criando as variáveis 
id.cargo <- (1:7)
nome.cargo <- c('Técnico', 'Assistente', 'Consultor', 'Analista', 'Auditor', 'Gerente', 'Gestor')
salario <- c(7000, 4000, 15000, 11000, 10000, 13000, 20000)

# formando a base
(cargos <- data.frame(id.cargo, nome.cargo, salario))

############################################

(merge.r.base <- merge(empregados, cargos)) #sse tipo de join cria um data frame com todos os campos de ambos conjuntos, mas retornando somente as ocorrências (linhas) que possuem chaves iguais. Nossa chave é o campo id.cargo
