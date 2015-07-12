#load data , print plot4
#20150710 v0.1
#L.Tronina@gmail.com


measurementBase = read.table(file.choose(),header= TRUE , stringsAsFactors=FALSE ,sep=";",na.strings = "?")
measurementSpace <-measurementBase[measurementBase$Date=="1/2/2007" | measurementBase$Date=="2/2/2007",]
measurementSpace$DateTime <- strptime(paste(measurementSpace$Date, measurementSpace$Time),format="%d/%m/%Y %H:%M:%S")
#str(measurementSpace)
#head(measurementSpace, n=10)

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))


old.par <- par(mfrow=c(2, 2))
#p1
plot(measurementSpace$DateTime,measurementSpace$Global_active_power, ,type = "l",ylab   = "Global active power (kilowatts)",xlab="") 
#@p2
plot(measurementSpace$DateTime,measurementSpace$Voltage, ,type = "l",ylab   = "Voltage",xlab="dateTime") 
#p3
colors <- c("black", "red", "blue")
plot(measurementSpace$DateTime,measurementSpace$Sub_metering_1, ,type = "l",ylab   = "Energy sub metering",
xlab="",col=colors[1]) 
lines(measurementSpace$DateTime,measurementSpace$Sub_metering_2,col=colors[2])
lines(measurementSpace$DateTime,measurementSpace$Sub_metering_3,col=colors[3])
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=colors,  lty = "solid",cex=0.8)
#p4
plot(measurementSpace$DateTime,measurementSpace$Global_reactive_power,ylab="Global_reactive_power" ,type = "l",xlab="dateTime") 


par(old.par)


dev.off()

