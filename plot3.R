#plot3

#READING AND MANIPULTING DATA
#Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=T)
#Subset data to only dates of interest
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

#Convert Sub-metering columns to numeric so they can be graphed
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Convert data and time columns to Date and Time classes
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
#Create data-time vector
t <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#PLOTTING
#Open a png file device, 480x480
png("plot3.png", width=480, height=480)

#Create line graph starting with sub metering 1
plot(t, data$Sub_metering_1, col="black", type="l",
     ylab="Energy sub metering", xlab=" ")
#Annotate rest of sub metering on as different colored lines
lines(t, data$Sub_metering_2, col="red")
lines(t, data$Sub_metering_3, col="blue")
#Create the legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))

#Close png file device
dev.off()
