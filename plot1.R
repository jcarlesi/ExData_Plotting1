#library(lubridate)

PwrDataFile = "D:/GitHub/household_power_consumption.txt"

#"?"<-NA
#x <- read.csv(PwrDataFile, na.rm=TRUE)

housedata <- read.table(PwrDataFile, header = TRUE, sep = ";", na.strings = "?")

daydata <- rbind(housedata[housedata$Date == "1/2/2007",],housedata[housedata$Date == "2/2/2007",])

daydata$Date <- as.Date(daydata$Date,"%d/%m/%Y")

daydata <- cbind(daydata, "DateTime" = as.POSIXct(paste(daydata$Date, daydata$Time)))

hist(as.numeric(daydata$Global_active_power), col = "Red", main = "Global Active Power", xlab = "Global Active power (kilowatts)", ylab = "Frequency")
dev.print(png, file = "plot1.png", width = 1024, height = 768)
dev.off()