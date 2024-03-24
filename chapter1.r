# Do cars with big engines use more fuel 
# than cars with small engines?

# you only need to install the package once
# but you need to reload it every time you
# start a new session
library(tidyverse)

# mpg data frame contains observations collected
# by the US Environment Protection Agency on 38 car models
mpg

# to plot mpg, run this code to put displ on the x-axis and hwy
# on the y-axis:

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

# the plot shows negative relationship between engine size (displ)
# and fuel efficiency (hwy) which means cars with big engines use more fuel

# REUSABLE TEMPLATE FOR MAKING GRAPHS WITH ggplot2

ggplot(data = <DATASET>) +
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# Exercises

ggplot(data = mpg)

# if you want to learn more about the data set..
?mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))
# why is the above plot not useful?

