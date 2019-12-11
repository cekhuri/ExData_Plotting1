library(dplyr)
library(tidyverse)
library(lubridate)
setwd("C:/Users/celkh/Desktop/Rstudio programs/data")
data <- read.table("./household_power_consumption.txt",na.strings="?",nrows=100000,header=TRUE,sep=";")

#Create Datetime 
data$datetime <- paste(data$Date,data$Time)
data <- data %>%
  mutate(datetime = dmy_hms(datetime)) 

#Select only required days 
data_2 <- data %>%
  filter(str_detect(datetime,"2007-02-01") | str_detect(datetime,"2007-02-02"))

#Plot plot2
png(file="plot2.png", width=480,height=480)
plot(data_2$datetime, data_2$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
     xaxt="n",xlab="")
axis(1,at= c(data_2$datetime[1],data_2$datetime[1441],data_2$datetime[2880]),labels=c("Thu","Fri","Sat"))
dev.off()