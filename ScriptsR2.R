library("meds")
library("viridis")
library("viridisLite")


SA42911 <- read.table("SA42911_0.histo", header = F)

plot(SA42911[2:20,],type="l",lwd = 3, main = "Analisis de Kmeros", xlab = "Profundidad", ylab = "Frecuencia" , ylim=c(0,400000000),col="red")
lines(SA42912[2:20,],type="l", lwd = 3, col="darkblue")
lines(SA42913[2:20,],type="l", lwd = 3, col="green")
lines(SA42914[2:20,],type="l", lwd = 3, col="purple")
legend("topright", inset=c(0,0), legend=c("SA42911","SA42912","SA42913","SA42914"), fill = c("red","darkblue","green","purple"), title="Leyenda", pch = c(1,2,3,4))
grid(20, 25,lwd= 1, lty = 2)


cuadro <- read.csv("Libro3.csv", header = T, sep = ";")
filtrado <- cuadro[c(1:6),c(1:11)]
filtrado1 <- filtrado[,-1]
rownames(filtrado1) <- c("Input", "Total", "Both", "Forward", "Reverse", "Dropped")

barplot(as.matrix(filtrado1), beside = TRUE, col = rainbow(6))
legend("topright", 
       legend = rownames(filtrado1), 
       fill = rainbow(6))



if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")


library(VariantAnnotation)
