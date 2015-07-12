#load data , print plot2
#20150710 v0.1
#L.Tronina@gmail.com


plot2 <- function(){

plot(measurementSpace$DateTime,measurementSpace$Global_active_power, ,type = "l",ylab   = "Global active power (kilowatts)",xlab="") 
}


measurementBase = read.table(file.choose(),header= TRUE , stringsAsFactors=FALSE ,sep=";",na.strings = "?")
measurementSpace <-measurementBase[measurementBase$Date=="1/2/2007" | measurementBase$Date=="2/2/2007",]
measurementSpace$DateTime <- strptime(paste(measurementSpace$Date, measurementSpace$Time),format="%d/%m/%Y %H:%M:%S")
#str(measurementSpace)
#head(measurementSpace, n=10)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
plot2()
dev.off()

