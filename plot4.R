#plot4

#READING AND MANIPULTING DATA
#Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=T)
#Subset data to only dates of interest
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

#Necessary manipulations for the plots
#Convert Global_active_power and Global_reactive_power values to numeric so they can be graphed
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])
data[,"Global_reactive_power"] <- as.numeric(data[,"Global_reactive_power"])

#Convert Sub-metering columns to numeric so they can be graphed
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

#Convert data and time columns to Date and Time classes
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
#Create data-time vector
t <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#PLOTTING
png("plot4.png", width=480, height=480)

#set matrix for graphs
par(mfrow = c(2,2))

#PLOT 1
plot(t, data$Global_active_power, type="l",
     ylab="Global Active Power (kilwatts)", xlab=" ")

#PLOT 2
plot(t, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#PLOT 3
#Create line graph starting with sub metering 1
plot(t, data$Sub_metering_1, col="black", type="l",
     ylab="Energy sub metering", xlab=" ")
#Annotate rest of sub metering on as different colored lines
lines(t, data$Sub_metering_2, col="red")
lines(t, data$Sub_metering_3, col="blue")
#Create the legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))

#PLOT 4
plot(t, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

#Close png file device
dev.off()
