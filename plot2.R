
source('load_data.R')

png(filename='plot2.png')

datetime = data$DateTime
power = data$Global_active_power

# generate plot2
plot(datetime, power, type='n', ylab='Global Active Power (kilowatts)')
lines(datetime, power)

dev.off()
