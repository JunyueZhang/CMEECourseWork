library(ggplot2)


## import the data ##
data <- read.csv("../data/LogisticGrowthDataClean.csv")
quadraticData <- read.csv("../data/LogisticGrowthDataQuadratic.csv")
cubicData <- read.csv("../data/LogisticGrowthDataCubic.csv")
logisticData <- read.csv("../data/LogisticGrowthDataLogistic.csv")
gompertzData <- read.csv("../data/LogisticGrowthDataGompertz.csv")
baranyiData <- read.csv("../data/LogisticGrowthDataBaranyi.csv")


## define three non-linear model functions ##
logistic_model <- function(t, r_max, K, N_0){
  return(N_0 * K * exp(r_max * t)/(K + N_0 * (exp(r_max * t) - 1)))
}


gompertz_model <- function(t, r_max, K, N_0, t_lag){ # Modified gompertz growth model (Zwietering 1990)
  return(N_0 + (K - N_0) * exp(-exp(r_max * exp(1) * (t_lag - t)/((K - N_0) * log(10)) + 1)))
}

baranyi_model <- function(x, y0, mmax, lambda, ymax){
  result = y0 + mmax * (x + (1/mmax) * log(exp(-mmax*x) + exp(-mmax * lambda) - exp(-mmax * (x + lambda)))) - log(1 + ((exp(mmax * (x + (1/mmax) * log(exp(-mmax*x) + exp(-mmax * lambda) - exp(-mmax * (x + lambda)))))-1)/(exp(ymax-y0))))
  return(result)
}

for (i in 1:length(unique(data$ID))){
  data_subset <- subset(data, ID == unique(data$ID)[i]) # subset the data according to the unique ID
  
  timepoints <- seq(0, max(data_subset$Time), 1) # set a series of timepoints
  
  # calculate the corresponding quadratic model values and create a quadratic model data frame
  quadraticvalues <- timepoints^2 * quadraticData$quadratic_Time2[i] + timepoints * quadraticData$quadratic_Time[i] + quadraticData$quadratic_Intercept[i]
  df1 <- data.frame(timepoints, quadraticvalues)
  df1$model <- "Quadratic model"
  names(df1) <- c("Time", "LogPopBio", "model")
  
  # calculate the corresponding cubic model values and create a cubic model data frame
  cubicvalues <- timepoints^3 * cubicData$cubic_Time3[i] + timepoints^2 * cubicData$cubic_Time2[i] + timepoints * cubicData$cubic_Time[i] + cubicData$cubic_Intercept[i]
  df2 <- data.frame(timepoints, cubicvalues)
  df2$model <- "Cubic Polynomial model"
  names(df2) <- c("Time", "LogPopBio", "model")
  
  # calculate the corresponding logistic model values and create a logistic model data frame
  logistic_points <- log(logistic_model(t = timepoints, 
                                        r_max = logisticData$r_max_logistic[i], 
                                        K = logisticData$K_logistic[i], 
                                        N_0 = logisticData$N_0_logistic[i]))
  df3 <- data.frame(timepoints, logistic_points)
  df3$model <- "Logistic model"
  names(df3) <- c("Time", "LogPopBio", "model")
  
  
  # calculate the corresponding gompertz model values and create a gompertz model data frame
  gompertz_points <- gompertz_model(t = timepoints, 
                                    r_max = gompertzData$r_max_gompertz[i], 
                                    K = gompertzData$K_gompertz[i], 
                                    N_0 = gompertzData$N_0_gompertz[i], 
                                    t_lag = gompertzData$t_lag_gompertz[i])
  
  df4 <- data.frame(timepoints, gompertz_points)
  df4$model <- "Gompertz model"
  names(df4) <- c("Time", "LogPopBio", "model")
  
  
  # calculate the corresponding baranyi model values and create a baranyi model data frame
  baranyi_points <- baranyi_model(x = timepoints, 
                                  y0 = baranyiData$y0_baranyi[i], 
                                  mmax = baranyiData$mmax_baranyi[i], 
                                  lambda = baranyiData$lambda_baranyi[i], 
                                  ymax = baranyiData$ymax_baranyi[i])
  df5 <- data.frame(timepoints, baranyi_points)
  df5$model <- "Baranyi model"
  names(df5) <- c("Time", "LogPopBio", "model")
  
  # combine the data frames above#
  if((gompertzData$gompertz_state[i] == "Pass") & (baranyiData$baranyi_state[i] == "Pass")){
    model_frame <- rbind(df1, df2, df3, df4, df5)
  } else if ((gompertzData$gompertz_state[i] == "Fail") & (baranyiData$baranyi_state[i] == "Fail")){
    model_frame <- rbind(df1, df2, df3)
  } else if ((gompertzData$gompertz_state[i] == "Pass") & (baranyiData$baranyi_state[i] == "Fail")){
    model_frame <- rbind(df1, df2, df3, df4)
  } else if ((gompertzData$gompertz_state[i] == "Fail") & (baranyiData$baranyi_state[i] == "Pass")){
    model_frame <- rbind(df1, df2, df3, df5)
  } 
  
  ## plot every curve with the five models overlaid ##
  ggplot(data_subset, aes(x = Time, y = LogPopBio)) +
    geom_point(size = 3) +
    geom_line(data = model_frame, aes(x = Time, y = LogPopBio, col = model), size = 2) +
    theme_bw() + # make the background white
    theme(aspect.ratio=1, text = element_text(size = 17, face = "bold"))+ # make the plot square 
    labs(x = "Time (Hours)", y = "log(Abundance)")
  
  # save the plot above
  ggsave(paste("../results/miniproject", as.character(i), ".png", sep = ""), width = 13.2, height = 14.8)
  
  
}

# import the data
statisticalData <- read.csv("../data/LogisticGrowthDataStatistic.csv")
nrow(statisticalData)
ncol(statisticalData)

# define and initialize some parameters
quadratic_count_AIC <- 0
cubic_count_AIC <- 0
logistic_count_AIC <- 0
gompertz_count_AIC <- 0
baranyi_count_AIC <- 0


## calculate the number of cases with the smallest AIC value in each model ##
for (j in 1:nrow(statisticalData)){
  rowAIC <- c(statisticalData[j,]$quadratic_AIC, statisticalData[j,]$cubic_AIC, statisticalData[j,]$logistic_AIC, statisticalData[j,]$gompertz_AIC, statisticalData[j,]$baranyi_AIC)
  if (which.min(rowAIC) == 1){
    quadratic_count_AIC <- quadratic_count_AIC + 1
  } else if (which.min(rowAIC) == 2){
    cubic_count_AIC <- cubic_count_AIC + 1
  } else if (which.min(rowAIC) == 3){
    logistic_count_AIC <- logistic_count_AIC + 1
  } else if (which.min(rowAIC) == 4){
    gompertz_count_AIC <- gompertz_count_AIC + 1
  } else if (which.min(rowAIC) == 5){
    baranyi_count_AIC <- baranyi_count_AIC + 1
  }
}


# compare the AIC values to explore which model(s) fit(s) best
count_AIC <- c(quadratic_count_AIC, cubic_count_AIC, logistic_count_AIC, gompertz_count_AIC, baranyi_count_AIC)
model_name <- c("Quadratic model", "Cubic Polynomial model", "Logistic model", "Gompertz model", "Baranyi model")
max_count_AIC <- max(count_AIC, na.rm = TRUE)
max_one_AIC <- model_name[which.max(count_AIC)]

sprintf("The %s has the most cases with the smallest AIC value, the count is %d", max_one_AIC, max_count_AIC)

for (z in 1:5){
  print(sprintf("The number of cases with the smallest AIC value in the %s is %d", model_name[z], count_AIC[z]))
}    



# define and initialize some parameters
quadratic_count_BIC <- 0
cubic_count_BIC <- 0
logistic_count_BIC <- 0
gompertz_count_BIC <- 0
baranyi_count_BIC <- 0


## calculate the number of cases with the smallest BIC value in each model ##
for (k in 1:nrow(statisticalData)){
  rowBIC <- c(statisticalData[k,]$quadratic_BIC, statisticalData[k,]$cubic_BIC, statisticalData[k,]$logistic_BIC, statisticalData[k,]$gompertz_BIC, statisticalData[k,]$baranyi_BIC)
  if (which.min(rowBIC) == 1){
    quadratic_count_BIC <- quadratic_count_BIC + 1
  } else if (which.min(rowBIC) == 2){
    cubic_count_BIC <- cubic_count_BIC + 1
  } else if (which.min(rowBIC) == 3){
    logistic_count_BIC <- logistic_count_BIC + 1
  } else if (which.min(rowBIC) == 4){
    gompertz_count_BIC <- gompertz_count_BIC + 1
  } else if (which.min(rowBIC) == 5){
    baranyi_count_BIC <- baranyi_count_BIC + 1
  }
}


# compare the BIC values to explore which model(s) fit(s) best
count_BIC <- c(quadratic_count_BIC, cubic_count_BIC, logistic_count_BIC, gompertz_count_BIC, baranyi_count_BIC)
model_name <- c("Quadratic model", "Cubic Polynomial model", "Logistic model", "Gompertz model", "Baranyi model")
max_count_BIC <- max(count_BIC, na.rm = TRUE)
max_one_BIC <- model_name[which.max(count_BIC)]

sprintf("The %s has the most cases with the smallest BIC value, the count is %d", max_one_BIC, max_count_BIC)

for (o in 1:5){
  print(sprintf("The number of cases with the smallest BIC value in the %s is %d", model_name[o], count_BIC[o]))
}  

## create a plot about the number of cases with the smallest AIC value in each model ##
df_AIC <- data.frame(model_name, count_AIC)
ggplot(df_AIC, aes(x = model_name, y = count_AIC)) +
  geom_bar(stat="identity", fill = "burlywood1") +
  geom_text(aes(label = count_BIC), size = 15) +
  theme_bw() + # make the background white
  theme(aspect.ratio=1, text = element_text(size = 17, face = "bold"))+ # make the plot square 
  labs(x = "Model Name", y = "Count")
ggsave("../results/AIC_Compare.jpg", width = 13.2, height = 14.8)

## create a plot about the number of cases with the smallest BIC value in each model ##
df_BIC <- data.frame(model_name, count_BIC)
ggplot(df_BIC, aes(x = model_name, y = count_BIC)) +
  geom_bar(stat="identity", fill = "darkseagreen2") +
  geom_text(aes(label = count_BIC), size = 15) +
  theme_bw() + # make the background white
  theme(aspect.ratio=1, text = element_text(size = 17, face = "bold"))+ # make the plot square 
  labs(x = "Model Name", y = "Count")
ggsave("../results/BIC_Compare.jpg", width = 13.2, height = 14.8)
