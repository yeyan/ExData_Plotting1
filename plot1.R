source('load_data.R')

png(filename='plot1.png')

# generate plot1
hist(data$Global_active_power, 
     xlab='Global Active Power (kilowatts)', 
     col='red',
     main='Global Active Power')

dev.off()
