setwd("~/Dropbox/CourseraWork/ExploratoryDataAnalysis/ExData_Plotting1")

# Load data into a data frame
full_power <- read.delim('household_power_consumption.txt',header=TRUE,sep=";",
                         colClasses='character')

#Subset to days of interest
power <- subset(full_power,Date=="1/2/2007"|Date=="2/2/2007")

# Convert to appropriate variable types
power$Time<-strptime(paste(power$Date,power$Time),format="%d/%m/%Y %H:%M:%S")
power$Sub_metering_1 <-as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <-as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <-as.numeric(power$Sub_metering_3)

# Make Plot 3
plot(power$Time,power$Sub_metering_1,type="n",xlab='',ylab='Energy Sub Metering')
lines(power$Time,power$Sub_metering_1)
lines(power$Time,power$Sub_metering_2,col="red")
lines(power$Time,power$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Send to png device
dev.copy(png,filename='plot3.png',width=480,height=480)

# Turn off png device
dev.off()
