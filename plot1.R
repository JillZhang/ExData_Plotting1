#Read Data
power<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
power.data<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")
#Convert the date and time
power.data$Time<-strptime(power.data$Time,"%H:%M:%S")
power.data$Date<-as.Date(power.data$Date,"%d/%m/%Y")
#save the result to png
png(filename = "plot1.png",width=480,height=480)
#Generate the plot
hist(power.data$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kiowatts)")
dev.off()
