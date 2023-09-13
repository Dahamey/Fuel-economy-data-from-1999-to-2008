library(tidyverse)

#built-in datasets in R
data()

View(mpg)
?mpg

#Top level overview :
glimpse(mpg)

#dataset where city mileage is at least 20 :
mpg_efficient <- filter(mpg, cty>=20)
View(mpg_efficient)

#Ford dataset
mpg_ford <- filter(mpg, manufacturer == "ford")
View(mpg_ford)

#converting miles per hour to kilometers per liter :
mpg_metric <- mutate(mpg, cty_metric = cty * 0.425144)
glimpse(mpg_metric)


# Mean and Median of city mileage per class
mpg %>% 
  group_by(class) %>% 
  summarise(mean(cty),
            median(cty))





#Data Viz with ggplot2

ggplot(mpg, aes(x= cty)) +
  geom_histogram() +
  labs(x="City Mileage")

ggplot(mpg, aes(x= cty)) +
  geom_freqpoly() +
  labs(x="City Mileage")

# City v Highway mileage scatterplot and regression line:
ggplot(mpg, aes(x =cty,
                y = hwy))+
  geom_point()+
  labs(x="City Mileage",
       y="Highway")+
  geom_smooth(method ="lm")

ggplot(mpg, aes(x =cty,
                y = hwy,
                color = class))+
  geom_point()+
  scale_color_brewer(palette = "Dark2")