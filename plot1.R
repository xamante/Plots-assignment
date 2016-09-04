#read file in your wd#
energy <- read.csv("household_power_consumption.txt",sep = ";")
#format date and time#
energy$Date2 <- as.Date(energy$Date,format="%d/%m/%Y")
energy <- subset(energy,Date2=="2007-02-02" | Date2=="2007-02-01")
energy$Global_active_power2 <- as.numeric(as.character(energy$Global_active_power))
#initialize the plot file#
png(file="plot1.png")
with(energy,hist(Global_active_power2,col="red", main = "Global Active Power",xlab = "Global cCtive Power (kilowatts)"))
dev.off()
