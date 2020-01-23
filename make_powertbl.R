#code for reading the data
#this code makes a table called powertbl which will then be used in the plot scripts

#start by importing the data: provided zip file was unzipped to working directory
#a quick look at the data (using Notepad++) shows us that data is ordered by date
#to avoid excess memory consumption, we will import only the first 100,000 rows
f <- "exdata_data_household_power_consumption/household_power_consumption.txt"
powerdata<- read.table(f, header=TRUE, sep=";", stringsAsFactors = FALSE, nrows=100000, na.strings = "?")


#turning the date and time columns to the appropriate formats
#here we diverge a little from the recommendations in the course, as the lubridate functions 
# are generally more user friendly than strptime and as.date
library(lubridate)
powerdata$Date = dmy(powerdata$Date)
powerdata$Time = hms(powerdata$Time)

# filtering the data to include only the required dates

library(dplyr)
powertbl<- filter(powerdata, (Date == "2007-02-01" | Date == "2007-02-02"))
powertbl<- as_tibble(powertbl)

#making the Datetime column which will be used in later graphs
powertbl$Datetime = powertbl$Date+ powertbl$Time

#Optional: I'm working on a French system; in order to get the labels properly, 
# we need to change the sys.time settings
Sys.setlocale("LC_TIME", "English")
