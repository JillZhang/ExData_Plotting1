#Read Data
power<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
power.data<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")
#Convert the date and 
power.data$Datetime<-paste(power.data$Date,power.data$Time,sep=" ")
power.data$Datetime<-strptime(power.data$Datetime,format="%d/%m/%Y %H:%M:%S")
#save the result to png
png(filename = "plot2.png",width=480,height=480)
#Generate the plot
with(power.data,{
  plot(Datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)", main="", xlab="")
}
     )
dev.off()