# set working directory (change this to fit your needs)
setwd('~/Documents/my_coursera2/explatory_data_analyses')

# make sure the plots folder exists
if (!file.exists('plots')) {
        dir.create('plots')
}

# load data
source('Expl_analysis_proj1.R')

# open device
png(filename='plots/plot2.png',width=480,height=480,units='px')

# plot data
plot(power.cons$DateTime,power.cons$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')

# close device
x<-dev.off()
