library(rjags)
##Set working directory
#setwd("H:/StrategicInitiatives/Research & Analytics/Ridership Analysis/Data and Models/By Route")
options(digits=2)
theme_set(theme_bw())

express = read.csv("express.csv")
n=length(express[,1])
rides = (express$ridership.counts/1000)[2:n]
lagRides = (express$ridership.counts/1000)[1:(n-1)]
temp = express$Temperature[2:n]
ei = express$econ_index[2:n]

#NEWSPECIFYMODEL
RidershipModel = "model{
#Data
for(i in 1:71){
ridership[i] ~ dnorm(mu[i], tau)
mu[i] <- beta0 + beta2*ridershiplag[i] 
+ beta3*economicindex[i]
+ beta5*temperature[i]
}
#Prior
beta0 ~ dnorm(0.00001,10)
beta2 ~ dnorm(0.00001, 2)
beta3 ~ dnorm(0.00001, 2)
beta5 ~ dnorm(0.00001, 2)
tau ~ dgamma(1, .5)
}"
#Run the model in jags
RIDE = jags.model(textConnection(RidershipModel), 
                  data = list(ridership = rides, 
                              ridershiplag=lagRides,
                              economicindex = ei, 
                              temperature = temp
                  ))
set.seed(100)
Ridesample = coda.samples(RIDE, variable.names=c("beta0", "beta2","beta3","beta5"
                                                 ,"tau"), n.iter=10000)
samp=data.frame(Ridesample[[1]])
beta0=samp$beta0
beta2=samp$beta2
beta3=samp$beta3
beta5=samp$beta5
#END JAGS HERE

forecast = function(ei=150,temp=10) {
  lagRides = (express$ridership.counts/1000)[length(express$ridership.counts)]
  return(beta0+beta2*lagRides+beta3*ei+beta5*temp)
}

