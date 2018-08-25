#######################################
# TAREA1 METODOLOGÍA POLÍTICA AVANZADA#
#######################################

#C. DANIELA BALTAZAR c.#
# 138904#
rm(list=ls()) 
setwd("~")
setwd ("/Users/C Daniela Baltazar C/Documents/13/MPA/Tarea1/Datos")
#1. IMPORTANDO DATOS
base1 <- "Regimes and the economy 1947-2010.dta"
base2 <- "Regimes and the economy (Brazil) 1947-2010.dta"
base3 <- "Regimes and the economy 1968.dta"

library(readstata13)

datos <- read.dta13(base1)
datosBrazil <- read.dta13(base2)
datos68 <- read.dta13(base3)

#Para responder la pregunta 1:
dim(datos)
summary(datos)
dim(datosBrazil)
summary(datosBrazil)
dim(datos68)
summary(datos68)

#ESTADÍSTICAS DESCRIPTIVAS:
#Para responder la pregunta 2:

#(1)#
mean(datos68$gdpHead)
mean(datos68$gdpHead_lag)

#(2)
median(datos68$gdpHead)
vecesmayormediaquemediana <- mean(datos68$gdpHead)/median(datos68$gdpHead)
vecesmayormediaquemediana

#(3)
median(datos68$growth)
crecimientopromedioanual<- mean(datos68$gdpHead)/mean(datos68$gdpHead_lag)
crecimientopromedioanual

#(4)
datos68$growth_own <- (datos68$gdpHead/datos68$gdpHead_lag)
mean(datos68$growth_own)
median(datos68$growth_own)
mean(datos68$growth)
median(datos68$growth)

#(5)
table(datos68$democracy)
table(datos68$autocracy)

#(6)
mean(datos68[datos68$democracy==1,]$gdpHead)
mean(datos68[datos68$autocracy==1,]$gdpHead)

#(7)
mean(datos68[datos68$democracy==1,]$growth)
mean(datos68[datos68$autocracy==1,]$growth)

#(8)
mean(datosBrazil[datosBrazil$democracy==1,]$gdpHead)
mean(datosBrazil[datosBrazil$autocracy==1,]$gdpHead)
mean(datosBrazil[datosBrazil$democracy==1,]$growth)
mean(datosBrazil[datosBrazil$autocracy==1,]$growth)


#3.VISUALIZACIÓN#
#(1)
library(ggplot2)
#(3.1)
grafica3.1 <- ggplot(datos68, aes(x=gdpHead))+geom_density() + geom_vline (xintercept=mean(datos68$gdpHead), color="green") + geom_vline (xintercept=median(datos68$gdpHead), color="blue")
#(3.2)
datos68$log_gdpHead <- log (datos68$gdpHead)

grafica3.2 <- ggplot(datos68, aes(x=log_gdpHead))+geom_density() + geom_vline (xintercept=mean(datos68$log_gdpHead), color="yellow") + geom_vline (xintercept=median(datos68$log_gdpHead), color="pink")

#(3.3)

grafica3.3demo <- ggplot(datos68[datos68$democracy==1,], aes(x=gdpHead)) + geom_density(color="cornflowerblue") + geom_vline (xintercept=mean(datos68[datos68$democracy==1,]$gdpHead))

grafica3.3auto <- ggplot(datos68[datos68$autocracy==1,], aes(x=gdpHead)) + geom_density(color="darkmagenta") + geom_vline (xintercept=mean(datos68[datos68$autocracy==1,]$gdpHead))

#(3.4)

grafica3.4 <- ggplot(datos68, aes(x=gdpHead_lag, y=gdpHead)) + geom_point(color="hotpink") + geom_abline()

#(3.5)

grafica3.5 <- ggplot(datosBrazil, aes(x=year, y=gdpHead)) + geom_point(color="lightseagreen")
# para línea que una los puntos:
grafica3.5 <- ggplot(datosBrazil, aes(x=year, y=gdpHead)) + geom_point(color="magenta") + geom_line()
