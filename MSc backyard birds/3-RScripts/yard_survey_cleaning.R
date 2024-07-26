source("3-RScripts/packages.R")

yard_surveys <- read.csv("1-Input/yard_surveys.csv")



yard_surveysC <- yard_surveys %>% 
  mutate(NewVar = case_when(Species == "SOSP " ~ "SOSP", 
  


#mutate(Date = as.Date(Date, format = "%d/%m/%Y")))

table(yard_surveysC$Species)


Species == "HOSP" | Species == " HOSP" | Species == "HOSP " ~ "HOSP",
Species == "NOCA" | Species == "NOCA" ~ "NOCA",
Species == "WBNH" ~ "WBNU", 
                        
