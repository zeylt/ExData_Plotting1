setwd("~/Dropbox/CourseraWork/ExploratoryDataAnalysis/ExData_Plotting1")

# Load data into a data frame
full_power <- read.delim('household_power_consumption.txt',header=TRUE,sep=";",
                         colClasses='character')

#Subset to days of interest
power <- subset(full_power,Date=="1/2/2007"|Date=="2/2/2007")

# Convert to appropriate variable types
power$Date<-as.Date(power$Date,"%d/%m/%Y")
power$Time<-strptime(power$Time,format="%H:%M:%S")
power$Global_active_power <-as.numeric(power$Global_active_power)

# Make Plot 1
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Send to png device
dev.copy(png,filename='plot1.png',width=480,height=480)

# Turn off png device
dev.off()