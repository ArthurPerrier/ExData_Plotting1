setwd("adress")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

data1<-subset(household_power_consumption,household_power_consumption$Date=="1/2/2007")
data2<-subset(household_power_consumption,household_power_consumption$Date=="2/2/2007")

data<-household_power_consumption[1:2880,]
data[1:1440,]<-data1
data[1441:2880,]<-data2

x<-as.matrix(data$Global_active_power)
x<-as.numeric(x)

png(file="Plot 1.png")
hist(x,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()

