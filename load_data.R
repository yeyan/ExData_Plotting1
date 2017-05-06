library(utils)
library(dplyr)
library(lubridate)

refined_data_file <- '2007-02-01TO2007-02-02.csv'

# Download, unzip and cleansing data if required
# Save clean data into '2007-02-01TO2007-02-02.csv' for next time use
if(!file.exists(refined_data_file)) {

    if(!file.exists('household_power_consumption.txt')) {

        if(!file.exists('household_power_consumption.zip')) {
            download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip')
        }

        unzip('household_power_consumption.zip')
    }

    # Combine Data and Time variable into DateTime
    # Only keep data for 2007-02-01 and 2007-02-02
    data <- read.csv('household_power_consumption.txt', sep=';', na.strings='?') %>% 
        tbl_df %>% 
        mutate(DateTime=dmy_hms(paste(Date,Time))) %>% 
        select(DateTime, Global_active_power, Global_reactive_power, Voltage, Global_intensity, Sub_metering_1, Sub_metering_2, Sub_metering_3) %>%
        filter(DateTime > ymd('2007-02-01') & DateTime < ymd('2007-02-03'))

    # Save clean data for future use.
    write.csv(data, refined_data_file, row.names=FALSE)
} else {

    # Load from previously saved clean data
    data <- read.csv(refined_data_file) %>% 
        mutate(DateTime=ymd_hms(DateTime)) %>%
        tbl_df
}
