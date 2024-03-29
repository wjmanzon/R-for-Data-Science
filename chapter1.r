# AESTHETIC MAPPINGS

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
  geom_point(mapping = aes(x = displ, y = hwy)) #rplot1

# the plot shows negative relationship between engine size (displ)
# and fuel efficiency (hwy) which means cars with big engines use more fuel

# REUSABLE TEMPLATE FOR MAKING GRAPHS WITH ggplot2
# ggplot(data = <DATASET>) +
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Exercises

ggplot(data = mpg)

# if you want to learn more about the data set..
?mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = cyl, y = hwy))
# why is the above plot not useful?

# map the colors of your points in the class variable to reveal the class of each car:
ggplot2::ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

# the outliers are sports cars (2 seaters) with big engines but small bodies
# which improves their gas mileage

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
# warning: using size for a discrete variable is not advised

#top
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# warning: using alpha for a discrete variable is not advised

#bottom
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# warning: can only plot six shapes at a time;
# additional groups will go unplotted

# make all points in plot blue
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
# it doesn't convey information about a variable but only
# changes the appearance of the plot

# what's wrong with the code below?
# why is the color not blue?
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy, color = "blue")
  )

ggplot(data = mpg)
  + geom_point(mapping = aes(x = displ, y = hwy))
# warning: don't put the + on the new line

?geom_point
# if you need to learn more about a function

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# FACETS
# Facets are subplots that each display one subset of data

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

# what do the empty cells in a plot with facet_grid(drv ~ cyl)
# mean? How do they relate to this plot?

ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))

?drv

view(mpg)

# what does . do?
ggplot(data = mpg) +
   geom_point(mapping = aes(x = displ, y = hwy)) +
   facet_grid(drv ~ .)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# the first faceted plot in this section
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)


# what are advantages to using faceting instead of the color aesthetic?
# what are the disadvantages?
# how might the balance change if you had a larger dataset?


# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# GEOMETRIC OBJECTS
# left
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# setting line type of a line
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
# the above code separates the cars into three lines based on their drv values

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_point(aes( y = hwy, x = displ, color = drv)) +
  geom_smooth(
    aes( y = hwy, x = displ, color = drv), 
    show.legend = FALSE
  )

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
#RPlot24 - code duplicate, bad example, hard to update

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
# the above example avoids this repetition by passing a set of mappings to ggplot()
# ggplot2 will treat these mappings as global mappings that apply to each geom in the graph


