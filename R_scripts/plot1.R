setwd('~/Documents/my_coursera2/explatory_data_analyses/power_data')

# make sure the plots folder exists
if (!file.exists('plots')) { dir.create('plots')}

# load data
source('Expl_analysis_proj1.R')

# open device
png(filename='plots/plot1.png',width=480,height=480,units='px')

# plot data
hist(power.cons$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')

# Turn off device
x<-dev.off()
