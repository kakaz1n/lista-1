#Exercicio 4

#Leitura dos dados 
library(readxl)
exercicio4 <- read_excel("./Dados/exercicio4.xls")

#View(exercicio4)

df <- subset(exercicio4, select =`Salários`)

df$s = df$`Salários`
df$`Salários` = NULL

#Item a - Calculo da distribuicao de frequencias

range(df$s)

breakS= seq(5, 12, by=1)
breakS

s.cut = cut(df$s, breakS, right=FALSE) 
s.freq = table(s.cut) 

sal=cbind(s.freq)

#Item b - grafico do histograma correspondente

pdf("././gráficos/exercicio4.pdf")
hist(df$s,main = "Frequência de Salários", xlab = "Salário", ylab = "Frequência")
dev.off()
