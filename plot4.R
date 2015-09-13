    ## read in data
    hholdpower_full <- read.csv("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors=FALSE, na.strings="?")
    ## convert date so we can subset
    hholdpower_full$Date <- as.Date(strptime(hholdpower_full$Date, "%d/%m/%Y"))
    ## subset to dates we want
    hholdpower_wanted <- subset(hholdpower_full, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) 
    ## remove full data set
    remove(hholdpower_full)
    ## create Date:Time field
    hholdpower_wanted$DateTime <- paste(hholdpower_wanted$Date, hholdpower_wanted$Time, sep=" ")
    # convert to datetime format
    hholdpower_wanted$DateTime <- strptime(hholdpower_wanted$DateTime, "%Y-%m-%d %H:%M:%S")
	## create device
	png(file="plot4.png", width=480,height=480 )    
    ## create plot layout
    par(mfrow=c(2,2))
    ## create plot 1
    with(hholdpower_wanted, plot(DateTime, Global_active_power, xlab="",ylab="Gobal Active Power", main="", type="l"))
    ## create plot 2
    with(hholdpower_wanted, plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", main="", type="l"))
    ## create plot 3
    with(hholdpower_wanted, plot(DateTime, Sub_metering_1, xlab="",ylab="Energy sub metering", main="", type="n"))
    with(hholdpower_wanted, lines(DateTime, Sub_metering_1, col="black"))
    with(hholdpower_wanted, lines(DateTime, Sub_metering_2, col="red"))
    with(hholdpower_wanted, lines(DateTime, Sub_metering_3, col="blue"))
    legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
    ## create plot 4
    with(hholdpower_wanted, plot(DateTime, Global_reactive_power, xlab="datetime", main="", type="l"))
    ## close device
    dev.off()
