#############################################

# Aluno: Victor Barbosa 

# Eletiva de Análise de dados 

# Atividade small e medium data

##############################################

# Usa um dos dois processos otimizados (read.csv2 com amostragem ou fread)

##############################################

library(data.table) # chamando o pacote 

enderecoBase <- 'bases_originais/largeData.csv'

# extração direta via read.csv

system.time(extracaoLD1 <- read.csv2(enderecoBase))

###############################################

# extração via amostragem com read.csv

# ler apenas as primeiras 20 linhas

amostraLD1 <- read.csv2(enderecoBase, nrows=20)  

amostraLD1Classes <- sapply(amostraLD1, class) # encontra a classe da amostra amostra

# fazemos a leitura passando as classes de antemão, a partir da amostra
system.time(extracaoLD2 <- data.frame(read.csv2("bases_originais/largeData.csv", 
                                                colClasses=amostraLD1Classes) ) ) 
