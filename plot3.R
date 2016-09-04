#read file in your wd#
energy <- read.csv("household_power_consumption.txt",sep = ";")
#format date and time#
energy$Date2 <- as.Date(energy$Date,format="%d/%m/%Y")
energy <- subset(energy,Date2=="2007-02-02" | Date2=="2007-02-01")
energy$Global_active_power2 <- as.numeric(as.character(energy$Global_active_power))
energy$Time2 <- strptime(as.character(energy$Time),format = "%H:%M:%S")
#create a single variable for date and time#
Sys.setlocale("LC_TIME", "en_US")
energy$date_time <- strptime((paste(energy$Date2, energy$Time)), format="%Y-%m-%d %H:%M:%S")
#initialize the plot file#
png(file="plot3.png")
with(energy,plot(type= "line",y=Sub_metering_1,x = date_time,xlab="" ,ylab="Energy sub metering",ylim = c(0,35)))
lines(energy$Sub_metering_2,col="red",x = energy$date_time)
lines(energy$Sub_metering_3,col="blue",x = energy$date_time)
legend(lty=c(1,1),"topright", col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()

