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
	png(filename="plot1.png", width=480,height=480 )
    ## create plot
    hist(hholdpower_wanted$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
    ## close dev
    dev.off()

