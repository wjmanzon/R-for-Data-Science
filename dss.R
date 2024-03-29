library(tidyverse)

data <- read.csv("download/covid.csv")

?tidyverse

packages(tidyverse)

data()

View(population)

data1 <- population %>% 
 filter(country == c("Afghanistan", "Albania"))


ggplot(data = data1) +
   geom_boxplot(mapping = aes(x = country, y = population))

