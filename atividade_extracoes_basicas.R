############################################

# Victor Barbosa 

# Eletiva de Análise de dados

# Atividade extrações básicas 

############################################

# Extraindo dados de pelo menos 3 dessas 5 fontes: txt,  csv, excel, json e xml

###########################################
############# fonte csv ###################

# arquivos de texto com read.csv2

despesas_orc_recife_2021 <- read.csv2('http://dados.recife.pe.gov.br/dataset/4e008cec-c6a8-40cf-8fc7-d1530168b816/resource/df6d4a2a-7f78-4f98-a38b-8cf74b7823d7/download/recife-dados-despesas-2021.csv', sep = ';', encoding = 'UTF-8') # dados com as despesas orçamentárias da prefeitura do recife em 2021

##########################################
############## fonte json ################

# arquivos json

install.packages('rjson') # instalando pacote necessário
library(rjson) # chamando o pocote

despesas_metadados <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/4e008cec-c6a8-40cf-8fc7-d1530168b816/resource/8f0ffeb8-3b1e-4862-8856-c3836a075e6b/download/metadados-despesas.json") # Dicionário de Dados de Despesas Orçamentárias

#############################################
############### Fonte xlm ###################

# arquivos xlm 

install.packages('XML') # instalando pacote necessário
library(XML) # chamando o pacote 

wsu_college_courses <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/wsu.xml") # Cursos da WSU









