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

##Coverting the Date and Time variable to Date/Time classes in R
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data$Time <- strptime(data$Time,format = "%H:%M:%S")
head(data)

##Selecting the data based on Date variable, which is between "2007-02-01" and "2007-02-02"
plot1.data <- subset(data,Date >= "2007-02-01" & Date <= "2007-02-02")
names(plot1.data)

##Creating Plot1
attach(plot1.data)
hist(Global_active_power,xlab = "Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power", col = "red")

##Saving to file as PNG format
dev.copy(png, 
         file = "J:/Coursera/Exploratory Data Analysis/plot1.png",
         height = 480,
         width = 480)
dev.off()

detach(plot1.data)
