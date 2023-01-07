#Download and unzip data
if(!file.exists("data.zip")){
  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  path <- "./data.zip"
  download.file(URL, destfile=path, method="curl")
  unzip(path)
}

#plot1

#READING AND MANIPULTING DATA
#Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=T)
#Subset data to only dates of interest
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

#Convert Global_active_power values to numerics so they can be graphed
class(data$Global_active_power)
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
class(data$Global_active_power)

#PLOTTING
#Open a png file device, 480x480
png("plot1.png", width=480, height=480)

#Create histogram
hist(data$Global_active_power, col="red", main="Global Active Power",
     ylab="Frequency", xlab="Global Active Power (kilowatts)")

#Close png file device
dev.off()