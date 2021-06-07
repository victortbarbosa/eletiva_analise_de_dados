#############################

# Victor Barbosa 

#############################

# Atividade - tipos e fatores

#############################

# Estrutura de fatores

#############################

race <- c(3, 2, 4, 1, 2, 3, 4, 4, 3, 2, 1, 1)
recode <- c("branco" = 1, "negro" = 2, "não branco" = 3, "não negro" = 4)
(race <- factor(race, levels = recode, labels = names(recode)))






