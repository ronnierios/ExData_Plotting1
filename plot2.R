plot2 <- function()
{
  temp <- "household_power_consumption.zip"
  
  if (file.exists(temp) == FALSE)
  {
    message("Zip file no found in working directory. Downloading...")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)     
  }
  data <- read.csv(file= unz(temp,"household_power_consumption.txt"), header=TRUE, sep=";",dec=".",na.strings="?")  
  data$Date <- as.Date(data$Date,"%d/%m/%Y")
  data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )
  datetime <- as.POSIXct(paste(data$Date,data$Time))
  png("plot2.png", width = 480, height = 480,units="px")
  plot(datetime,data$Global_active_power,type="l",ann=FALSE)
  title(ylab="Global Active Power (kilowatts)")  
  dev.off()
}