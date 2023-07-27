
# ANOVA

##########################################
# One-way ANOVA
##########################################

# The data used here for the one-way ANOVA is a set of scores from a reading comprehension test of three groups/classes of students. 

library(dplyr)

file_in <- "../0data/anova_data1.csv"

data1 <- read.csv(file_in)

glimpse(data1)

unique(data1$group)

unique()


#convert group into factor variable
as.factor() 
as.character()  # to string
as.integer() # to integer
as.double() # to float
as.data.frame()
as.matrix()


data1$group <-  as.factor(data1$group)

glimpse(data1)

anova_fit <-  aov(score ~ group, data = data1)


# Summary of the analysis
summary(anova_fit)

# F(2, 147)=3.436, p. = 0.0348)


################

# We then perform multiple pairwise comparisons between the menon-parametric vaans of groups with Tukey Honest Significant Differences (TukeyHSD()).
TukeyHSD(anova_fit)


# The are marginally significantly different. ...
# With that said, we should be cautious to generalise the results/findings here. 



#########################
# the variant of the one-way ANOVA is the Kruskal Wallis Test, which does not assume the homogeneity of variance of all groups of data. 
kruskal.test(data1$score ~ data1$group)


# Another non-parametric variant of the one-way ANOVA is the Welch one-way test, which does not assume the homogeneity of variance of all groups of data, either. The function for the Welch one-way test is oneway.test().

oneway.test()

oneway.test(score ~ group, data = data1)

##########################################
# Repeated measures ANOVA
##########################################

# The data used here for the repeated measures ANOVA is a set of scores from three reading comprehension tests of a group/class of students. The three reading comprehension tests refer to three conditions of new words notation: sidenote, footnote, and none. 


library(dplyr)

data1 <- read.csv("../0data/anova_data2.csv")

glimpse(data1)

unique(data1$condition)

# Let’s convert two variables as factors. 
data1$id <- as.factor(data1$id)

data1$condition <- as.factor(data1$condition)

glimpse(data1)


# We fit the model for ANOVA with aov(), and consult the results with summary(). 

# anova
anova_fit <- aov(score ~ condition, 
                 data = data1)

# Summary of the analysis
summary(anova_fit)


# We can also fit the model with lme() from package nlme.
library(nlme)

anova_fit2 <- lme(score ~ condition,
                  random = ~1|id, 
                  data = data1)

anova(anova_fit2)


# Then, we can perform the Turkey post host tests with glht() from the multcomp package. 
library(multcomp)

summary(glht(anova_fit2, 
             linfct = mcp(condition = "Tukey")))

# Also, we can perform the Turkey post host tests with adjusted bonferroni with glht() from the multcomp package. 

summary(glht(
   anova_fit2,
   linfct = mcp(condition = "Tukey"),
   test = adjusted(type = "bonferroni")))

