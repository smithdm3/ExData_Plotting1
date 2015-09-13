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
	png(file="plot2.png", width=480,height=480 )
    ## create plot
    plot(hholdpower_wanted$DateTime, hholdpower_wanted$Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)")
    ## close dev
    dev.off()
