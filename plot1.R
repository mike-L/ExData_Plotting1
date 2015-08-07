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

#generate plot
png(filename='plot1.png', width=480, height=480)
with(household, hist(Global_active_power, 
                     col='Red', 
                     xlab='Global Active Power (kilowatts)', 
                     main='Global Active Power'))
dev.off()
