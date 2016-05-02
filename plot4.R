#Plot 4
#Prep the datafile to get it ready to analyze
hhpower<- read.table("household_power_consumption.txt", sep=";",header=TRUE,colClasses = "character")
hhpower$DateTime <- paste(hhpower$Date,hhpower$Time,sep=" ")
hhpower$DateTime2 <-strptime(hhpower$DateTime,format="%d/%m/%Y %H:%M:%S")
hhpower$Date <- as.Date(hhpower$Date,format="%d/%m/%Y")
hhpower$Time <- strptime(hhpower$Time,format="%H:%M:%S")
head(hhpower)
hhpower2 <- hhpower[hhpower$Date == "2007-02-01"|hhpower$Date=="2007-02-02",]
hhpower2$Global_active_power <-as.numeric(hhpower2$Global_active_power)
hhpower2$Global_reactive_power <-as.numeric(hhpower2$Global_reactive_power)
hhpower2$Global_Voltage <-as.numeric(hhpower2$Voltage)
hhpower2$Global_intensity <-as.numeric(hhpower2$Global_intensity)
hhpower2$Sub_metering_1 <-as.numeric(hhpower2$Sub_metering_1)
hhpower2$Sub_metering_2 <-as.numeric(hhpower2$Sub_metering_2)
hhpower2$Sub_metering_3 <-as.numeric(hhpower2$Sub_metering_3)

par(mfcol=c(2,2))
par(cex=.6)
#Create 1st chart
with(hhpower2,plot(DateTime2,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
#Create 2nd chart
with(hhpower2,plot(DateTime2,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering"))
with(hhpower2,lines(DateTime2,Sub_metering_2,col="red"))
with(hhpower2,lines(DateTime2,Sub_metering_3,col="blue"))
legend("topright", lty = 1, bty="n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
#Create 3rd chart
with(hhpower2,plot(DateTime2,Global_Voltage,type="l",xlab="datetime",ylab="Voltage"))
#Create 4th chart
with(hhpower2,plot(DateTime2,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
#Copy to the png file
dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()

