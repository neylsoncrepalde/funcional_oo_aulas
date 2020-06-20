# Programação funcional - aula 1
# Funcional na prática com R
#################################

library(dplyr)
library(purrr)
library(readr)
library(microbenchmark)

bd = read_csv2("https://github.com/neylsoncrepalde/introducao_ao_r/blob/master/dados/enade_2014_amostra.csv?raw=true")

# Verificando a classe de todas as colunas
for (coluna in names(bd)) {
  print(class(bd[[coluna]]))
}

# Se a coluna for numérica, tire a média
for (coluna in names(bd)) {
  if (is.numeric(bd[[coluna]])) {
    print(mean(bd[[coluna]], na.rm = T))
  }
}

#################################
# Como fazer as mesmas tarefas usando programação funcional?
# Verificando a classe de todas as colunas
apply(bd, 2, class)


microbenchmark(
  forloop = {for (coluna in names(bd)) {
    print(class(bd[[coluna]]))
  }},
  apply = sapply(bd, class),
  purrr = bd %>% map_chr(class),
  times = 10
)
