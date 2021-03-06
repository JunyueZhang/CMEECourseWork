rm(list=ls()) # remove global environment
graphics.off() # shut down all open graphics devices
load("../data/KeyWestAnnualMeanTemperature.RData") # load the annual temperature dataset
ls()
cc <- cor(x = ats[,"Year"], y = ats[,"Temp"], use = "everything", method = "pearson")
# compute the appropriate correlation coefficient between years and Temperature
n <- 10000
rcc <- c()
for (i in 1:n){
    ats[,"Temp"] <- sample(ats[,"Temp"])
    # repeat this calculation 10000 times, each time randomly reshuffling the temperatures
    temp <- cor(x = ats[,"Year"], y = ats[,"Temp"], use = "everything", method = "pearson")
    # recalculate the correlation coefficient and store it in the "temp" variable
    rcc <- append(rcc, temp) # append "temp" variable to rcc
} 

count <- 0

for (j in rcc){
    if(j > cc){ # if any element in rcc is greater than cc, count plus one
        count <- count + 1
    }
} 
p_value <- count / n # calculate the fraction of the random correlation coefficients greater than the observed one


print(paste("The approximate, asymptotic p-value is", p_value)) # print out the p-value
hist(rcc, xlab = "Correlation Coefficient", xlim = c(-0.4, 0.4), ylim = c(0, 2000), col = "pink", main = "Histogram of correlation coefficients")
# plot the histogram