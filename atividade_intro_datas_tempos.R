######################

# Victor Barbosa 

# Atividade - intro a datas e tempos

######################

# Criem um objeto próprio de data e tempo, convertam pros três formatos 
#  de data e tempo, e façam pelo menos 3 extrações de componentes e/ou operações.

######################

###### convertendo para os três formatos 

# Conversão para data

(str(minhaData1 <- as.Date(c("1995-10-27 19:30", "2000-10-27 05:15")) ) )


# Conversão para POSIXct

(str(minhaData3 <- as.POSIXct(c("1995-10-27 19:30", "2000-10-27 05:15")) ) )


# Conversão para POSIXlt
(str(minhaData4 <- as.POSIXlt(c("1995-10-27 19:30", "2000-10-27 05:15")) ) )

##### extrações de componentes/operações 

## extração 

# pacotes 

install.packages("lubridate")
library(lubridate)

year(minhaData4) # ano

month(minhaData4, label = T) # mês pelo nome usando label = T

wday(minhaData3, label = T, abbr = T) # dia da semana abreviado

year(minhaData3)
