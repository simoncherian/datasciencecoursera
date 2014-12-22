#Question 1

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
              "hid.csv", method = 'curl')
hid <- read.csv('hid.csv', header = T, stringsAsFactors = F)
stringSplit <- strsplit(names(hid), 'wgtp')
stringSplit[[123]]

#Question 2

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
              'gdp.csv', method = 'curl')
gdp <- read.csv('gdp.csv', header = T, stringsAsFactors = F, nrows = 191,
                skip = 3)
gdp <- gdp[-1,-c(3,6:10)]
value <- gdp$US.dollars.
values <- gsub(",","",value)
values <- as.numeric(values)
mean(values, na.rm=T)

#Question 3

countryNames <- gdp$Economy
grep("^United",countryNames, value = TRUE)

#Question 4

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",
              "country.csv", method = 'curl')
country <- read.csv('country.csv', header = T, stringsAsFactors = F)
comments <- country$Special.Notes
length(grep('[Jj]une 30', comments))

#Question 5
library(quantmod)
library(lubridate)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
length(grep("^2012", as.character(sampleTimes)))

