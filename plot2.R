#plot2

#READING AND MANIPULTING DATA
#Read in data
data <- read.table("household_power_consumption.txt", sep=";", header=T)
#Subset data to only dates of interest
data <- subset(data, data$Date=="1/2/2007" | data$Date=="2/2/2007")

#Convert Global_active_power values to numeric so they can be graphed
data[,"Global_active_power"] <- as.numeric(data[,"Global_active_power"])

#Convert data and time columns to Date and Time classes
data[,"Date"] <- as.Date(data[,"Date"], format="%d/%m/%Y")
#Create data-time vector
t <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

#PLOTTING
#Open a png file device, 480x480
png("plot2.png", width=480, height=480)

#Create line graph
plot(t, data$Global_active_power, type="l",
     ylab="Global Active Power (kilwatts)", xlab=" ")

#Close png file device
dev.off()

