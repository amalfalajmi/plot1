plot4<-function(){
  
  path<-"./exp/household_power_consumption.txt"
  Pdata<<-read.table(path,na.strings = "?",header=T,sep=";",quote = "")
  
  data1<<-subset(Pdata,Date=="1/2/2007" | Date=="2/2/2007")
  
  x<-data.frame(d=paste(data1$Date,data1$Time),data1$Global_active_power)
  y<<-data.frame(d=strptime(x$d, "%d/%m/%Y %H:%M:%S"),Global_active_power=data1$Global_active_power,Sub_metering_1=data1$Sub_metering_1,Sub_metering_2=data1$Sub_metering_2,Sub_metering_3=data1$Sub_metering_3,Voltage=data1$Voltage,Global_reactive_power=data1$Global_reactive_power)
  
  
  par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,0,0))
  ## 1st Plot
  plot(y$d,y$Global_active_power,ylab="Global active power",xlab="",type="l")
  ##2nd Plot
  plot(y$d,y$Voltage,ylab="Voltage",xlab="DateTime",type="l")
  ## 3rd Plot
  plot(y$d,y$Sub_metering_1,ylab="Energy Sub metering",xlab="",type="l")
  points(y$d, y$Sub_metering_2,col="red",type="l")
  points(y$d, y$Sub_metering_3,col="blue",type="l")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.6)
  
  ## 4th Plot
  plot(y$d,y$Global_reactive_power,ylab="Global_reactive_power",xlab="DateTime",type="l")
  
  ##
  dev.copy(png,file="./exp/plot4.png")
  dev.off()
}