mydata = read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

subsect = mydata[mydata$Date >= "2007-02-01" & mydata$Date <= "2007-02-02", ]

hist(subsect$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", cex.lab = 0.75, cex.axis = 0.75)
dev.copy(png, file = "plot1.png")
dev.off()
