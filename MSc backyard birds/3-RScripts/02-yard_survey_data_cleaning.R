#this script has all the data modications and cleaning
#packages used: tidyverse 

source("3-RScripts/0-packages.R")

yard_surveys <- read.csv("1-Input/yard_surveys.csv")


#Modifications in the column: Species

yard_surveys$Species[which(yard_surveys$Species== "HOSP ")] <- "HOSP"  
yard_surveys$Species[which(yard_surveys$Species== "HOSP  ")] <- "HOSP"   
yard_surveys$Species[which(yard_surveys$Species== "NOCA ")] <- "NOCA"  
yard_surveys$Species[which(yard_surveys$Species== "WBNH")] <- "WBNU"  
yard_surveys$Species[which(yard_surveys$Species== "SOSP ")] <- "SOSP" 

#Modifications in the column: Bird Scientific Name

yard_surveys$Bird.Scientific.Name[which(yard_surveys$Bird.Scientific.Name== "Cardinalis cardinalis ")] <- "Cardinalis cardinalis"
yard_surveys$Bird.Scientific.Name[which(yard_surveys$Bird.Scientific.Name== "Sita carolinensis")] <- "Sitta carolinensis"
yard_surveys$Bird.Scientific.Name[which(yard_surveys$Bird.Scientific.Name== "Turdus migratorius ")] <- "Turdus migratorius"
yard_surveys$Bird.Scientific.Name[which(yard_surveys$Bird.Scientific.Name== "Leuconotopicus villosus")] <- "Picoides villosus"
yard_surveys$Bird.Scientific.Name[which(yard_surveys$Bird.Scientific.Name== "Picoides pubescens")] <- "Picoides bubescens"
yard_surveys$Bird.Scientific.Name[which(yard_surveys$Bird.Scientific.Name== "Passer domesticus ")] <- "Passer domesticus"

#Modifications in the column: Scientific Name (of plants)

yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Acer platanoides ")] <- "Acer platanoides"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "40")] <- "Fraxinus americana"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Fraxinus americana ")] <- "Fraxinus americana"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Faxinus americana")] <- "Fraxinus americana"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Faxinus americana")] <- "Fraxinus americana"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Kolkwitzia amibilis")] <- "Kolkwitzia amabilis"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Magnolia liliiflora")] <- "Magnolia liliflora"
yard_surveys$Scientific.Name[which(yard_surveys$Scientific.Name== "Acer negundo ")] <- "Acer negundo"

#Modifications in the column: Behaviour

yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Bathing ")] <- "Bathe"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Bill wipe, Preen, Perch")] <- "Bill wipe"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Eat seeds ")] <- "Feeder"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Eat at bird feeder")] <- "Feeder"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Eat")] <- "Feeder"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Glean ")] <- "Glean"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Perch ")] <- "Perch"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Preen, Bill wipe")] <- "Preen"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Preen, Perch")] <- "Preen"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Sally ")] <- "Sally"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Sit on nest")] <- "Incubate"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Vocalize ")] <- "Vocalize"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Vocalize, Peck")] <- "Vocalize"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Vocalize, Preen")] <- "Vocalize"
yard_surveys$Behaviour[which(yard_surveys$Scientific.Name== "Vocalize, Perch, Preen")] <- "Vocalize"

#Modifications in the column: Plant species 

yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Bath")] <- "Bird bath"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Bath ")] <- "Bird bath"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Burning bush ")] <- "Burning bush"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Dead standing ")] <- "Dead standing"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "European crab apple")] <- "European crabapple"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Ground ")] <- "Ground"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Norway spruce ")] <- "Norway spruce"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "Trumpet honeysuckle ")] <- "Trumpet honeysuckle"
yard_surveys$Plant.species[which(yard_surveys$Plant.species== "White ash ")] <- "White ash"


#Changing blanks into NAs

yard_surveys$Species <- na_if(yard_surveys$Species, "")

#Joining the Elton birds dataset of ecological traits to the yard surveys dataset

yard_surveys_cleaned <- left_join(yard_surveys,elton_birds, by = join_by("Bird.Scientific.Name" == "scientificNameStd"))

#Saving this under 2-Cleaned_data

saveRDS(yard_surveys_cleaned, "2-Cleaned_data/yard_data_cleaned.RDS")



#this are just tables to visualize where the mistakes are 

table(yard_surveys$Species) 
table(yard_surveys$Bird.Scientific.Name)
table(yard_surveys$Scientific.Name)
table(yard_surveys$Plant.species)
table(yard_surveys$DBH..cm.)


