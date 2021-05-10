#######################################

# Victor Barbosa 

# Eletiva de Análise de dados

# Atividade de carga incremental 

#######################################

# código utilizando um dos três métodos em um conjunto de dados diferente daquele do exercício

#######################################

library(dplyr) # chamando o pacote 


# carregando base de dados original

licitacoes_tempo_real <- read.csv2('http://dados.recife.pe.gov.br/dataset/591a6ed4-7beb-4304-a2a1-2af521517a06/resource/c5d7505c-381c-4670-a0c2-1fbf56df50b1/download/dados_abertos_licitacao_concluida.csv', sep = ';', encoding = 'UTF-8') # dados das licitações da prefeitura do recife, frequência de atualização semanal

View(licitacoes_tempo_real) # visualizando a base de dados

# carregando base de dados para atualização

licitacoes_tempo_real_new <- read.csv2('http://dados.recife.pe.gov.br/dataset/591a6ed4-7beb-4304-a2a1-2af521517a06/resource/c5d7505c-381c-4670-a0c2-1fbf56df50b1/download/dados_abertos_licitacao_concluida.csv', sep = ';', encoding = 'UTF-8')


############################################

# comparação usando a chave primária

licitacoes_tempo_real_incremento <- (! licitacoes_tempo_real_new$data_ultimafaseprocesso %in% licitacoes_tempo_real$data_ultimafaseprocesso) # comparando as datas das últimas fases dos processos de licitação para saber se a base está atualizada, lembrando que a frequência de atualização dessa base é semanal 
