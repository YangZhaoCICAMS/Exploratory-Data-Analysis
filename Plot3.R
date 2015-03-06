##Reading the full dataset 
data <- read.table("J:/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt",
                   header = TRUE,
                   sep = ';',
                   na.strings = "?",
			 nrows = 2075259,
                   check.names = FALSE,
                   stringsAsFactors = F,
                   quote = '\"')

##Displaying the internal structure of dataset data
str(data)

plot3.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


attach(plot2.data)
datetime <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(datetime, 
     Sub_metering_1 , 
     type="l", 
     xlab="", 
     ylab="Energy Submetering")

lines(datetime, 
      Sub_metering_2, 
      type = "l", 
      col = "red")
lines(datetime, 
      Sub_metering_3, 
      type = "l", 
      col = "blue")

legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, 
       lwd = 2.5, 
       col = c("black","red","blue"))

dev.copy(png, 
         file = "J:/Coursera/Exploratory Data Analysis/plot3.png",
         height = 480,
         width = 480)
dev.off()
detach(plot3.data)

