plot1 <- function()
{
  temp <- "household_power_consumption.zip"
     
  if (file.exists(temp) == FALSE)
  {
    message("Zip file no found in working directory. Downloading...")
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)     
  }
  data <- read.csv(file= unz(temp,"household_power_consumption.txt"), header=TRUE, sep=";",dec=".",na.strings="?")
  #unlink(temp)  
  data$Date <- as.Date(data$Date,"%d/%m/%Y")
  data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02") )
  maintitle <- "Global Active Power"
  hist(data$Global_active_power,col="red",main=maintitle,xlab=paste(maintitle,"(kilowatts)"))
  dev.copy(png,"plot1.png",width=480,height=480,units="px")
  dev.off()
}
