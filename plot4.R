#plot4

#NOTE: code for reading the table is in a separate file in the repo, make_powertbl.R

source("make_powertbl.R")

#this is actually 4 separate graphs
#we'll fill them by columns with mfcol

png(file="plot4.png")

par(mfcol=c(2,2))
#the first two we already have, they are the ones we already created in the 2 previous questions
#1st part
with(powertbl, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

#2nd part
with(power_submeters, plot(Datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(power_submeters$Datetime, power_submeters$Sub_metering_2, col="red")
lines (power_submeters$Datetime, power_submeters$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black", "red","blue"),legend=colnames(power_submeters[,2:4]))

# the last two are datetime and voltage and datetime and reactive power
#3rd part
with(powertbl, plot(Datetime, Voltage, type="l"))
#4th part
with(powertbl, plot(Datetime, Global_reactive_power, type='l'))

dev.off()
