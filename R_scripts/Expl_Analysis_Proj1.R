library(data.table)
library(lubridate)
library(downloder)

setwd('~/Documents/my_coursera2/explatory_data_analyses/power_data')

# check to see if the existing tidy data set exists; if not, make it...
if (!file.exists('power_cons.txt')) {
        
        # download the zip file and unzip
        file.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
        download(file.url, destfile='power_cons.zip')
        unzip('power_cons.zip')
        
        # read the raw table and limit to 2 days
        variable.class <- c(rep('character',2),rep('numeric',7))
        power.cons <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', colClasses=variable.class)
        power.cons <-power.cons[power.cons$Date=='1/2/2007' | power.cons$Date=='2/2/2007',]
        
        # clean up the variable names and convert date/time fields
        cols <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower', 'Voltage', 'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')
        colnames(power.cons) <- cols
        power.cons$DateTime <- dmy(power.cons$Date)+hms(power.cons$Time)
        power.cons <- power.cons[,c(10,3:9)]
        
        # write a clean data set to the directory
        write.table(power.cons, file='power_cons.txt', sep='|', row.names=FALSE)} else { 
                power.cons <- read.table('power_cons.txt', header=TRUE, sep='|')
                power.cons$DateTime <- as.POSIXlt(power.cons$DateTime)}
