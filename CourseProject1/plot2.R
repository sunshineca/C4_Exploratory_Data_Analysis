# Plot 2 -  Course project - Exploratory Data analysis
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


# base plotting system to produce the plot 2

names(sub)
# sub$Global_active_power <- as.numeric(levels(sub$Global_active_power))[sub$Global_active_power]

# change to dates
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)


plot(sub$Global_active_power~sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# print to png
dev.copy(png, file = "plot2.png") 
dev.off()

