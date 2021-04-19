############################################

# Aluno: Victor Barbosa 

# Atividade - funções 

############################################

# teste com função simples 

f <- function() {
  cat("Hello, world!\n")
  }

f()

# função com estrutura condicional e de repetição

f <- function(nro) { # recebe o parametro número
  if(nro < 50) { 
    for(i in 1:nro) {
      cat("Hello, world!\n") # condição do número ser menor que 50 vai imprimir o texto
    }
  } else {
    cat("Testando") # se for maior ou igual a 50 vai imprimir 'testando"
  }
}

f(49)
f(51)





