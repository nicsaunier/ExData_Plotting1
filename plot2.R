#plot 2

#NOTE: code for reading the table is in a separate file in the repo, make_powertbl.R

source("make_powertbl.R")

#code for making the graph appear on screen
with(powertbl, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)"))

#code for exporting to png file
dev.copy(png, file="plot2.png")
dev.off()


