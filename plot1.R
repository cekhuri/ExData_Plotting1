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

#Plot plot1
png(file="plot1.png", width=480,height=480)
hist(data_2$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()