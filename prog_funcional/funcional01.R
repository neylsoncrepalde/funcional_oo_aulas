# Programação funcional - aula 1
# Funcional na prática com R
#################################

# Para instalar as bibliotecas
#install.packages(c( "readr", "dplyr", 'purrr', 'microbenchmark' ))

# Carregar as bibliotecas necessárias
library(readr)  # Fazer a leitura dos dados
library(dplyr)  # fazer manipulação de dados
library(purrr)  # prog. func. estilo tidy
library(microbenchmark)  # benchmarking

# Leitura dos dados
enade = read_csv2("https://github.com/neylsoncrepalde/introducao_ao_r/blob/master/dados/enade_2014_amostra.csv?raw=true")

enade

# Eu quero saber qual é a classe de cada variável no dataset
class(enade$nu_ano)

# Procedural - Iterar
# Vamos escrever um código em que em cada rodada executaremos a função class
# com uma das colunas do nosso dataset

names(enade)
enade[['nu_ano']]

for (coluna in names(enade)) {
  print(class( enade[[coluna]]  ))
}

# Programação funcional
# FUNÇÕES!!!! 

# R e outras linguagens funcionais
#INPUTS -> f(x) -> OUTPUTS
# class()  -> colunas do dataset
# Função que aplica class em dataset
sapply(enade, class)

############################
# Em todas as colunas do meu dataset, se a coluna for numeric, vamos tirar uma média.

# Procedural
for (coluna in names(enade)) {
  if (is.numeric(enade[[coluna]])) {
    print( mean(enade[[coluna]], na.rm = T) )
  }
}

# Funcional
media_se_numeric = function(x) {
  if (is.numeric(x)) {
    return(mean(x, na.rm = T))
  } else {
    return(NA)
  }
}

media_se_numeric(c('a','b','c'))

sapply(enade, media_se_numeric)

# Funcional com uma função LAMBDA (anônima)
sapply(enade, function(x) if (is.numeric(x)) mean(x, na.rm=T))

# Usar a função e parâmetros dentro de apply
sapply(enade, mean, na.rm=T)

####################################
# Prog. Funcional estilo tidy
enade %>% 
  map_dbl(mean, na.rm=T)


####################
# Fazendo um benchmarking bonitinho

microbenchmark(
  forloop = {for (coluna in names(enade)) {
    if (is.numeric(enade[[coluna]])) {
      print( mean(enade[[coluna]], na.rm = T) )
    }
  }},
  sapply_def = sapply(enade, media_se_numeric),
  sapply_lambda = sapply(enade, function(x) if (is.numeric(x)) mean(x, na.rm=T)),
  purrr = enade %>% map_dbl(mean, na.rm=T),
  times=10
)
