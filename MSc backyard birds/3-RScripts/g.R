source("3-RScripts/0-packages.R")


yards <- readRDS("2-Cleaned_data/yard_data_cleaned.RDS")
streets <- readRDS("2-Cleaned_data/street_data_cleaned.RDS")


byb <- yards %>%
  bind_rows(streets)

saveRDS(byb, "2-Cleaned_data/backyard_birds.RDS")


top.trees = subset(byb, Plant.species == "Silver maple"| Plant.species == "Common lilac" | Plant.species == "Norway maple" | 
                     Plant.species == "White cedar"| Plant.species == "Siberian elm"| Plant.species == "Norway spruce"| 
                     Plant.species == "Tatrian honeysuckle")

trees_used <- ggplot(data=top.trees, aes(Plant.species)) +
  geom_bar(aes(fill = Type)) + 
  labs (
    title = "Trees used by birds",
    x="Plant species", 
    y="Number of observations")
trees_used

birds <- ggplot(data=byb, aes(Species.x)) +
  geom_bar() + 
  labs (
    title = "Birds",
    x="Alpha_code", 
    y="Count")
birds


behaviour <- ggplot(data=byb, aes(BehaviourType)) +
  geom_bar() + 
  labs (
    title = "Behaviours",
    x="Behaviour", 
    y="Count") + 
  facet_wrap(vars(Type))+ 
  scale_x_discrete(guide = guide_axis(n.dodge=2))+ 
  theme(panel.spacing.x = unit(15, "mm"))
behaviour
table(byb$Plant.species)
