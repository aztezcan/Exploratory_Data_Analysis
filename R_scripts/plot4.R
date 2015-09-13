setwd('~/Documents/my_coursera2/explatory_data_analyses')

# make sure the plots folder exists
if (!file.exists('plots')) {
        dir.create('plots')
}

# load data
source('Expl_analysis_proj1.R')

# open device
png(filename='plots/plot4.png',width=480,height=480,units='px')

# make 4 plots
par(mfrow=c(2,2))

# plot data on top left (1,1)
plot(power.cons$DateTime,power.cons$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plot data on top right (1,2)
plot(power.cons$DateTime,power.cons$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot data on bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.cons$DateTime,power.cons$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.cons$DateTime,power.cons$SubMetering2,col=lncol[2])
lines(power.cons$DateTime,power.cons$SubMetering3,col=lncol[3])

# plot data on bottom right (2,2)
plot(power.cons$DateTime,power.cons$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

# close device
x<-dev.off()
