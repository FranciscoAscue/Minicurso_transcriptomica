### comandos basicos
getwd() #
setwd() #

ob_2 <- 12
ob_1 <- 21

ob_2 + ob_1 ; ob_2 - ob_1 ; ob_2 * ob_1

vec <- c(1,2,11,3,4,21,5,6)
vec2 <- c("a","b","c")
vec2[2]
vec2[-2]

vec[-c(3,6)]

m1 <- matrix(c(1,2,3,4,5,6,7,8), nrow = 4, ncol = 2)
m2 <- matrix(1:100, 10, 10, byrow = T, dimnames)
colnames(m2) <- c(letters[1:10])
rownames(m2) <- c(1:10)
m2

summary(m2)

ar1 <- array(1:50, dim = c(5,5,2))

ar1[1,,2]

vec <- c(1,2,11,3,4,21,5,6)

plot(vec, main = "Distribución", xlab = "x", ylab = "rango", col="blue")
legend("topright", inset=c(0,0), legend = "plot", title="Leyenda",  pch = 1, col = "blue")

install.packages("viridisLite")
install.packages("viridis")
library(viridisLite)
library(viridis)


barplot(vec, main = "Barplot", xlab = "variables", col = viridis(8))
legend("topright", inset=c(0,0), legend = c("a","b","c","d","e","f","g","h"), title="Leyenda",  pch = 5, col = viridis(8))




vec2 <- c(letters[1:8])
vec3 <- c(10:3)

dataf <- data.frame(vec, vec2, vec3)
dataf$vec3








































