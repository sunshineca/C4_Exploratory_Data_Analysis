

rm(list=ls())

setwd("C:/Jing/ProgramCode/DataScience/C3_ExploratoryDataAnalysis/Week1/PM25data/")
getwd()

pollution <- read.csv("data/avgpm25.csv", colClasses = c("numeric","character","factor","numeric","numeric"))
head(pollution)

# Five number summary
summary(pollution$pm25)

# Boxplot
boxplot(pollution$pm25, col = "blue")

# Histogram (the shape of the distribution)
hist(pollution$pm25, col = "green")
rug(pollution$pm25)

hist(pollution$pm25, col = "green", breaks = 100)

# Overlaying features
# Boxplot
boxplot(pollution$pm25, col = "blue")
abline(h=12)

# Histogram (the shape of the distribution)
hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)

# barplot
barplot(table(pollution$region), col = "wheat", main = "numbers of Countries in East region")

# two dimension plot

boxplot(pm25 ~ region, data = pollution, col = "red")

# multiple histograms
par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

# Scatterplot
with(pollution, plot(latitude, pm25))
abline(h = 12, lwd = 2, lty = 2)

# different region in different color
with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd = 2, lty = 2)

# Multiple Scatterplots
par(mfrow = c(1,2), mar = c(5,4,2,1))
with(subset(pollution, region == "west"), plot(latitude, pm25, main = "west"))
with(subset(pollution, region == "east"), plot(latitude, pm25, main = "East"))

