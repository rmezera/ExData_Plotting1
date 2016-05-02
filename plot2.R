#Plot 2
hhpower<- read.table("household_power_consumption.txt", sep=";",header=TRUE,colClasses = "character")
hhpower$DateTime <- paste(hhpower$Date,hhpower$Time,sep=" ")
hhpower$DateTime2 <-strptime(hhpower$DateTime,format="%d/%m/%Y %H:%M:%S")
hhpower$Date <- as.Date(hhpower$Date,format="%d/%m/%Y")
hhpower$Time <- strptime(hhpower$Time,format="%H:%M:%S")
head(hhpower)
hhpower2 <- hhpower[hhpower$Date == "2007-02-01"|hhpower$Date=="2007-02-02",]
hhpower2$Global_active_power <-as.numeric(hhpower2$Global_active_power)

par(cex=.75)
with(hhpower2,plot(DateTime2,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()