rm(list=ls())
graphics.off()
# we never forget this one!
require(WebPower)
0.3/1.2
y<-rnorm(51, mean=1, sd=1.3)
x<-seq(from=0, to=5, by=0.1)
length(x)
plot(hist(y, breaks=10))
mean(y)
sd(y)
segments(x0=(mean(y)), y0=(0), x1=(mean(y)), y1=40, lty=1, col="blue")
# and now 0.25 sd left of the mean (because females are larger)
segments(x0=(mean(y)+0.25*sd(y)), y0=(0), x1=(mean(y)+0.25*sd(y)), y1=40, lty
         =1, col="red")
wp.t(d=0.25, power=0.8, type="two.sample", alternative="two.sided")
res.1<-wp.t(n1=seq(20,300,20), n2=seq(20,300,20), d=0.25, type="two.sample", alternative="two.sided")
res.1
#plot(res.1, xvar='n1', yvar='power')
