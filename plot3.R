## Project1 - Exploratory Data Analysis
##
## Description: 
## ------------
## This project/assignment utilizes dataset (Electric power consumption) 
## from the UC Irvine Machine Learning Repository. A text file was 
## (household_power_consumption.txt) is extracted into a folder called 'data' 
## which was created in the working directory.
##
## Goal:
## -----
## To examine how household energy usage varies over a 2-day period in Feb,2007
## via plotting of data from household_power_consumption.txt
##
## Requirements for each plot:
## ---------------------------
## 1. Construct the plot and save it to a PNG file with a width of 480 pixels 
## and a height of 480 pixels.
## 2. Adopt the following naming conventions for each of the plots: plot1.png,
## plot2.png, plot3.png, plot4.png
## 3. Create a seperate R script file (i.e. plot1.R,plot2.R,etc.) that constructs
## the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot.
## The script file includes code for reading the data so that the plot can be 
## reproduced. The script will also contain code that creates the .png file.
## 4. Add both the .png file and R-code to the top-level folder of the git repo
## (no need for seperate sub-folders). 
## 5. Push Git repository to GitHub so that the GitHub version is up to date. 
## There should be four .png files and four R script/code files, total of 8 files
## in top level of repo.
#
# Read data from household_power_consumption.txt into R 
# Note: grep attribute is utilized to import data from 1/2/2007 till 2/2/2007
# rather than reading in entire dataset
#
rm(list = ls())
#
dataFile <- "./data/household_power_consumption.txt"
txtfile <- read.table(text = grep("^[1,2]/2/2007",readLines(dataFile),value=TRUE),col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";", quote= "", strip.white=TRUE, na.strings= "?")
# Convert the date variable to Date class
txtfile$Date <- as.Date(txtfile$Date, format = '%d/%m/%Y')
txtfile$DateTime <- as.POSIXct(paste(txtfile$Date, txtfile$Time))
# Open device
png(filename = './plot3.png', width = 480, height = 480, units='px')
# Plot data
plot(txtfile$DateTime, txtfile$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(txtfile$DateTime, txtfile$Sub_metering_2, col = 'red')
lines(txtfile$DateTime, txtfile$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()