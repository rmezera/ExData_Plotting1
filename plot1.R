#Plot 1
hhpower<- read.table("household_power_consumption.txt", sep=";",header=TRUE,colClasses = "character")
hhpower$Date <- as.Date(hhpower$Date,format="%d/%m/%Y")
hhpower$Time <- strptime(hhpower$Time,format="%H:%M:%S")
hhpower2 <- hhpower[hhpower$Date == "2007-02-01"|hhpower$Date=="2007-02-02",]
hhpower2$Global_active_power <-as.numeric(hhpower2$Global_active_power)

par(cex=.75)
hist(hhpower2$Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()