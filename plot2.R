setwd(adress)
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

data1<-subset(household_power_consumption,household_power_consumption$Date=="1/2/2007")
data2<-subset(household_power_consumption,household_power_consumption$Date=="2/2/2007")

data<-household_power_consumption[1:2880,]
data[1:1440,]<-data1
data[1441:2880,]<-data2

x<-as.matrix(data$Global_active_power)
x<-as.numeric(x)

y<-data$Date
y<-as.matrix(y)
y[1:1440]<-"01/02/07"
y[1441:2880]<-"02/02/07"

z<-data$Time
z<-as.matrix(z)

time<-strptime(paste(y,z),"%d/%m/%y %H:%M:%S")

png(file="Plot 2.png")
plot(time,x,type="l",ylab="Global Active Power",xlab="")
dev.off()
