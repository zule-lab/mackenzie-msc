source("3-RScripts/packages.R")

yard_data <- read.csv("1-Input/Clean_Private_Cu.csv")
View(yard_data) 


wide.pr<- table(yard_data$Species.Code, yard_data$Yard.Code)
wide.pr<-as.data.frame(wide.pr)
wide.pr<-spread(wide.pr, "Var1", "Freq")

pr.r<-ddply(wide.pr,~Var2,function(x) {
  data.frame(RICHNESS=sum(x[-1]>0))
})
pr.r


describe(pr.r$RICHNESS)  


abund.pr<-ddply(wide.pr,~Var2,function(x) {
  data.frame(ABUNDANCE=sum(x[-1]))
})


describe(abund.pr$ABUNDANCE)
sum(abund.pr$ABUNDANCE)


yard_summary <- yard_data %>%
  group_by(Yard.Code) %>% 
  summarise_at(vars(DBH.Round), list(DBH = mean))

less_than_20 <- read.csv("1-Input/less-than-20.csv")
more_than_20 <- read.csv("1-Input/more-than-20.csv")

hedge_less_than_20 <- subset(less_than_20,Hedge == "yes")
no_hedge_less_than_20 <- subset(less_than_20,Hedge == "no")

hedge_more_than_20 <- subset(more_than_20,Hedge == "yes")
no_hedge_more_than_20 <- subset(more_than_20,Hedge == "no")

bibentry(
  bibtype = "Book",
  textVersion = "H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.",
  header = "To cite ggplot2 in publications, please use",
  author = "Hadley Wickham",
  title = "ggplot2: Elegant Graphics for Data Analysis",
  publisher = "Springer-Verlag New York",
  year = "2016",
  isbn = "978-3-319-24277-4",
  url = "https://ggplot2.tidyverse.org",
)
