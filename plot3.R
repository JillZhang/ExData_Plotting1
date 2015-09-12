#Read Data
power<-read.table("household_power_consumption.txt",header=TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
power.data<-subset(power,Date=="1/2/2007"|Date=="2/2/2007")
#Convert the date and 
power.data$Datetime<-paste(power.data$Date,power.data$Time,sep=" ")
power.data$Datetime<-strptime(power.data$Datetime,format="%d/%m/%Y %H:%M:%S")
#save the result to png
png(filename = "plot3.png",width=480,height=480)
#Generate the plot
with(power.data,{
plot(Datetime,Sub_metering_1,type="l",ylab="Energy sub metering", main="", xlab="")
lines(Datetime,Sub_metering_2,col="red")
lines(Datetime,Sub_metering_3,col="blue")
})
dev.off()