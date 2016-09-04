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
png(file="plot2.png")
with(energy,plot(type= "line",y=Global_active_power2,x = date_time,xlab="" ,ylab="Global Active Power (kilowatts)"))
dev.off()



