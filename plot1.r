plot1<-function(){
  
  path<-"./exp/household_power_consumption.txt"
  txt<-c("01/02/2007","02/02/2007")
  Pdata<<-read.table(path,na.strings = "?",header=T,sep=";",quote = "")
  data1<<-subset(Pdata,Date=="1/2/2007" | Date=="2/2/2007")
  
  hist(data1$Global_active_power,xlab="Global active power (killowats)",col="red",main="Global Active Power")

  dev.copy(png,file="./exp/plot1.png")
  dev.off()
  }