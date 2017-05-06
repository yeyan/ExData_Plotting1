
source('load_data.R')

png(filename='plot3.png')

date_time <- data$DateTime
meter1 <- data$Sub_metering_1
meter2 <- data$Sub_metering_2
meter3 <- data$Sub_metering_3

# generate plot3
plot(date_time, meter3, 
     type='n', yaxt='n', ylim=c(0, 40), ylab='Enery sub metering')
axis(side = 2, at = seq(0, 30, 10))
lines(date_time, meter1, col='black')
lines(date_time, meter2, col='red')
lines(date_time, meter3, col='blue')

legend('topright',
       lty=c(1,1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c('black', 'red', 'blue'))

dev.off()
