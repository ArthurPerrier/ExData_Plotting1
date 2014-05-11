setwd("adress")
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")

data1<-subset(household_power_consumption,household_power_consumption$Date=="1/2/2007")
data2<-subset(household_power_consumption,household_power_consumption$Date=="2/2/2007")

data<-household_power_consumption[1:2880,]
data[1:1440,]<-data1
data[1441:2880,]<-data2

x<-as.matrix(data$Global_active_power)
x<-as.numeric(x)

u<-as.matrix(data$Sub_metering_1)
u<-as.numeric(u)

v<-as.matrix(data$Sub_metering_2)
v<-as.numeric(v)

w<-as.matrix(data$Sub_metering_3)
w<-as.numeric(w)

voltage<-as.matrix(data$Voltage)
voltage<-as.numeric(voltage)

grp<-as.matrix(data$Global_reactive_power)
grp<-as.numeric(grp)

y<-data$Date
y<-as.matrix(y)
y[1:1440]<-"01/02/07"
y[1441:2880]<-"02/02/07"

z<-data$Time
z<-as.matrix(z)

time<-strptime(paste(y,z),"%d/%m/%y %H:%M:%S")

png(file="Plot 4.png")
par(mfrow=c(2,2))

plot(time,x,type="l",ylab="Global Active Power",xlab="")

plot(time,voltage,type="l",ylab="Voltage",xlab="datetime")

plot(time,u,type="l",ylab="Energy Sub Metering",xlab="")
points(time, v,type="l",col="red")
points(time, w,type="l",col="blue")
legend("topright",pch=1, col=c("black","red","blue"), legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3"))

plot(time,grp,type="l",ylab="Global Reactive Power",xlab="datetime")

dev.off()
