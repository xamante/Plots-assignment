#read file in your wd#
energy <- read.csv("household_power_consumption.txt",sep = ";")
#format date and time#
energy$Date2 <- as.Date(energy$Date,format="%d/%m/%Y")
energy <- subset(energy,Date2=="2007-02-02" | Date2=="2007-02-01")
#format variables as numeric so the scale in the graphs is appropiate#
energy$Global_active_power2 <- as.numeric(as.character(energy$Global_active_power))
energy$Time2 <- strptime(as.character(energy$Time),format = "%H:%M:%S")
energy$Global_reactive_power <- as.numeric(as.character(energy$Global_reactive_power))
energy$Voltage <- as.numeric(as.character(energy$Voltage))
#create a single variable for date and time#
Sys.setlocale("LC_TIME", "en_US")
energy$date_time <- strptime((paste(energy$Date2, energy$Time)), format="%Y-%m-%d %H:%M:%S")
#initialize the plot file#
png(file="plot4.png")
par(mfrow = c(2, 2))
##Add plot1##
with(energy,plot(type= "line",y=Global_active_power2,x = date_time,xlab="" ,ylab="Global Active Power (kilowatts)"))
##Add plot2##
with(energy,plot(type= "line",y=Voltage,x = date_time,ylab="Voltage",xlab="datetime"))
##Add plot3##
with(energy,plot(type= "line",y=Sub_metering_1,x = date_time,xlab="" ,ylab="Energy sub metering",ylim = c(0,35)))
lines(energy$Sub_metering_2,col="red",x = energy$date_time)
lines(energy$Sub_metering_3,col="blue",x = energy$date_time)
legend(bty="n",lty=c(1,1),"topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

##Add plot4##
plot(type="line",y=energy$Global_reactive_power,x=energy$date_time,xlab = "datetime")
dev.off()
