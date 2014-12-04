#-------------------------------------------------------------------------------
#Question 1
#-------------------------------------------------------------------------------
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv',
              'hid.csv', method = 'curl')
data <- read.csv('hid.csv', header = T)
agricultureLocal <- data$AGS == 6 & data$ACR == 3
View(data[which(agricultureLocal), ])

#-------------------------------------------------------------------------------
# Question 2
#-------------------------------------------------------------------------------

require('jpeg')
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg',
              'jeff.jpg', method = 'curl')
x <- readJPEG('jeff.jpg',native = TRUE)
quantile(x, probs = c(0.3,0.8))

#-------------------------------------------------------------------------------
# Question 3
#-------------------------------------------------------------------------------

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              'gdp.csv', method = 'curl')
GDP <- read.csv('gdp.csv', header = T, skip = 3L)
GDP <- GDP[-1 ,c(1,2,4,5)]
GDP <- GDP[1:190,]
colnames(GDP) <- c("CountryCode", "Ranking", "Long.Name", "USD")


download.file(
  'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
              'country.csv', method = 'curl')
country <- read.csv('country.csv', header = T)

mergedData <- merge(GDP, country, by = "CountryCode")
mergedData$Ranking <- as.numeric(as.character(mergedData$Ranking))
View(mergedData[order(-mergedData$Ranking), ])

#-------------------------------------------------------------------------------
# Question 4
#-------------------------------------------------------------------------------

highNonOECD <- subset(mergedData, 
                      mergedData$Income.Group == "High income: nonOECD")
highOECD <- subset(mergedData, 
                   mergedData$Income.Group == "High income: OECD")

mean(highOECD$Ranking)
mean(highNonOECD$Ranking)

#-------------------------------------------------------------------------------
# Question 5
#-------------------------------------------------------------------------------

x <- quantile(mergedData$Ranking, probs = c(0.2, 0.4, 0.6, 0.8, 1))
mergedData <- mergedData[order(mergedData$Ranking), ]
topQuant <- mergedData[1:38, ]
View(subset(topQuant, topQuant$Income.Group == "Lower middle income"))