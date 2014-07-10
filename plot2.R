# Create plot 2 
hpcAll <- read.csv('household_power_consumption.txt',sep=';',stringsAsFactors=FALSE)
hpc <- hpcAll[hpcAll$Date == '1/2/2007' | hpcAll$Date == '2/2/2007',]
DTs <- strptime(paste(hpc$Date, hpc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
hpc <- cbind(DTs,hpc)

pdf('plot2.pdf')
with(hpc, plot(DTs, Global_active_power, type='l', main='', xlab='',ylab='Global Active Power (kilowatts)'))
dev.off()