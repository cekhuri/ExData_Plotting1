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

#Plot plot3
png(file="plot3.png", width=480,height=480)
plot(data_2$datetime,data_2$Sub_metering_1,xaxt="n",ylab="Energy sub metering",xlab="",type="l")
lines(data_2$datetime,data_2$Sub_metering_2,xaxt="n",ylab="Energy sub metering",xlab="",col="red")
lines(data_2$datetime,data_2$Sub_metering_3,xaxt="n",col="blue")
axis(1,at= c(data_2$datetime[1],data_2$datetime[1441],data_2$datetime[2880]),labels=c("Thu","Fri","Sat"))
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.75,pt.cex=1)
dev.off()