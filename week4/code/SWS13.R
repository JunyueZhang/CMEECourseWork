a<-read.table("../data/Wylde_single.mounted.txt", header=T)
head(a)
library(lme4)

lmm1<-lmer(Femur_length~1+(1|ID), data=a)

summary(lmm1)
Repeatability<-1.257/(1.257+0.0003)
Repeatability
