##############################

# Victor Barbosa 

##############################

# Atividade - dplyr

##############################

# um sumário, um agrupamento, 
# uma manipulação de casos e uma manipulação de colunas

###############################

# pacotes 

library(dplyr)

###############################

# sumário 

count(facebook, Type)

###############################

# agrupamento 

facebook %>% group_by(Type) %>% summarise(avg = mean(like))

################################

# manipulação de casos 

facebook %>%  filter(Type != "Photo") %>% summarise(avg = mean(like))
facebook %>%  filter(Type != "Photo") %>% group_by(Type, Paid) %>% summarise(avg = mean(like))

# ordenar casos
arrange(facebook, like) # ascendente
arrange(facebook, desc(like)) # descendente

#######################################

# manipulação de colunas 

# seleção de colunas
facebook %>% select(like, Type, Paid) %>% arrange(like)

# novas colunas
facebook %>% mutate(likePerLifeTime = like/Lifetime.Post.Total.Reach)

# renomear
facebook %>% rename(Reach = Lifetime.Post.Total.Reach)








