######################################

# Victor Barbosa 

# Discplina Eletiva de Análise de dados

# Atividade - leitura

######################################
install.packages('microbenchmark')
library(microbenchmark) # chamando o pacote 

# exporta em formato nativo do R

saveRDS(sinistros_recife, "bases_tratadas/sinistros_recife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade

write.csv2(sinistros_recife, "bases_tratadas/sinistros_recife.csv")

# (leitura) carrega base de dados em formato nativo R

sinistros_recife <- readRDS('bases_tratadas/sinistros_recife.rds')

# (leitura) carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade

sinistros_recife <- read.csv2('bases_tratadas/sinistros_recife.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(sinistros_recife, "bases_tratadas/sinistros_recife.rds"), b <- write.csv2(sinistros_recife, "bases_tratadas/sinistros_recife.csv"), times = 30L)

microbenchmark(a <- readRDS('bases_tratadas/sinistros_recife.rds'), b <- read.csv2('bases_tratadas/sinistros_recife.csv', sep = ';'), times = 10L)