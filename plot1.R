#plot 1

#NOTE: code for reading the table is in a separate file in the repo, make_powertbl.R

source("make_powertbl.R")

#code for making the graph appear on screen
hist(powertbl$Global_active_power, col="red",main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#let's export this to png; the requested size, 480x480 pixels, is the default
dev.copy(png, file="plot1.png")
dev.off()

