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

# if you place mappings in a geom function, ggplot2 will treat them as local mappings
# for the layer. It will use these mappings to extend or overwrite the global mappings
# FOR THAT LAYER ONLY. This makes it possible to display different aethetics in different layers:

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()
#RPlot25

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class =="subcompact"),
    se = FALSE
  )
#RPlot26. You can use the same idea to specify different data for each layer.
# Here, the smooth lin displays just a subset of the mpg dataset, the subcompact cars

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
#RPlot27

ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))
#RPlot28
# You can use stats and geoms interchangeably
# This works because geom has a default stat and every stat has a default geom

demo <- tribble(
  ~a, ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)

ggplot(data = demo) +
  geom_bar(
    mapping = aes(x = a, y = b), stat = "identity"
  )
#RPlot29

ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )
#RPlot30

ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )
#RPlot31

# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# POSITION ADJUSTMENTS

# color a bar chart using aesthetic of fill
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
#RPlot32

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))
#RPlot33

# if you map fill aesthetic to another variable like clarity,
# the bars are automatically stacked:
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))
#RPlot34

# bad example
# position = "identity" will place each object exactly 
# where it falls into the context of the graph
# To see the overlapping, we either need to make the bars
# slightly transparent by setting alpha to a small
# value, or completely transparent by setting fill = NA
ggplot(data = diamonds,
       mapping = aes(x = cut, fill = clarity)
) +
  geom_bar(alpha = 1/5, position = "identity")
#RPlot35

ggplot(
  data = diamonds,
  mapping = aes(x = cut, color = clarity)
) +
  geom_bar(fill = NA, position = "identity")
#RPlot36

# position = "fill" works like stacking, but makes each set of stacked
# bars the same height
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )
#RPlot37

# position = "dodge" places overlapping objects directly beside one another
# making it easier to compare individual values
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )
#RPlot38

# another type of adjustment that's not useful for bar charts
# but useful for scatterplots
# to avoid scatterplot gridding, we can set the position adjustment
# to "jitter" position = "jitter"

ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy),
    position = "jitter"
  )
#RPlot39


# -------------------------------------------------------------------------
# -------------------------------------------------------------------------
# COORDINATE SYSTEMS

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()
#RPlot40

# coord_flip() switches the x and y axes. Useful if you want horizontal boxplots

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()+
  coord_flip()
#RPlot41

# coord_quickmap() sets the aspect ratio correctly for maps

nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black")
#RPlot42












