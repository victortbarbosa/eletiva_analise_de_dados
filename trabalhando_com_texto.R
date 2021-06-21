##############################
# Victor Barbosa 
# Atividade - trabalhando com textos


##############################
# carrega para o R um pdf que tenha alguma data; em seguida, 
# troca as barras "/" das datas por hífens "-", e, por fim, 
# faz a extração das datas usando esse novo padrão.

###############################

install.packages("pdftools")
install.packages("textreadr")
install.packages("stringr")
library(dplyr)
library(pdftools)
library(textreadr)
library(stringr)

################################

decreto <- read_pdf("C:/Users/vi0_1/Documents/eletiva_analise_de_dados/decreto.pdf", ocr = T)

# mudando "/" por "-"

decreto$text <- str_replace_all(string = decreto$text, pattern = "/", replacement = "-")

# extração das datas usando esse movo padrão

(datas <- str_extract_all(decreto$text, "\\d{2}-\\b[a-z]+-\\d{4}"))
