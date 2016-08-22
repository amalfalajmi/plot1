plot3<-function(){
  
  path<-"./exp/household_power_consumption.txt"
  Pdata<<-read.table(path,na.strings = "?",header=T,sep=";",quote = "")
  
  data1<<-subset(Pdata,Date=="1/2/2007" | Date=="2/2/2007")
  
  x<-data.frame(d=paste(data1$Date,data1$Time),data1$Global_active_power)
  y<<-data.frame(d=strptime(x$d, "%d/%m/%Y %H:%M:%S"),Sub_metering_1=data1$Sub_metering_1,Sub_metering_2=data1$Sub_metering_2,Sub_metering_3=data1$Sub_metering_3)
  
  
  plot(y$d,y$Sub_metering_1,ylab="Energy Sub metering",xlab="",type="l")
  points(y$d, y$Sub_metering_2,col="red",type="l")
  points(y$d, y$Sub_metering_3,col="blue",type="l")
  legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.6)
  dev.copy(png,file="./exp/plot3.png")
  dev.off()
}