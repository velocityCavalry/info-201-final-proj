library(dplyr)
country_names <- read.csv(file = "../processed_data/country.csv", stringsAsFactors = FALSE)
data <- read.csv(file = "../origin_data/WDIData.csv", stringsAsFactors = FALSE)
country_names_list <- country_names$Country.Code
processed <- data %>%
    filter(Indicator.Name == "GDP growth (annual %)" | Indicator.Name == "GDP per capita (current US$)" |
               Indicator.Name == "Adjusted savings: education expenditure (current US$)" |
               Indicator.Name == "Birth rate, crude (per 1,000 people)" |
               Indicator.Name == "Death rate, crude (per 1,000 people)" |
               Indicator.Name == "Coverage of social insurance programs (% of population)" |
               Indicator.Name == "Employment to population ratio, 15+, total (%) (national estimate)" |
               Indicator.Name == "Access to electricity (% of population)" |
               Indicator.Name == "Forest area (% of land area)") %>%
    filter(Country.Code %in% country_names_list)
write.csv(processed, file = "../processed_data/filted_general_data.csv", row.names = FALSE)