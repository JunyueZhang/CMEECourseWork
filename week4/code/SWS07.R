rm(list=ls())
graphics.off()
x<-seq(from = -5, to = 5, by = 1)
x
x[[1]]
x[[2]]
x[[9]]
x[[length(x)]]
i<-1
x[[i]]
i<- seq(0,10,1)
i
x[[i[[2]]]]
a<-2
b<-1
y<-a+b*x
plot(x,y)
plot(x,y)
segments(0,-10,0,10, lty=3)
segments(-10,0,10,0,lty=3)
plot(x,y, col="white")
segments(0,-10,0,10, lty=3)
segments(-10,0,10,0,lty=3)
abline(a = 2, b=1)
plot(x,y, col="white")
segments(0,-10,0,10, lty=3)
segments(-10,0,10,0,lty=3)
abline(a = 2, b=1)
points(4,0, col="red", pch=19)
points(-2,6, col="green", pch=9)
points(x,y, pch=c(1,2,3,4,5,6,7,8,9,10,11))
y<-x^2
plot(x,y)
segments(0,-30,0,30, lty=3)
segments(-30,0,30,0,lty=3)
x<-seq(from = -5, to = 5, by = 0.1)
a<- -2
y<-a+x^2
plot(x,y)
segments(0,-30,0,30, lty=3)
segments(-30,0,30,0,lty=3)
plot(x,y)
a<- -2
b<-3
y<-a+b*x^2
points(x,y, pch=19, col="red")
segments(0,-30,0,30, lty=3)
segments(-30,0,30,0,lty=3)
plot(x,y)
a<- -2
b1<- 10
b2<-3
y<-a+b1*x+b2*x^2
points(x,y, pch=19, col="green")
segments(0,-100,0,100, lty=3)
segments(-100,0,100,0,lty=3)

