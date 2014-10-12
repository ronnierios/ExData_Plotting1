plot4 <- function()
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
  
  #Creating the plot in matrix 2x2
  png("plot4.png", width = 480, height = 480,units="px")
  par(mfrow=c(2,2))
  
  #1 plot
  plot(datetime,data$Global_active_power,type="l",ann=FALSE)
  title(ylab="Global Active Power")
  
  #2 plot
  plot(datetime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  #3 plot
  legendscol <- c("black","red","blue")
  plot(datetime,data$Sub_metering_1,type="l",ann=FALSE,col=legendscol[1])
  lines(datetime,data$Sub_metering_2,type="l",col=legendscol[2])
  lines(datetime,data$Sub_metering_3,type="l",col=legendscol[3])
  legend("topright",names(data[7:9]),col=legendscol,lty=1,lwd =2.5)
  title(ylab="Energy sub meeting")
  
  #4 plot
  plot(datetime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.off()
}