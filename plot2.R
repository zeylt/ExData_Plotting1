setwd("~/Dropbox/CourseraWork/ExploratoryDataAnalysis/ExData_Plotting1")

# Load data into a data frame
full_power <- read.delim('household_power_consumption.txt',header=TRUE,sep=";",
                         colClasses='character')

#Subset to days of interest
power <- subset(full_power,Date=="1/2/2007"|Date=="2/2/2007")

# Convert to appropriate variable types
power$Time<-strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Date<-as.Date(power$Date,"%d/%m/%Y")
power$Global_active_power <-as.numeric(power$Global_active_power)

# Make Plot 2
plot(power$Time,power$Global_active_power,type="n",xlab='',ylab='Global Active Power (kilowatts)')
lines(power$Time,power$Global_active_power)
# Send to png device
dev.copy(png,filename='plot2.png',width=480,height=480)

# Turn off png device
dev.off()
