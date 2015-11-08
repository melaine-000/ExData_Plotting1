mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
subsect = mydata[mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02", ]

x <- paste(subsect$Date, subsect$Time)
subsect$DateTime<-strptime(x, "%Y-%m-%d %H:%M:%S")

png(file = "plot4.png")

par(mfrow = c(2,2))

#topleft:
with(subsect, plot(DateTime,Global_active_power, type = "l",                    
                   xlab = "",ylab = "Global Active Power", 
                   cex.lab = 0.75, cex.axis = 0.75) )

#topright:
with(subsect, plot(DateTime,Voltage, type = "l",                    
                   xlab = "datetime",ylab = "Voltage", 
                   cex.lab = 0.75, cex.axis = 0.75) )

#bottomleft:
with(subsect, plot(DateTime, Sub_metering_1, type = "l",
                   xlab = "", ylab = "Energy sub metering",
                   cex.lab = 0.75, cex.axis = 0.75))
with(subsect, lines(DateTime, Sub_metering_2, col = "red"))
with(subsect, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black","red","blue"), lty = 1, lwd = 1,cex = 0.75,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#bottomright:
with(subsect, plot(DateTime,Global_reactive_power, type = "l",                    
                   xlab = "datetime",ylab = "Global Rective Power", 
                   cex.lab = 0.75, cex.axis = 0.75) )

dev.off()