# Create plot 3
#read data and get dates of interest 
hpcAll <- read.csv('household_power_consumption.txt',sep=';',stringsAsFactors=FALSE)
hpc <- hpcAll[hpcAll$Date == '1/2/2007' | hpcAll$Date == '2/2/2007',]
# add a datetime column
DTs <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc <- cbind(DTs,hpc)
#start pdf
png('plot3.png', width=480, height=480)
#plot
with(hpc, plot(DTs, Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'))
with(hpc, lines(DTs, Sub_metering_2, type='l', col="red"))
with(hpc, lines(DTs, Sub_metering_3, type='l', col="blue"))
legend(x='topright',legend=c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'),col=c("black","red","blue"),lwd=2)
#finish pdf
dev.off()