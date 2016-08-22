plot2<-function(){

  path<-"./exp/household_power_consumption.txt"
  Pdata<<-read.table(path,na.strings = "?",header=T,sep=";",quote = "")
 
   data1<<-subset(Pdata,Date=="1/2/2007" | Date=="2/2/2007")
 
  x<-data.frame(d=paste(data1$Date,data1$Time),data1$Global_active_power)
  y<<-data.frame(d=strptime(x$d, "%d/%m/%Y %H:%M:%S"),Global_active_power=data1$Global_active_power)
  
  
  plot(y$d,y$Global_active_power,ylab="Global active power (killowats)",xlab="",type="l")
  
  dev.copy(png,file="./exp/plot2.png")
  dev.off()
}