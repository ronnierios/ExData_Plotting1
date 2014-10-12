plot3 <- function()
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
  datetime <- as.POSIXct(paste(data$Date,data$Time))  
  legendscol <- c("black","red","blue")
  png("plot3.png", width = 480, height = 480,units="px")
  plot(datetime,data$Sub_metering_1,type="l",ann=FALSE,col=legendscol[1])
  lines(datetime,data$Sub_metering_2,type="l",col=legendscol[2])
  lines(datetime,data$Sub_metering_3,type="l",col=legendscol[3])
  legend("topright",names(data[7:9]),col=legendscol,lty=1,lwd =2.5)
  title(ylab="Energy sub meeting")
  dev.off()
}