mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
subsect = mydata[mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02", ]

x <- paste(subsect$Date, subsect$Time)
subsect$DateTime<-strptime(x, "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")
with(subsect, plot(DateTime,Global_active_power, type = "l",                    
                   xlab = "",ylab = "Global Active Power (kilowatts)", 
                   cex.lab = 0.75, cex.axis = 0.75) )
dev.off()