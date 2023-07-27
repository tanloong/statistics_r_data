
#Chi-squared Test

# Lei and Liu (2019) reported the number of publications of System by decade. 
# Is there any difference in the number of publications by decade?

# Lei, Lei, & Liu, Dilin*. 2019. The research trends and contributions of System’s publications over the past four decades (1973–2017): A bibliometric analysis. System. 80:1-13. 

# Decades    1970s	1980s	1990s	2000s	2010s
# N_publications	129	    250	    308 	337 	565

c()  # combine, concatenate a vector of numbers/strings

#############################

# A chi-square (Χ2) goodness of fit test

num <- c(129, 250, 308, 337, 565)

# chisq.test(x) # x is a vector

chisq.test(num)

chisq.test(c(129, 250, 308, 337, 565))

# scientific notation

######################################

# A chi-square (Χ2) test of independence 

# Let us assume that the number of publications in another journal is as follows. 
# Is there any difference between that of System and that of the other journal?

# Decades       	1970s	1980s	1990s	2000s	2010s
# N_publications	120     226     329     330     530


num1 <- c(129, 250, 308, 337, 565)

num2 <- c(120, 226, 329, 330, 530)

chisq.test(num1, num2)



######

# Warning message:
# In chisq.test(num1, num2) : Chi-squared approximation may be incorrect

# try: Fisher's Exact Test

# c(num1, num2)

data.frame() # columns, different data types

matrix()  # columns, of the same data types

my_matrix <- matrix(c(num1, num2), ncol = 2)

my_matrix

fisher.test(my_matrix)

fisher.test(my_matrix, simulate.p.value=T)


v <- c(4, 7, 8, 10, 12)
chisq.test(v)
chisq.test(v*100)

