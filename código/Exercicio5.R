#Exercicio 5

#Leitura dos dados 
library(readxl)
exercicio5 <- read_excel("./Dados/exercicio5.xls")

#View(exercicio5)
#class(exercicio5)

df <- subset(exercicio5, select =`Marcas`:`Nº pessoas`)

df$nP = df$`Nº pessoas`
df$`Nº pessoas` = NULL

#Item a - Grafico de barras

#table(df$nP)
#as.data.frame(table(df$nP), row.names = df$Marcas)

rowNames <- c("A", "B", "C", "D", "E")
pdf("././gráficos/exercicio5.pdf")
barplot(df$nP, names.arg = rowNames, beside = TRUE)
dev.off()


