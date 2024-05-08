####deciding which of Kayleigh's yards to use

source("3-RScripts/packages.R")

summary_yard <- read.csv("1-Input/yard_summary.csv")

hedge_yards <- subset(summary_yard, presence.of.hedge == "yes")
hedgeless_yards <- subset(summary_yard, presence.of.hedge == "no")


survey_yards <- read.csv("1-Input/survey_yards.csv")

ggplot(survey_yards, aes(x=density, fill= (presence.of.hedge))) +
  geom_histogram( binwidth = 10) +
  facet_wrap(vars(presence.of.hedge))



