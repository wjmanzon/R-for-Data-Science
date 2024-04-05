library(tidyverse)

oilChanges <- c(3,5,2,3,1,4,6,4,3,2,0,10,7,8)

repairs <- c(300, 300, 500, 400, 700, 420, 100, 290,
             + 475, 620, 600, 0, 200, 50)

miles <- c(20100, 23200, 19200, 22100, 18400, 23400,
           + 17900, 19900, 20100, 24100, 18200, 19600, 20800,
           + 19700)

oil <- data.frame(oilChanges, repairs, miles)

View(oil)

plot(oil$oilChanges, oil$repairs)
#RPlot46

plot(oil$miles, oil$repairs)
#RPlot47

model1 <- lm(formula=repairs ~ oilChanges, data = oil)

summary(model1)

plot(oil$oilChanges, oil$repairs)

abline(model1)
#RPlot48

m <- lm(formula=repairs ~ oilChanges + miles, 
        + data=oil)
summary(m)
#This didn't work

oil$oilChangeCost <- oil$oilChanges * 350

oil$totalCost <- oil$oilChangeCost + oil$repairs

m <-lm(formula=totalCost ~ oilChanges, data=oil)

plot(oil$oilChanges, oil$totalCost)
#Rplot49

abline(m)
#Rplot50

test = data.frame(oilChanges=0)
predict(m,test, type="response")

test = data.frame(oilChanges=5)
predict(m,test, type="response")

test = data.frame(oilChanges=10)
predict(m,test, type="response")

ggplot(oil, aes(x = oilChanges, y = totalCost)) +
  geom_point() +
  stat_smooth(method = "lm", col = "red")
#Rplot51
