# Coursera JHU Spec Data Science
#
# Exploratory Data Analysis
#
# Project 1
#
# Plot1.R
#
# Histogram of the Global Active Power
#
# This script filters the raw data with the function read_only useful lines
# defined in the file of the same name
#
# File household_power_consumption.txt should be installed in the working directory
#
# data from 1/2/2007 to 2/2/2007

source("read_only_useful_lines.r")
read_only_useful_lines("household_power_consumption.txt","temporary.txt","1/2/2007|2/2/2007")
raw_data <- read.csv("temporary.txt",sep=";")
# We open the graphic device with the required size 480 x 480
png(file = "Plot1.png", width = 480, height = 480, bg = "transparent")
# Plotting the histogram with the required labels and red background
hist(raw_data$Global_active_power, main="Global Active Power", col='red',  xlab="Global Active Power (kilowatts)")
dev.off()