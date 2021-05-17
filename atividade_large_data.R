############################################

# Aluno: Victor Barbosa 

# Disciplina Eletiva de Análise de Dados 

# Atividade large data 

############################################

# um código criado por você em que um large data é lido através da função ff, 
# pelo menos duas operações estatísticas (média, mediana...)
# uma aplicação de estatística inferencial (regressão linear, X²...)

############################################

# instalando pacotes

install.packages('ff') 
install.packages('ffbase')

# chamando pacotes 

library(ff)
library(ffbase)

# criando objeto 

enderecoBase <- 'bases_originais/largeData.csv'

# criando o arquivo ff

system.time(extracaoLD4 <- read.csv.ffdf(file=enderecoBase)) # criando o objeto e visualizando o tempo


###############################################

# operações estatísticas 

mean(extracaoLD4[,5]) # média da coluna 5

median(extracaoLD4[,5]) # mediana da coluna 5

###############################################

# aplicação estatística inferencial 

extracaoLD4Amostra <- extracaoLD4[sample(nrow(extracaoLD4), 100000) , ] # como p vetor era muito grande, foi preciso criar uma amostra

reg <- lm(c ~ ., extracaoLD4Amostra) # regressão 
 

summary(reg) # resultado da regressão 

