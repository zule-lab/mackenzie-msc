source("3-RScripts/packages.R")

backyard_map <- read.csv("1-Input/arbres-publics.csv")

NDG_public_trees <- subset(backyard_map,ARROND_NOM == "Côte-des-Neiges - Notre-Dame-de-Grâce")

NDG_map <- get_stadiamap(
  bbox = c(left = -73.7080, bottom = 45.4424, right = -73.5183, top = 45.5160), 
  maptype = "stamen_terrain", 
  zoom = 14, 
  register_stadiamaps(key, write = FALSE)) 

 bb <- c(xmin = -74.0788,
        ymin = 45.3414,
        xmax = -73.3894,
        ymax = 45.7224)

