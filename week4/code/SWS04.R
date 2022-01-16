rm(list=ls())
graphics.off()
d<-read.table("../data/SparrowSize.txt", header=TRUE)
d1<-subset(d, d$Tarsus!="NA")
seTarsus<-sqrt(var(d1$Tarsus)/length(d1$Tarsus))
seTarsus
d12001<-subset(d1, d1$Year==2001)
seTarsus2001<-sqrt(var(d12001$Tarsus)/length(d12001$Tarsus))
seTarsus2001
rm(list=ls())
TailLength<-rnorm(500,mean=3.8, sd=2)
summary(TailLength)
length(TailLength)
var(TailLength)
sd(TailLength)
hist(TailLength)
x<-1:length(TailLength)
y<-mean(TailLength)+0*x
min(TailLength)
max(TailLength)
plot(x,y, cex=0.03, ylim=c(2,5),xlim=c(0,500), xlab="Sample size n", ylab="Me
an of tail length ±SE (m)", col="red")
SE<-c(1)
SE
mu<-c(1)
mu
for (n in 1:length(TailLength)) {
  d<-sample(TailLength, n, replace=FALSE)
  mu[n]<-mean(TailLength)
  SE[n]<-sd(TailLength)/sqrt(n)
}
head(SE)
head(mu)
length(SE)
length(mu)
up<-mu+SE
down<-mu-SE
x<-1:length(SE)
segments(x, up, x1=x, y1=down, lty=1)
rm(list=ls())
TailLength<-rnorm(201,mean=3.8, sd=2)
length(TailLength)
x<-1:201
y<-mean(TailLength)+0*x
plot(x,y, cex=0.03, ylim=c(3,4.5),xlim=c(0,201), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
n<-seq(from=1, to=201, by=10)
n
SE<-c(1)
mu<-c(1)
for (i in 1:length(n)) {
  d<-sample(TailLength, n[i], replace=FALSE)
  mu[i]<-mean(TailLength)
  SE[i]<-sd(TailLength)/sqrt(n[i])
}
up<-mu+SE
down<-mu-SE
length(up)
length(n)
plot(x,y, cex=0.03, ylim=c(3,4.5),xlim=c(0,201), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
points(n,mu,cex=0.3, col="red")
segments(n, up, x1=n, y1=down, lty=1)


