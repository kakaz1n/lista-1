library(readxl)
install.packages('ggplot2')

library(ggplot2)

dados <- read_excel("././dados/exercicio6.xls") #pegando os dados
dados
numeros <- dados$`Nº pessoas`
names(numeros) <- c("Péssimo","Ruim","Razoável","Bom","Excelente")
numeros
data <- data.frame(
  freq = numeros,
  qualidade = names(numeros),
  stringsAsFactors = FALSE
)
data <- data[order(data$count,decreasing = TRUE),
             data$qualidade <- factor(data$qualidade,levels = data$qualidade),
             data$soma <- cumsum(data$freq)]
data

pdf("././gráficos/exercicio6.pdf")

ggplot(data, aes(x=data$qualidade)) +
  geom_bar(aes(y=data$freq), fill='blue', stat="identity") +
  geom_point(aes(y=data$soma), color = rgb(0, 1, 0), pch=16, size=1) +
  geom_path(aes(y=data$soma, group=1), colour="slateblue1", lty=3, size=0.9) +
  theme(axis.text.x = element_text(angle=90, vjust=0.6)) +
  labs(title = "Diagrama de  Pareto", x = 'Qualidades', y =
         'Frequencia')
dev.off()
