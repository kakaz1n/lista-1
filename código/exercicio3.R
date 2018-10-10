numero_de_filhos=c("0", "1", "2", "3", "4", "5", "mais de 6")
familias=c(17, 20, 28, 19, 7, 4, 5)
arq=rbind(numero_de_filhos,familias)

library(xlsx)
write.xlsx(arq, file = "././dados/exercicio3.xlsx")

#Item b - Gerar os graficos da mediana e moda do numero de filhos
dados <- read_excel("././dados/exercicio3.xlsx") #pegando os dados
#dados
dados <- dados #deixando como data frame
dados
table(dados$X1)
dados$X1[2]

