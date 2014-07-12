# Plot 4 -  Course project - Exploratory Data analysis

fileName <- "./data/exdata-data-household_power_consumption/household_power_consumption.txt"

# load the original dataset into the memory
elcUsage <- read.table(fileName, sep = ";", header = TRUE, na.strings="?")
head(elcUsage)
dim(elcUsage)

# convert the Date to format Date
elcUsage$Date <- as.Date(elcUsage$Date,"%d/%m/%Y")

# subset the data from the dates 2007-02-01 and 2007-02-02

startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y")
sub <- elcUsage[(elcUsage$Date >= startDate & elcUsage$Date <= endDate),]
head(sub)
dim(sub)

# remove the big original dataset
rm(elcUsage)


# base plotting system to produce the plot 4

names(sub)

datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

# plot 4
par(mfrow = c(2, 2))

with(sub, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l",
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime, type="l", col = "red")
    lines(Sub_metering_3~Datetime, type="l", col = "blue")
    legend("topright", lty=1, col = c("black", "red","blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           cex=0.4, bty = "n")
    plot(Global_reactive_power~Datetime, type="l",
         ylab="Voltage", xlab="datetime")
})


# print to plot 4
dev.copy(png, file = "plot4.png") 
dev.off()
