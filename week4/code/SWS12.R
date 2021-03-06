rm(list=ls())
graphics.off()
d<-read.table("../data/SparrowSize.txt", header=TRUE)
d1<-subset(d, d$Wing!="NA")
summary(d1$Wing)

hist(d1$Wing)
model1<-lm(Wing~Sex.1,data=d1)
summary(model1)
boxplot(d1$Wing~d1$Sex.1, ylab="Wing length (mm)")

anova(model1)
t.test(d1$Wing~d1$Sex.1, var.equal=TRUE)
boxplot(d$Mass~d$Year)

m2<-lm(Mass~as.factor(Year),data=d)
anova(m2)

summary(m2)
am2<-aov(Mass~as.factor(Year),data=d)
summary(am2)

TukeyHSD(am2)
boxplot(d1$Wing~d1$BirdID, ylab="Wing length (mm)")
require(dplyr)
tbl_df(d1)

glimpse(d1)
d$Mass %>% cor.test(d$Tarsus, na.rm=TRUE)

d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID))

d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID))

d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID)) %>%
  count(count)

model3<-lm(Wing~as.factor(BirdID), data=d1)
anova(model3)

d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID))
d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID)) %>%
  count(count)
d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID)) %>%
  summarise (sum(count))

d1 %>%
  group_by(BirdID) %>%
  summarise (count=length(BirdID)) %>%
  summarise (sum(count^2))
7307/1695
1695-7307/1695
(1/617)*(1695-7307/1695)

model3<-lm(Wing~as.factor(BirdID), data=d1)
anova(model3)

((13.20-1.62)/2.74)/(1.62+(13.20-1.62)/2.74)





