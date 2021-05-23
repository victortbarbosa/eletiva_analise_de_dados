###########################################

# Victor Barbosa 

# Eletiva de Analise de dados

# Exercício 2

##########################################

# 1. Extraia em padrão ff todas as bases de situação final de alunos 
# disponíveis neste endereço:
# http://dados.recife.pe.gov.br/dataset/situacao-final-dos-alunos-por-periodo-letivo

# 2. Junte todas as bases extraídas em um único objeto ff

# 3. Limpe sua staging area

# 4. Exporte a base única em formato nativo do R

###########################################
###########################################

# 1. Extração em padrão ff das bases de situação final dos alunos (2011-2020)

###########################################

# chamando os pacotes 

library(ff)
library(ffbase)

# criando os objetos

resultado_2011 <- 'bases_originais/resultado_final_2011.csv'
resultado_2012 <- 'bases_originais/resultado_final_2012.csv'
resultado_2013 <- 'bases_originais/resultado_final_2013.csv'
resultado_2014 <- 'bases_originais/resultado_final_2014.csv'
resultado_2015 <- 'bases_originais/resultado_final_2015.csv'
resultado_2016 <- 'bases_originais/resultado_final_2016.csv'
resultado_2017 <- 'bases_originais/resultado_final_2017.csv'
resultado_2018 <- 'bases_originais/resultado_final_2018.csv'
resultado_2019 <- 'bases_originais/resultado_final_2019.csv'
resultado_2020 <- 'bases_originais/resultado_final_2020.csv'

# extraindo em padrão ff

extracao_2011 <- read.csv.ffdf(file=resultado_2011)
extracao_2012 <- read.csv.ffdf(file=resultado_2012)
extracao_2013 <- read.csv.ffdf(file=resultado_2013)
extracao_2014 <- read.csv.ffdf(file=resultado_2014)
extracao_2015 <- read.csv.ffdf(file=resultado_2015)
extracao_2016 <- read.csv.ffdf(file=resultado_2016)
extracao_2017 <- read.csv.ffdf(file=resultado_2017)
extracao_2018 <- read.csv.ffdf(file=resultado_2018)
extracao_2019 <- read.csv.ffdf(file=resultado_2019)
extracao_2020 <- read.csv.ffdf(file=resultado_2020)

#########################################################
#########################################################

# 2. Juntando todas as bases extraídas em um único objeto ff

#########################################################

# função  ffdfrbind.fill junta bases semelhantes forçando preenchimento
# tentei com ffdfappend mas deu erro

extracao_merge <- ffdfrbind.fill(extracao_2011, extracao_2012, extracao_2013,
                                 extracao_2014, extracao_2015, extracao_2016,
                                 extracao_2017, extracao_2018, extracao_2019,
                                 extracao_2020)

head(extracao_merge) # visualizando 

##########################################################
##########################################################

# 3. Limpando a staging area

#########################################################

rm(list=(ls()[ls()!="extracao_merge"]))

##########################################################
##########################################################

# 4. Exportando a base única em formato nativo do R

##########################################################

saveRDS(extracao_merge, "bases_tratadas/resultados_finais.rds")







