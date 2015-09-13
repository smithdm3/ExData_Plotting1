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
	## set up device
    png(file="plot3.png", width=480,height=480 )
    ## create plot
    with(hholdpower_wanted, plot(DateTime, Sub_metering_1, xlab="",ylab="Energy sub metering", main="", type="n"))
    with(hholdpower_wanted, lines(DateTime, Sub_metering_1, col="black"))
    with(hholdpower_wanted, lines(DateTime, Sub_metering_2, col="red"))
    with(hholdpower_wanted, lines(DateTime, Sub_metering_3, col="blue"))
    legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    ## close device
	dev.off()
