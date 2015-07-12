#load data , print plot3
#20150710 v0.1
#L.Tronina@gmail.com



plot3 <- function(){

colors <- c("black", "red", "blue")
plot(measurementSpace$DateTime,measurementSpace$Sub_metering_1, ,type = "l",ylab   = "Energy sub metering",
xlab="",col=colors[1]) 
lines(measurementSpace$DateTime,measurementSpace$Sub_metering_2,col=colors[2])
lines(measurementSpace$DateTime,measurementSpace$Sub_metering_3,col=colors[3])
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=colors,  lty = "solid",cex=0.8)
}

measurementBase = read.table(file.choose(),header= TRUE , stringsAsFactors=FALSE ,sep=";",na.strings = "?")
measurementSpace <-measurementBase[measurementBase$Date=="1/2/2007" | measurementBase$Date=="2/2/2007",]
measurementSpace$DateTime <- strptime(paste(measurementSpace$Date, measurementSpace$Time),format="%d/%m/%Y %H:%M:%S")
#str(measurementSpace)
#head(measurementSpace, n=10)




png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot3()

dev.off()

