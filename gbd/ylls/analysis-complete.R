# A brief look at self harm data, downloaded from http://ihmeuw.org/3zn8

# Set up 
library(dplyr)
setwd('~/Documents/info-498c/demos/gbd/ylls/')

# Set margin spacing for graphics
par(mar=c(5,4,4,2))

# Load data
self.harm.data <- read.csv('data/prepped/self-harm.csv')

# Deal with string age-groups
self.harm.data <- self.harm.data %>% 
                      filter(Value > 0) %>% 
                      mutate(age.group = substr(Age, 1, 2))

###########################################################################
### Create a plot of the death rate (deaths per 100K) in each age-group ###
###########################################################################

# Subset the data
death.data <- self.harm.data %>% filter(Measure == 'Deaths per 100,000')

# Create chart
png('charts/self-harm-deaths.png', width = 4, height = 4, units = 'in', res=300)
plot(death.data$age.group, 
     death.data$Value,
     xlab = 'Age-Group', 
     ylab = "Deaths",
     title(main ="Self Harm Deaths / 100K in Colombia"))
dev.off()

#######################################################################
### Create a plot of the yll rate (ylls per 100K) in each age-group ###
#######################################################################

yll.data <- self.harm.data %>% filter(Measure != 'Deaths per 100,000')

# Plot YLL data
png('charts/self-harm-ylls.png', width = 4, height = 4, units = 'in', res=300)
plot(yll.data$age.group, 
     yll.data$Value,
     xlab = 'Age-Group', 
     ylab = "YLLs",
     title(main ="Self Harm YLLs / 100K in Colombia"))
dev.off()