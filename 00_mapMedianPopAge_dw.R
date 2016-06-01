library(countrycode)
library(swiMap)

data <- read.csv("data/medianAge_CIAfact_2015_b.csv", stringsAsFactors = F)

#remove trailing whitespaces
data[,1] <- gsub("\\s+$", "", data[,1])
colnames(data) <- c("country", "medianAge")


data$iso3 <- countrycode(data[,1], "country.name", "iso3c")

langs <- colnames(countryTranslations)[-(1:3)]

data <- cbind(data, countryTranslation(data$iso3, langs) %>% select(-code))

write.csv(select(data, -country), file = "input/medianAge_CIAfact_2015.csv", row.names = F)
