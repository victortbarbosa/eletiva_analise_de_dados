######################################

# Victor Barbosa

# Disciplina de Eletiva de Analise de Dados

# Atividade de Extração 

######################################

# OBS: "sinistros_recife" é o meu "sinistrosRecifeRaw" da atividade

######################################

ls() # lista todos os objetos no ambiente do R

# vamos ver quanto cada objeto está ocupando

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# os objetos na área intermediária que mais estavam utilizando memória eram sinistros_recife, sinistros_recife_2019_raw e sinistros_recife_2019_mod

# deletando todos os elementos, menos os listados

rm(list=setdiff(ls(), c("sinistros_recife", "naZero")))

# salvando 

saveRDS(sinistros_recife, "bases_tratadas/sinistros_recife.rds")

write.csv2(sinistros_recife, "bases_tratadas/sinistros_recife.csv")



