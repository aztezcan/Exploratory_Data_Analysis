
setwd('~/Documents/my_coursera2/explatory_data_analyses')

# make sure the plots folder exists
if (!file.exists('plots')) {
        dir.create('plots')
}

# load data
source('Expl_analysis_proj1.R')

# open device
png(filename='plots/plot3.png',width=480,height=480,units='px')

# plot data
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.cons$DateTime,power.cons$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(power.cons$DateTime,power.cons$SubMetering2,col=lncol[2])
lines(power.cons$DateTime,power.cons$SubMetering3,col=lncol[3])

# add legend
legend('topright',legend=lbls,col=lncol,lty='solid')

# close device
x<-dev.off()
