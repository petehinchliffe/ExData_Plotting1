# Create plot 4
hpcAll <- read.csv('household_power_consumption.txt',sep=';',stringsAsFactors=FALSE)
hpc <- hpcAll[hpcAll$Date == '1/2/2007' | hpcAll$Date == '2/2/2007',]
DTs <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc <- cbind(DTs,hpc)

png('plot4.png', width=480, height=480)

# use 2x2 layout
par(mfrow=c(2,2))
#plot2
with(hpc, plot(DTs, Global_active_power, type='l', main='', xlab='',ylab='Global Active Power (kilowatts)'))
#  Voltage plot
with(hpc, plot(DTs, Voltage, type='l', main='', xlab='datetime',ylab='Voltage'))
#plot 3
with(hpc, plot(DTs, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(hpc, lines(DTs, Sub_metering_2, type='l', col="red"))
with(hpc, lines(DTs, Sub_metering_3, type='l', col="blue"))
legend(x='topright',legend=c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),col=c("black","red","blue"),lwd=2)
# Reactive power plot
with(hpc, plot(DTs, Global_reactive_power, type='l', main='', xlab='datetime',ylab='Global_reactive_power'))
#finish pdf
dev.off()