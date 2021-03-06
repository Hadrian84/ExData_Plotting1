# Set to English defaults
Sys.setlocale("LC_TIME", "English")

# Extract only data from dates 2007-02-01 and 2007-02-02
house=read.table(file = "household_power_consumption.txt",sep=";",skip=66637,nrows = 2880,
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                               "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                               "Sub_metering_3"))

# WITH CODING: but would take much longer to load
# house=read.table(file = "household_power_consumption.txt",sep=";",header=TRUE)
# house=house[(house$Date=="1/2/2007" | house$Date=="2/2/2007"),]

# Create empty 480*480 png file 
png(file="plot1.png",width=480,height=480,units="px")

# PLOT 1: histogram of "Global Active Power (kilowatts)", main title = "Global Active Power"
hist(house$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()