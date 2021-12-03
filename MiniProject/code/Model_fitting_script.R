data <- read.csv("../data/LogisticGrowthDataClean.csv") # import data from the csv file
require("minpack.lm")


## define and initialize some important parameters ##
quadratic_R_Squared <- c()
quadratic_AIC <- c()
quadratic_BIC <- c()

cubic_R_Squared <- c()
cubic_AIC <- c()
cubic_BIC <- c()

logistic_AIC <- c()
logistic_BIC <- c()
logistic_R_Squared <- c()

gompertz_AIC <- c()
gompertz_BIC <- c()
gompertz_R_Squared <- c()

baranyi_AIC <- c()
baranyi_BIC <- c()
baranyi_R_Squared <- c()


logistic_success <- 0
gompertz_success <- 0
baranyi_success <- 0

logistic_fail <- 0
gompertz_fail <- 0
baranyi_fail <- 0

quadratic_Time2 <- c()
quadratic_Time <- c()
quadratic_Intercept <- c()


cubic_Time3 <- c()
cubic_Time2 <- c()
cubic_Time <- c()
cubic_Intercept <- c()



r_max_logistic <- c()
K_logistic <- c()
N_0_logistic <- c()
logistic_state <- c()

r_max_gompertz <- c()
K_gompertz <- c()
N_0_gompertz <- c()
t_lag_gompertz <- c()
gompertz_state <- c()

y0_baranyi <- c()
ymax_baranyi <- c()
mmax_baranyi <- c()
lambda_baranyi <- c()
baranyi_state <- c()




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
  
  head(data_subset) # have a look at the subset data
  dim(data_subset)
  str(data_subset)
  
  lm_growth <- lm(LogPopBio ~ Time, data = data_subset) # fit a linear model using OLS
  summary(lm_growth)
  
  
  ## fit a linear quadratic curve model ##
  #data_subset$Time2 <- data_subset$Time^2
  #quadraticModel <- lm(LogPopBio ~ Time + Time2, data = data_subset)
  quadraticModel <- lm(LogPopBio ~ poly(Time, 2, raw = TRUE), data = data_subset)
  summary(quadraticModel)
  
  ## append the coefficients of the quadratic model to the corresponding vectors ##
  quadratic_Time2 <- append(quadratic_Time2, as.numeric(quadraticModel$coefficients[3]))
  quadratic_Time <- append(quadratic_Time, as.numeric(quadraticModel$coefficients[2]))
  quadratic_Intercept <- append(quadratic_Intercept, as.numeric(quadraticModel$coefficients[1]))
  
  # append the AIC, BIC, R^2
  quadratic_R_Squared <- append(quadratic_R_Squared, summary(quadraticModel)$r.squared) # append R^2
  quadratic_AIC <- append(quadratic_AIC, AIC(quadraticModel))
  quadratic_BIC <- append(quadratic_BIC, BIC(quadraticModel))
  
  
  ## fit a linear cubic curve model ##
  #data_subset$Time3 <- data_subset$Time^3
  #cubicModel1 <- lm(LogPopBio ~ Time + Time2 + Time3, data = data_subset)
  cubicModel <- lm(LogPopBio ~ poly(Time, 3, raw = TRUE), data = data_subset)
  summary(cubicModel)
  
  ## append the coefficients of the cubic model to the corresponding vectors ##
  cubic_Time3 <- append(cubic_Time3, as.numeric(cubicModel$coefficients[4]))
  cubic_Time2 <- append(cubic_Time2, as.numeric(cubicModel$coefficients[3]))
  cubic_Time <- append(cubic_Time, as.numeric(cubicModel$coefficients[2]))
  cubic_Intercept <- append(cubic_Intercept, as.numeric(cubicModel$coefficients[1]))
  
  # append the AIC, BIC, R^2
  cubic_R_Squared <- append(cubic_R_Squared, summary(cubicModel)$r.squared)
  cubic_AIC <- append(cubic_AIC, AIC(cubicModel))
  cubic_BIC <- append(cubic_BIC, BIC(cubicModel))

  ## define some starting parameters of the logistic model ##
  N_0_start <- min(data_subset$PopBio) # lowest population size
  K_start <- max(data_subset$PopBio) # highest population size
  r_max_start <- as.numeric(coef(lm_growth)["Time"]) # use the estimate from the OLS fitting from above
  
  ## fit the logistic model ##
  fit_logistic <- try(nlsLM(PopBio ~ logistic_model(t = Time, r_max, K, N_0), data_subset, 
                            list(r_max = r_max_start, N_0 = N_0_start, K = K_start)), silent = FALSE)
  
  if(class(fit_logistic) != "try-error"){       
    summary(fit_logistic)
    
    ## append the coefficients of the logistic model to the corresponding vectors ##
    r_max_logistic <- append(r_max_logistic, coef(fit_logistic)["r_max"])
    K_logistic <- append(K_logistic, coef(fit_logistic)["K"])
    N_0_logistic <- append(N_0_logistic, coef(fit_logistic)["N_0"])
    
    RSS_Log <- sum(residuals(fit_logistic)^2) # Residual sum of squares
    TSS_Log <- sum((data_subset$LogPopBio - mean(data_subset$LogPopBio))^2) # Total sum of squares
    RSq_Log <- 1 - (RSS_Log/TSS_Log) # R-squared value
    
    # append the AIC, BIC, R^2
    logistic_AIC <- append(logistic_AIC, AIC(fit_logistic))
    logistic_BIC <- append(logistic_BIC, BIC(fit_logistic))
    logistic_R_Squared <- append(logistic_R_Squared, RSq_Log)
    logistic_state <- append(logistic_state, "Pass")
    
    logistic_success <- logistic_success + 1
    
  } else {
    r_max_logistic <- append(r_max_logistic, NA)
    K_logistic <- append(K_logistic, NA)
    N_0_logistic <- append(N_0_logistic, NA)
    
    logistic_AIC <- append(logistic_AIC, NA)
    logistic_BIC <- append(logistic_BIC, NA)
    logistic_R_Squared <- append(logistic_R_Squared, NA)
    logistic_state <- append(logistic_state, "Fail")
    
    logistic_fail <- logistic_fail + 1
  }
  
  # subset the data into a third in order to find the lag time 
  thirdTime <- max(data_subset$Time)/3
  thirdTime_subset <- subset(data_subset, Time < thirdTime)
  
  ## define some starting parameters of the gompertz model ##
  N_0_start_log <- min(data_subset$LogPopBio) # lowest population size, note log scale
  K_start_log <- max(data_subset$LogPopBio) # highest population size, note log scale
  r_max_start_log <- as.numeric(coef(lm_growth)["Time"]) # use the previous estimate from the OLS fitting from above
  t_lag_start_log <- thirdTime_subset$Time[which.max(diff(diff(thirdTime_subset$LogPopBio)))] # find last timepoint of lag phase
  
  # fit the gompertz model
  fit_gompertz <- try(nlsLM(LogPopBio ~ gompertz_model(t = Time, r_max, K, N_0, t_lag), data_subset,
                            list(t_lag=t_lag_start_log, r_max=r_max_start_log, N_0 = N_0_start_log, K = K_start_log), control = list(maxiter = 200)), silent = FALSE)
  
  
  if(class(fit_gompertz) != "try-error"){
    summary(fit_gompertz)
    
    ## append the coefficients of the gompertz model to the corresponding vectors ##
    r_max_gompertz <- append(r_max_gompertz, coef(fit_gompertz)["r_max"])
    K_gompertz <- append(K_gompertz, coef(fit_gompertz)["K"])
    N_0_gompertz <- append(N_0_gompertz, coef(fit_gompertz)["N_0"])
    t_lag_gompertz <- append(t_lag_gompertz, coef(fit_gompertz)["t_lag"])
    
    
    # append the AIC, BIC, R^2
    RSS_Gom <- sum(residuals(fit_gompertz)^2) # Residual sum of squares
    TSS_Gom <- sum((data_subset$LogPopBio - mean(data_subset$LogPopBio))^2) # Total sum of squares
    RSq_Gom <- 1 - (RSS_Gom/TSS_Gom) # R-squared value
    
    gompertz_AIC <- append(gompertz_AIC, AIC(fit_gompertz))
    gompertz_BIC <- append(gompertz_BIC, BIC(fit_gompertz))
    gompertz_R_Squared <- append(gompertz_R_Squared, RSq_Gom)
    gompertz_state <- append(gompertz_state, "Pass")
    
    gompertz_success <- gompertz_success + 1
  } else {
    r_max_gompertz <- append(r_max_gompertz, NA)
    K_gompertz <- append(K_gompertz, NA)
    N_0_gompertz <- append(N_0_gompertz, NA)
    t_lag_gompertz <- append(t_lag_gompertz, NA)
    
    gompertz_AIC <- append(gompertz_AIC, NA)
    gompertz_BIC <- append(gompertz_BIC, NA)
    gompertz_R_Squared <- append(gompertz_R_Squared, NA)
    gompertz_state <- append(gompertz_state, "Fail")
    
    gompertz_fail <- gompertz_fail + 1
  }
  
  ## define some starting parameters of the baranyi model ## 
  y0_start <- min(data_subset$LogPopBio) # lowest population size, note log scale
  ymax_start <- max(data_subset$LogPopBio) # highest population size, note log scale
  mmax_start <- as.numeric(coef(lm_growth)["Time"]) # use the previous estimate from the OLS fitting from above
  lambda_start <- thirdTime_subset$Time[which.max(diff(diff(thirdTime_subset$LogPopBio)))] # find last timepoint of lag phase
  
  # fit the baranyi model
  fit_baranyi <- try(nlsLM(LogPopBio ~ baranyi_model(x = Time, y0, mmax, lambda, ymax), data_subset, 
                           list(y0 = y0_start, mmax = mmax_start, lambda = lambda_start , ymax = ymax_start)), silent = FALSE)
  if(class(fit_baranyi) != "try-error"){
    summary(fit_baranyi)
    
    ## append the coefficients of the baranyi model to the corresponding vectors ##
    y0_baranyi <- append(y0_baranyi, coef(fit_baranyi)["y0"])
    ymax_baranyi <- append(ymax_baranyi, coef(fit_baranyi)["ymax"])
    mmax_baranyi <- append(mmax_baranyi, coef(fit_baranyi)["mmax"])
    lambda_baranyi <- append(lambda_baranyi, coef(fit_baranyi)["lambda"])
    
    # append the AIC, BIC, R^2
    RSS_Bar <- sum(residuals(fit_baranyi)^2) # Residual sum of squares
    TSS_Bar <- sum((data_subset$LogPopBio - mean(data_subset$LogPopBio))^2) # Total sum of squares
    RSq_Bar <- 1 - (RSS_Bar/TSS_Bar) # R-squared value
    
    baranyi_AIC <- append(baranyi_AIC, AIC(fit_baranyi))
    baranyi_BIC <- append(baranyi_BIC, BIC(fit_baranyi))
    baranyi_R_Squared <- append(baranyi_R_Squared, RSq_Bar)
    baranyi_state <- append(baranyi_state, "Pass")
    
    baranyi_success <- baranyi_success + 1
  } else {
    y0_baranyi <- append(y0_baranyi, NA)
    ymax_baranyi <- append(ymax_baranyi, NA)
    mmax_baranyi <- append(mmax_baranyi, NA)
    lambda_baranyi <- append(lambda_baranyi, NA)
    
    baranyi_AIC <- append(baranyi_AIC, NA)
    baranyi_BIC <- append(baranyi_BIC, NA)
    baranyi_R_Squared <- append(baranyi_R_Squared, NA)
    baranyi_state <- append(baranyi_state, "Fail")
    
    baranyi_fail <- baranyi_fail + 1
  }
  
} 


## create and export some data frames to the corresponding csv files ##
ID <- 1:length(unique(data$ID))
statisticalDF <- data.frame(ID, quadratic_R_Squared, quadratic_AIC, quadratic_BIC, cubic_R_Squared, cubic_AIC, cubic_BIC, logistic_R_Squared, logistic_AIC, logistic_BIC, gompertz_R_Squared, gompertz_AIC, gompertz_BIC, baranyi_R_Squared, baranyi_AIC, baranyi_BIC)
write.csv(statisticalDF, "../data/LogisticGrowthDataStatistic.csv")

quadraticDF <- data.frame(ID, quadratic_Time2, quadratic_Time, quadratic_Intercept, quadratic_R_Squared, quadratic_AIC, quadratic_BIC)
write.csv(quadraticDF, "../data/LogisticGrowthDataQuadratic.csv")

cubicDF <- data.frame(ID, cubic_Time3, cubic_Time2, cubic_Time, cubic_Intercept, cubic_R_Squared, cubic_AIC, cubic_BIC)
write.csv(cubicDF, "../data/LogisticGrowthDataCubic.csv")

logisticDF <- data.frame(ID, r_max_logistic, K_logistic, N_0_logistic, logistic_R_Squared, logistic_AIC, logistic_BIC, logistic_state)
write.csv(logisticDF, "../data/LogisticGrowthDataLogistic.csv")

gompertzDF <- data.frame(ID, r_max_gompertz, K_gompertz, N_0_gompertz, t_lag_gompertz, gompertz_R_Squared, gompertz_AIC, gompertz_BIC, gompertz_state)
write.csv(gompertzDF, "../data/LogisticGrowthDataGompertz.csv")

baranyiDF <- data.frame(ID, y0_baranyi, ymax_baranyi, mmax_baranyi, lambda_baranyi, baranyi_R_Squared, baranyi_AIC, baranyi_BIC, baranyi_state)
write.csv(baranyiDF, "../data/LogisticGrowthDataBaranyi.csv")

print(sprintf("The logistic model succeeded %d times and failed %d times", logistic_success, logistic_fail))

print(sprintf("The gompertz model succeeded %d times and failed %d times", gompertz_success, gompertz_fail))

print(sprintf("The baranyi model succeeded %d times and failed %d times", baranyi_success, baranyi_fail))

print("The Model fitting script is finished, please wait patiently for the Final plotting and analysis script to run, thank you :)")