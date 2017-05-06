
source('load_data.R')

png(filename='plot4.png')

# make 4 plots on one device
par(mfrow=c(2, 2))

datetime = data$DateTime
power = data$Global_active_power
voltage = data$Voltage
meter1 <- data$Sub_metering_1
meter2 <- data$Sub_metering_2
meter3 <- data$Sub_metering_3
reactivepower <- data$Global_reactive_power

# top left
plot(datetime, power, type='n', ylab='Global Active Power', xlab='')
lines(datetime, power)

# top right
plot(datetime, voltage, type='n', ylab='Voltage')
lines(datetime, voltage)

# bottom left
plot(datetime, meter3, 
     type='n', yaxt='n', ylim=c(0, 40), ylab='Enery sub metering', xlab='')
axis(side = 2, at = seq(0, 30, 10))
lines(datetime, meter1, col='black')
lines(datetime, meter2, col='red')
lines(datetime, meter3, col='blue')

legend('topright',
       lty=c(1,1,1),
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col=c('black', 'red', 'blue'),
       bty='n')

# bottom right
plot(datetime, reactivepower, 
     type='n', ylab='Global_reactive_power')
lines(datetime, reactivepower)

dev.off()
