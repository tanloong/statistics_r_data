
#library(readr)

library(dplyr)

data1 <- read.csv('../0data/t_test_paired.csv')

glimpse(data1)


data1$test1

data1$test2

# cor.test(x, y)
cor.test(data1$test1, data1$test2)

# The results showed that the scores in Test 1 were significantly correlated with those in Test 2 (r2 = 0.53, df = 33, p. < 0.00).

#####################################################

data2 <- read.csv("../0data/regression.csv")

glimpse(data2)

cor(data2)


data3 <- data2 %>% 
  select(Factor1, Factor2, Factor3, Factor4)

glimpse(data3)

cor(data3)

# install.packages(corrplot)

library(corrplot)


corrplot(cor(data3))

