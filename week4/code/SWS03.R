rm(list=ls())
graphics.off()
d<-read.table("../data/SparrowSize.txt", header=T)
str(d)
d$BirdIDFact<-as.factor(d$BirdID)
str(d$BirdIDFact)
mean(d$BirdID)
mean(d$BirdIDFact)
plot(d$Mass~as.factor(d$Year), xlab="Year", ylab="House sparrow body
mass(g)")
plot(d$Mass~d$Year, xlab="Year", ylab="House sparrow body mass(g)")
rm(list=ls())
b<-read.table("../data/BTLD.txt", header=T)
str(b)
mean(b$ClutchsizeAge7, na.rm = TRUE)
plot(b$LD.in_AprilDays.~b$Year, ylab="Laying date (April days)", xlab="Year",
     pch=19, cex=0.3)
plot(b$LD.in_AprilDays.~jitter(b$Year), ylab="Laying date (April days)",
     xlab="Year", pch=19, cex=0.3)
require(ggplot2)
p <- ggplot(b, aes(x=Year, y=LD.in_AprilDays.)) +
  geom_violin()
p
boxplot(b$LD.in_AprilDays.~b$Year, ylab="Laying date (April days)",
        xlab="Year")
p <- ggplot(b, aes(x=as.factor(Year), y=LD.in_AprilDays.)) +
  geom_violin()
p
p + stat_summary(fun.data="mean_sdl",
                  geom="pointrange")

