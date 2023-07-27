
# T-test

########################################
# Independent Samples T-Test
#######################################


t.test(g1, g2, paired = T) #paired samples t test 

t.test(g1, g2, paired = F) #independent samples t test 



#library(readr)
library(dplyr)

# read in data
data1 <- read.csv("../0data/t_test_independent.csv")

# the read-in data is a data frame

# check the data structure of the read-in data

glimpse(data1)
head(data1)

g1 <- data1 %>% 
  filter(group == 1)

g2 <- data1 %>% 
  filter(group == 2)

t.test(g1$score, g2$score, 
       paired = F, 
       var.equal = T)


#######

# Levene’s test for homogeneity of variance prior to the t-test. 

#The function leveneTest() in the package car could help us with the Levene’s test. Therefore, we first install the package car together with the package lme4 (the package car is based on the package lme4 and requests the installation of it). 

### Levene’s test for homogeneity of variance
#install.packages("lme4")
#install.packages("car")

library("car")

# leveneTest()

# leveneTest(df$col ~ group, df)

leveneTest(data1$score ~ data1$group)

# Error in leveneTest.formula(data1$score ~ data1$group) : 
#Levene's test is not appropriate with quantitative explanatory variables.

# should convert group into factor

data1$group <- as.factor(data1$group)

leveneTest(data1$score ~ data1$group)

# the results showed that the variance is homogeneous

# t-test 

t.test(g1, g2, var.equal = T)


#######################################
# Paired samples t-test
#######################################

#library(readr)
library(dplyr)

data2 <- read.csv("../0data/t_test_paired.csv")

str(data2) 
glimpse(data2)


t.test(data2$test1, data2$test2, paired = T)

t.test(data2$test1, data2$test2, paired = F)


### Levene’s test for homogeneity of variance
group_factor <- rep(c("g1", "g2"), each = 35)

group_factor <- as.factor(group_factor)
group_factor

scores <- c(data2$test1, data2$test2)

scores

library("car")
# leveneTest()
leveneTest(scores ~ group_factor)


t.test(data2$test1, data2$test2, paired = T, var.equal = T)

mean(data2$test1)
mean(data2$test2)

#######################################
# One sample t-test
#######################################

t.test(data2$test2, mu = 75.52)

mean(data1$score)

t.test(data1$score, mu=73.52)

