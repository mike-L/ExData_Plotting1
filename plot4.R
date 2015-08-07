#this script assumes that you are in the same directory as the source data
#setwd('/Users/michaelleung/Dropbox/datascience/Coursera/EDA')

#Read in data
household <- read.delim('household_power_consumption.txt', 
                        na.strings='?', 
                        sep=';', 
                        nrows=207529)
#format dates
household$Date <- as.Date(household$Date, '%d/%m/%Y')
household$Datetime <- strptime(paste(household$Date, household$Time), '%Y-%m-%d %H:%M')

#Subset data
household <- subset(household, Date >= '2007-02-01' & Date <='2007-02-02')

#Generate Chart
png(filename='plot4.png', width=480, height=480)

par(mfrow=c(2,2))
with(household, plot(Datetime,
                     Global_active_power, 
                     ylab='Global Active Power',
                     xlab='',
                     type='l'));

with(household, plot(Datetime, 
                     Voltage, 
                     type='l',
                     ylab='Voltage',
                     xlab='datetime'));

plot(household$Datetime, 
     household$Sub_metering_1, 
     type='l',
     ylab='Energy sub metering',
     xlab='')
lines(household$Datetime, household$Sub_metering_2, col='red')
lines(household$Datetime, household$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), 
       col=c('black','red','blue'), 
       lwd=0.5, 
       cex=1,
       bty='n')

with(household, plot(Datetime, Global_reactive_power, type='l', xlab='datetime'));

dev.off()
