# Coursera JHU Spec Data Science
#
# Exploratory Data Analysis
#
# Project 1
#
# Plot3.R
#
# This script filters the raw data with the function read_only useful lines
# defined in the file of the same name
# 
# File household_power_consumption.txt should be installed in the working directory
#
# data from 1/Feb/2007 to 2/Feb/2007

source("read_only_useful_lines.r")
# This auxiliar function is needed because of problems with the locale setting
# when your computer does not work in English by default.
translate_day_of_week <-function(day)
{
  days_of_week <- c("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
  return(days_of_week[day])
}

raw_data <- read.csv("temporary.txt",sep=";")
raw_data$Date <- as.Date(raw_data$Date,"%d/%m/%Y")
x <- 1:nrow(raw_data)
label_days <- weekdays(raw_data$Date)
label_days <- as.numeric(strftime(raw_data$Date,'%w'))+1
# Adding the following to the last date to bubild the x labels vector
label_days <- append(label_days,1+(label_days[length(label_days)])%%7)
uniq_days <- unique(label_days)
uniq_labels <- lapply(uniq_days,translate_day_of_week)
position_labels <- vector()
for (j in uniq_days)
{
  position_labels <- append(position_labels,which(label_days == j)[1])
}
# We open the graphic device with the required size 480 x 480
png(file = "Plot3.png", width = 480, height = 480, bg = "transparent")
plot.new()
mp <- plot(raw_data$Sub_metering_1~x,col='black',type="n",ylab="Energy sub metering",xlab="",xaxt="n")  
lines(raw_data$Sub_metering_1~x,col='black')
lines(raw_data$Sub_metering_2~x,col='red')
lines(raw_data$Sub_metering_3~x,col='blue')
legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lw=2, bty="y")

axis(1, at=position_labels, labels=uniq_labels)
dev.off()