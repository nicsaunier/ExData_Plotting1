#plot 3

#NOTE: code for reading the table is in a separate file in the repo, make_powertbl.R

source("make_powertbl.R")


#since this graph superimposes many values, we should make sure the canvas is set with a big enough
# y axis
power_submeters <- select(powertbl, Datetime, Sub_metering_1:Sub_metering_3)
summary(power_submeters)
#this allows us to see that Sub_metering_1 is the value that should be graphed first

# due to issues with legend resizing when using the dev.copy function
# this code directly creates the graph as a png without making the graph appear on screen
png(file="plot3.png")
with(power_submeters, plot(Datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(power_submeters$Datetime, power_submeters$Sub_metering_2, col="red")
lines (power_submeters$Datetime, power_submeters$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black", "red","blue"),legend=colnames(power_submeters[,2:4]))
dev.off()
