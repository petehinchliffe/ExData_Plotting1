# Create plot 1 
hpcAll <- read.csv('household_power_consumption.txt',sep=';',stringsAsFactors=FALSE)
hpc <- hpcAll[hpcAll$Date == '1/2/2007' | hpcAll$Date == '2/2/2007',]
pdf('plot1.pdf')
hist(as.numeric(hpc$Global_active_power), main='Global Active Power',col='red',xlab='Global Active Power (kilowatts)')
dev.off()