
library(readr)
library(ggplot2)
library(dplyr)
libray(scales)

options(scipen = 999)
# Casos acumulados
casos_amazonas <- read_csv("datasets/casos_acumulados_am.csv")

#imprimindo o resultado
casos_amazonas

#Desenhando um gráfico de linhas
ggplot(casos_amazonas, aes(data, casos)) +
  geom_line() +
  ylab("Casos acumulados Amazonas") #identificando o eixo y

# 
# #Lendo datasets/casos_amazonas.csv em casos_capital_interior.csv
# # em casos_capital_vs_interior
# casos_capital_vs_interior <- read_csv("datasets/casos_capital_interior.csv")
# 
# #Imprimindo o resultado
# casos_capital_vs_interior
# 
# #explorando a estrutura em casos_capital_vs_interior
# glimpse(casos_capital_vs_interior)
# 
# #desenhando um gráfico de linhas de casosxdata
# #Definindo a estética de linha geométrica
# plot_casos_capital_vs_interior <- ggplot(casos_capital_vs_interior) +
#   geom_line(aes(data, casos_acum, group = regiao, color = regiao)) +
#   ylab("Casos Acumulados Confirmados")
# 
# #visualizando o gráfico
# plot_casos_capital_vs_interior

# #Adicionando uma linha de tendencia no estado do Amazonas
#Desenhando um gráfico de linhas

am_abril <- casos_amazonas %>%
  filter(estado == "AM", data >="2020-04-01")
plt_tendencia_am <- ggplot(am_abril, aes(data, casos)) +
  geom_line() +
#linha de tendência suave usando regressão linear, sem erros
  geom_smooth(method = "lm", se = FALSE) +
  ylab("Casos Confirmados Acumulados no Amazonas")

plt_tendencia_am

# #Adicionando escala logaritimica
# plt_tendencia_am +
# scale_y_log10()

