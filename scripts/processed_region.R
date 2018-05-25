#extract data from wdicountry

#load library
library(dplyr)

#read csv
country_data <-
  read.csv(file = "../origin_data/WDICountry.csv",
           stringsAsFactors = FALSE)
series_data <- read.csv(file = "../origin_data/WDICountry-Series.csv",
                        stringsAsFactors = FALSE)
#extract countries
country <- series_data$CountryCode

#processed data
region_data <- country_data %>%
  filter(Country.Code %in% country) %>%
  select(Country.Code, Short.Name, Region)

incomegroup_data <-  country_data %>%
  filter(Country.Code %in% country) %>%
  select(Country.Code, Short.Name, Income.Group)

#write data
write.csv(country_data, file = "../processed_data/region.csv",
          row.names = FALSE)
write.csv(incomegroup_data, file = "../processed_data/income_group.csv",
          row.names = FALSE)