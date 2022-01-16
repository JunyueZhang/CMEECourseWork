rm(list=ls())
graphics.off()
x<-c(1,2,3,4,8)
y<-c(4,3,5,7,9)
x
mean(x)
var(x)
y
mean(y)
var(y)
model1 <- (lm(y~x))
model1
summary(model1)
coefficients(model1)
resid(model1)
mean(resid(model1))
var(resid(model1))
length(resid(model1))
summary(model1)
plot(y~x, pch=19)
plot(y~x, pch=19, xlim=c(0,8.5), ylim=c(0,9.5))
segments(0,-30,0,30, lty=3)
segments(-30,0,30,0,lty=3)
coefficients(model1)
abline(2.62, 0.83)
x<-seq(from=-10, to=10, by=0.2)
x
y<- 7.1-0.2 * x
y
summary(lm(y~x))
plot(y~x)
y<- 7.1-0.2 * x + runif(length(x))
summary(lm(y~x))

