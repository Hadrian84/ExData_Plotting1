# Set to English defaults
Sys.setlocale("LC_TIME", "English")

# SHORTCUT: Extract only data from dates 2007-02-01 and 2007-02-02
house=read.table(file = "household_power_consumption.txt",sep=";",skip=66637,nrows = 2880,
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power",
                               "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                               "Sub_metering_3"))

# WITH CODING: but would take much longer to load
# house=read.table(file = "household_power_consumption.txt",sep=";",header=TRUE)
# house=house[(house$Date=="1/2/2007" | house$Date=="2/2/2007"),]

x=paste(house$Date,house$Time)
y=strptime(x,"%d/%m/%Y %H:%M:%S")

# Create empty 480*480 png file 
png(file="plot2.png",width=480,height=480,units="px")

# PLOT 4: multiplot:
par(mfrow=c(2,2))
# 1.1 PLOT 2
plot(y,house$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
# 1.2 line plot of "Voltage" according to time (+ xlab: "datetime")
plot(y,house$Voltage,type="l",ylab="Voltage",xlab="datetime")
# 2.1 PLOT 3
plot(y,house$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
points(y,house$Sub_metering_2,ylab="Energy sub metering",type="l",col="red",xlab="")
points(y,house$Sub_metering_3,ylab="Energy sub metering",type="l",col="blue",xlab="")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
# 2.2 line plot of "Global_reactive_power" according to weekdays
plot(y,house$Global_reactive_power,type="l",xlab="datetime")
dev.off()