# A quick review of what we talked about last week

# create a df with data.frame()

mydf <- data.frame(col1 = c("Mary", "Tom", "Jason", "Kathy", "Gousheng"),
                   col2 = c(80, 90, 86, 92, 98))

mydf

# scripting a column with a dollar sign
mydf$col1

mydf$col2

# scripting by numbers
mydf[1,]
mydf[,2]

mydf[3,2]


###############################

# dplyr: Swiss knife for data manipulation

# dplyr:  a package for data manipulation
# The major functions of dplyr include:

# 1) select(): selects variables (columns)
# 2) filter(): filters cases (rows)
# 3) mutate(): adds new variables (columns)
# 4) arrange(): orders rows
# 5) group_by(): groups variables by condition
# 6) summarise(): conducts statistical analyses


# the dataset for the experiments in this chapter
# a bibliometric dataset I downloaded from the Web of Science with the query term "readability" in "Topics"
# the dataset includes 4051 pieces of bibliometric information concerning articles pertainint to "readability" published from 2001 to 2020


library(dplyr)

file_path <- "/Users/leo/Desktop/PolyU_R_Statistics_workshops/0data/"
file_name <- "readability_wos_raw_data.csv"
my_file <- paste0(file_path, file_name)
my_file

mydf <- read.csv(my_file)

str(mydf)

glimpse(mydf)

###################################

# pipe: %>% 
# shortcut: CTRL + SHIFT + M

###################################

# 1) select(): selects variables (columns)

mydf$wos_id

mydf2 <- mydf %>% select(wos_id, 
                         publication_year, 
                         times_cited_wos_core)


glimpse(mydf2)

# change column names

mydf2 <- mydf %>% select(wos_id, 
                         year = publication_year, 
                         citations = times_cited_wos_core) 
glimpse(mydf2)

########################################

# 2) filter(): filters cases (rows)

unique(mydf2$year) %>% sort()

min(mydf2$citations)
max(mydf2$citations)

mydf3 <- mydf2 %>% filter(year == 2020)
glimpse(mydf3)


mydf4 <- mydf2 %>% filter(year >= 2010 & citations <= 10)
glimpse(mydf4)
head(mydf4)


mydf5 <- mydf2 %>% filter(year >= 2010 | citations <= 10)
glimpse(mydf5)
head(mydf5)


# 3) mutate(): adds new variables (columns)

# log(): computes logarithms, by default natural logarithms

mydf2$citations_log <- log(mydf2$citations)

glimpse(mydf2)

mydf6 <- mydf2 %>% mutate(citations_log = log(citations))

head(mydf6)


mydf2 <- mydf2 %>% select(-citations_log)

glimpse(mydf2)

# 4) arrange(): orders rows


mydf7 <- mydf2 %>% arrange(year)

head(mydf7)

mydf8 <- mydf2 %>% arrange(citations, year)
head(mydf8)

mydf9 <- mydf2 %>% arrange(desc(citations), year)
head(mydf9)


# 5) group_by(): groups variables by condition

mydf10 <- mydf2 %>% 
    group_by(year) %>% 
    count()
    
mydf10

mydf10 %>% arrange(desc(n))


# 6) summarise(): conducts statistical analyses

mydf11 <- mydf2 %>% 
    group_by(year) %>% 
    summarise(n = n()) # equivalent to count()

mydf11


mydf12 <- mydf2 %>% 
  group_by(year) %>% 
  summarise(mean = mean(citations))

mydf12


mydf13 <- mydf2 %>% 
    group_by(year) %>% 
    summarise(n = n(),
              total = sum(citations),
              mean1 = mean(citations), # with a function
              mean2 = total/n)  # with a formula


mydf13


###############
# calculate normalised citations

head(mydf2)

mydf_citations_mean <- mydf2 %>% 
    group_by(year) %>% 
    summarise(citations_mean = mean(citations))

glimpse(mydf_citations_mean)


mydf14 <- left_join(mydf2, mydf_citations_mean, by = "year")

head(mydf14)


mydf15 <- mydf14 %>%
    mutate(citations_norm = citations / citations_mean)

head(mydf15)




mydf14$citations_norm <- mydf14$citations / mydf14$citations_mean

head(mydf14)

