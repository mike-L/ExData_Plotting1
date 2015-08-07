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
png(filename='plot2.png', width=480, height=480)
with(household, plot(Datetime, 
                     Global_active_power, 
                     type='l',
                     ylab='Global Active Power (kilowatts)',
                     xlab=''))
dev.off()