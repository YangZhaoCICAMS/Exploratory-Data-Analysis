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

##Selecting the data we used to plot the graphic
plot2.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Adding the dataset
attach(plot2.data)

##Changing the Date/Time format in R
datetime <- strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Creating the plot2
plot(datetime, 
     Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

##Saving the plot with png format
dev.copy(png, 
         file = "J:/Coursera/Exploratory Data Analysis/plot2.png",
         height = 480,
         width = 480)
dev.off()
detach(plot2.data)

