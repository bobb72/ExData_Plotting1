# Here is the data for the project:
  
  #  https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Create an R script called plot3.R that reproduces the plot as per course instructions

#setwd("C:/Users/Bob/Desktop/DS Specialization/4_Exploratory_Data_Analysis/w1_assignment/exdata_data_household_power_consumption")
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile="../Electric power consumption.zip")
#unzip(zipfile="../Electric power consumption.zip")

# Read file:
house_pwr_cons  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE, na.strings = "?")
house_pwr_cons_sub <- house_pwr_cons[house_pwr_cons$Date %in% c("1/2/2007","2/2/2007"), ]
rm("house_pwr_cons")

# Create 3rd plot:
globalActivePower <- as.numeric(house_pwr_cons_sub$Global_active_power)
timeStamp <- strptime(paste(house_pwr_cons_sub$Date, house_pwr_cons_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("ExData_Plotting1/plot3.png", width=480, height=480)
plot(timeStamp, house_pwr_cons_sub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(timeStamp, house_pwr_cons_sub$Sub_metering_2, col = "red")
lines(timeStamp, house_pwr_cons_sub$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1)
dev.off()
