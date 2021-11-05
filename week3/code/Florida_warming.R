rm(list=ls()) # remove global environment
load("../data/KeyWestAnnualMeanTemperature.RData") # load the annual temperature dataset
ls()
cc <- cor(x = ats[,"Year"], y = ats[,"Temp"], use = "everything", method = "pearson")
# compute the appropriate correlation coefficient between years and Temperature
n <- 100
rcc <- c()
for (i in 1:n){
    ats[,"Temp"] <- sample(ats[,"Temp"])
    # repeat this calculation 100 times, each time randomly reshuffling the temperatures
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


print(paste("The approximate, asymptotic p-value is", p_value)) # print the p-value


require(ggpubr)
# draw a scatter plot with the correlation coefficient
sp <- ggscatter(ats, x = "Year", y = "Temp",
                add = "reg.line",  # add a regressin line to the plot
                add.params = list(color = "blue", fill = "yellow"), # customize the regressin line
                conf.int = TRUE # add the confidence interval
)

sp + stat_cor(method = "pearson") # add the correlation coefficient
