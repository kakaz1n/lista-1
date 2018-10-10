library(readxl)
library(graphics)
dados <- read_excel("././dados/exercicio1.xls") #pegando os dados
#dados
dados <- as.data.frame(dados) #deixando como data frame
#dados
dados$`Taxas de juros`
dados<- dados[order(dados$`Taxas de juros`),] #colocando em ordem de acordo com a tablea

#dados
#mean(dados) #média
pdf("././gráficos/exercicio1.pdf")
#help(plot)
#abline(h=mean(dados),col="red") #colocando a media
#abline(h=median(dados),col="blue")#mediana
media <- mean(dados)
mediana <- median(dados)
statmod <- function(x) {
  z <- table(as.vector(x))
  names(z)[z == max(z)]
}
moda <- statmod(dados)

min <- min(dados)#min
max <- max(dados)#max
quartis <- quantile(dados)
quartil_1 <- quartis[1]#primeiro quartil
quartil_3 <- quartis[3] #terceiro quartil
plot(dados,main="Taxa de juros",type="l",ylim=range(seq(2.4,4,by=0.05))) #grafico média

abline(h=quartil_1,col="green")
abline(h=quartil_3,col="orange")
abline(h=media,col="red")
abline(h=mediana,col="blue")
abline(h=as.numeric(moda),col="gray")
abline(h=min,col="purple")
abline(h=max,col="yellow")
legend(1, 4, legend=c("Dados","Quartil 1","Quartil 3","Média", "Mediana","Moda","Mínimo","Máximo","Quantil 1","Quantil 2"),
       col=c("green","orange","black","red", "blue","gray","purple","yellow"), lty=1, cex=0.6)

plot(dados,main="Variâncias",type="l",ylim=range(seq(0,0.2,0.005))) #grafico média
#help(abline)
#var(dados)#variancia
#sd(dados)

abline(h=sd(dados),col="blue")#desvio padrao ##ta perto do 0
abline(h=var(dados),col="red")
legend(1, 0.2, legend=c("desvio padrão","variância"),
       col=c("blue","red"), lty=1, cex=0.8)
dev.off() 
