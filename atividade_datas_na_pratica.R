##########################

# Victor Barbosa 

# Atividade - datas na prática 

##########################

# replicação com variável distinta da utilizada pelo professor 

##########################

###### baixando os dados 

url = 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv' # passar a url para um objeto
covidBR = read.csv2(url, encoding='latin1', sep = ',') # baixar a base de covidBR

covidPE <- subset(covidBR, state == 'PE') # filtrar para Pernambuco


View(covidPE) # visualizando a base

###### organizando os dados para criar vetor de predição

covidPE$date <- as.Date(covidPE$date, format = "%Y-%m-%d") # modificando a coluna data de string (chr) para formato de data (date)

str(covidPE) # observanda a mudança na classe da variável date

covidPE$dia <- seq(1:length(covidPE$date)) # criando um sequencial de dias de acordo com o total de datas para a predição

predDia = data.frame(dia = covidPE$dia) # criando vetor auxiliar de predição
predSeq = data.frame(dia = seq(max(covidPE$dia)+1, max(covidPE$dia)+180)) # criando segundo vetor auxiliar 

predDia <- rbind(predDia, predSeq) # juntando os dois

####### predição de número total de mortes com relação ao dia 

# pacotes necessários 

install.packages("drc") # pacote para predição
library(drc) # chamando o pacote

# fazendo a predição log-log com a função drm (regressão) 

fitLL <- drm(deaths ~ dia, fct = LL2.5(),
             data = covidPE, robust = 'mean')

# representação gráfica 

plot(fitLL, log="", main = "Log logistic") # observando o ajuste da curva de mortes

# criando novo dataframe com a função predict

predLL <- data.frame(predicao = ceiling(predict(fitLL, predDia)))

# passando as datas de volta (so havia as predições na base) com a função seq.Date

predLL$data <- seq.Date(as.Date('2020-03-12'), by = 'day', length.out = length(predDia$dia))

# unindo as inforções preditas a base original 

predLL <- merge(predLL, covidPE, by.x ='data', by.y = 'date', all.x = T) # na base original ta como 'date' e na que criamos como 'data'


View(predLL) # visualizando

###### visualizanção interativa dos dados 

# pacotes 

install.packages("plotly")
library(plotly)

# criando o gráfico ( na base criada, os dados originais das mortes se repetiram em duas variaveis deaths.x e deaths.y)

plot_ly(predLL) %>% add_trace(x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Mortes - Predição") %>% add_trace(x = ~data, y = ~deaths.x, name = "Mortes - Observadas", mode = 'lines') %>% layout(
  title = 'Predição de Mortes de COVID 19 em Pernambuco', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Mortes Acumuladas por Dia', showgrid = FALSE),
  hovermode = "compare")

##### manipulação de casos e séries temporais 

# pacotes 

install.packages("zoo") # biblioteca para manipulação de datas e séries temporais
library(zoo)

covidPE <- covidPE %>% mutate(newDeathsMM7 = round(rollmean(x = newDeaths, 7, align = "right", fill = NA), 2)) # média móvel de 7 dias

covidPE <- covidPE %>% mutate(newDeathsL7 = dplyr::lag(newDeaths, 7)) # valor defasado em 7 dias

# gráfico de médio móvel de 7 dias do número de novas mortes 

plot_ly(covidPE) %>% add_trace(x = ~date, y = ~newDeaths, type = 'scatter', mode = 'lines', name = "Novas mortes") %>% add_trace(x = ~date, y = ~newDeathsMM7, name = "Novas mortes MM7", mode = 'lines') %>% layout(
  title = 'Novas mortes de COVID19 em Pernambuco', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Novas mortes por Dia', showgrid = FALSE),
  hovermode = "compare") # plotando tudo junto, para comparação


# trabalhando diretamente o dado como uma série temporal 

# pacotes necessários 
install.packages("xts")
library(xts) # chamando o pacote

(covidPETS <- xts(covidPE$newDeaths, covidPE$date)) # transformar em serie temporal
str(covidPETS) # mudou dataframe papra xts

autoplot(covidPETS) # grafico automatico
acf(covidPETS) #correlações 








