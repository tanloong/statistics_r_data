

#####################################

######

# arithmetic mean

my_vector <- c(86, 78, 37, 90, 28)

sum(my_vector) / length(my_vector)

######

# or 

mean()
mode()
median()

mean(my_vector)

############


# weighted mean

# weighted_mean = 
# (x1*w1 + x2*w2 + ... + xn*wn) / (w1 + w2 + ... + wn)
# x: raw score; w: weight 

my_vector <- c(86, 90, 88, 92, 96)
# the same weight
my_weight <- c(0.2, 0.2, 0.2, 0.2, 0.2)

mean_vector <- sum(my_vector * my_weight) / sum(my_weight)

mean_vector

mean(my_vector)

######

my_vector <- c(86, 90, 88, 92, 96)
# different weight
my_weight <- c(0.15, 0.15, 0.15, 0.15, 0.4)

mean_vector <- sum(my_vector * my_weight) / sum(my_weight)

mean_vector


#####################################

######
# Median
# the middlemost value in a set of ordered values.

# The median can be a helpful alternative to the mean when data is skewed by outliers, or values that are extremely large and small compared to the rest of the values.

my_vector <- c(60, 86, 30, 90, 88, 88, 92, 96, 100)

ordered <- sort(my_vector)

ordered  # the median is 88


median(my_vector)

mean(my_vector) # the mean is 81.11



######

# mode

# The mode is the most frequently occurring set of values. 
# When no value occurs more than once, there is no mode. 
# When two values occur with an equal amount of frequency, then the dataset is considered bimodal.

mode(my_vector)

calculate_mode <- function(vector) {  
    vector_unique <- unique(vector)
    vector_unique[which.max(tabulate(match(vector, vector_unique)))]  
}  


calculate_mode(my_vector)


################

# Variance
# variance = sum( (x - mean)**2 ) / (n - 1)

# Standard Deviation
# standard_deviation = sqrt(variance)


my_vector
mean(my_vector)


var(my_vector)

sd(my_vector)


#####################################

#################################
#  Normality Test
#################################

# Three normality tests

# 1
# The Shapiro-Wilk test of normality
# shapiro.test() 
# used for a small dataset (e.g. > 50)

shapiro.test(x)

# 2
# the Kolmogorov-Smirnov test of normality
# ks.test()
# ks.test(x, y)

# y = 'pnorm' in this case
# ks.test(x, 'pnorm')


ks.test(x, 'pnorm')

# 3
# the Lilliefors test
# for small samples
# lillie.test() from the nortest package

# install.packages("nortest")
library(nortest)

lillie.test(x)

###############################

# to test if the citation counts are normally distributed

library(dplyr)

mydf <- read.csv("../0data/readability_wos_raw_data.csv")
glimpse(mydf)

x <- mydf$times_cited_wos_core

plot(x, dnorm(x))

#create Q-Q plot
qqnorm(x)
qqline(x)

ks.test(x, 'pnorm')


# to test if the references counts are normally distributed

x <- mydf$cited_reference_count

plot(x, dnorm(x))

#create Q-Q plot
qqnorm(x)
qqline(x)

ks.test(x, 'pnorm')

#############################
# Zipf's distribution
# an exponential distribution

library(dplyr)

glimpse(mydf)

# calculate word frequency of the abstracts

abstracts <- paste(mydf$abstract, collapse=" ")

abstracts <- gsub('\\.', '', abstracts)
abstracts <- gsub('\\,', '', abstracts)

words <- strsplit(abstracts, ' ')
words

df_wfreq <- data.frame(table(unlist(words)))

glimpse(df_wfreq)

df_wfreq2 <- df_wfreq %>% 
    arrange(desc(Freq))

colnames(df_wfreq2) <- c('Words', 'Freq')
glimpse(df_wfreq2)
head(df_wfreq2)

plot(df_wfreq2$Freq)

library(ggplot2)

df_wfreq2 %>% 
  ggplot(aes(x = 1:length(Freq), 
             y = Freq)) + 
  geom_point()

