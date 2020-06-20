## Programação Funcional - Aula 2
# Conceitos de programação funcional
# Prof. Neylson Crepalde
#################################

library(microbenchmark)

# Paradigma da programação funcional
## Pure functions
## Funções determinísticas - vão sempre retornar os mesmos
## resultados com o mesmo input

add = function(x, y) {
  return(x + y)
}

add(2, 4)

# Imutabilidade
## Objetos sempre imutáveis
x = 3
y = x + 1
x
y

# Transparência referencial
# Pure functions + imutable data = referential transparency
x = 3
y = 4
z = 6
i = 1
add(x, i)

for (i in 1:10) {
  print(add(x, i))
}

# For loops não nos permitem ter transparência referencial pois
# os valores do nosso iterador (i) são alterados a cada rodada.
# Como resolver?

add2 = function(x) x + 2

# High order functions
inputs = 1:10
inputs
# Usar o sapply - high order function - aplica uma função em cada 
# item de uma lista ou vetor de inputs
outputs = sapply(inputs, add2)
outputs
inputs

# Map
unlist(Map(add2, inputs))

# Reduce
Reduce(add, inputs, accumulate = T)
#################################
# Outra forma de resolver o problema de iterações sem uso de funções
# de alta ordem é usar recursão

# Vamos criar uma função que retorne o n-ésimo número de fibonacci
# 1, 1, 2, 3, 5, 8, 13, 21
fibloop = function(n) {
  res = c()
  for (i in 1:n) {
    if (i <= 2) {
      res[i] = 1
    } else {
      res[i] = res[i-1] + res[i-2]
    }
  }
  return(max(res))
}

fibloop(10)

# Vamos implementar uma função de fibonacci recursiva
fib = function(n) {
  if (n <= 2) return(1)
  return( fib(n-1) + fib(n-2) )
}

fib(35)
# 1, 1, 2, 3, 5, 8
#fib(3) = fib(2) + fib(1)
#fib(4) = fib(3) + fib(2) = fib(2) + fib(1) + fib(2)
#fib(5) = fib(4) + fib(3) = fib(3) + fib(2) + fib(3) =
#       = fib(2) + fib(1) + fib(2) + fib(2) + fib(1)
 
microbenchmark(
  loop = fibloop(50),
  rec = fib(50)
)

# Memoization - cache
fib = local({
  cache = list()
  function(n) {
    valuename <- as.character(n)
    if ( !is.null(cache[[valuename]] ) ) return( cache[[valuename]] )
    if (n <= 2) return(1)
    res = Recall(n - 1) + Recall(n - 2)
    cache[[valuename]] <<- res # superassignment (busca o env superior)
    return(res)
  }
})

fib(50)

# Testando função de fibonacci com loop e com recursividade e cache
microbenchmark(
  loop = fibloop(50),
  rec = fib(50),
  times=30
)
