print('Hello!')


# shortcut for comment: # 
# Mac: "shift" + "command" + "c" 
# Windows: "shift" + "control" + "c"

# shortcut for the assignment operator: <- 
# Mac: "option" + "-" 
# Windows: "alt" + "-"

# shortcut for the pipe in dplyr: %>% 
# Mac: "shift" + "command" + "m" 
# Windows: "shift" + "control" + "m"




str1 <- 'I'
str2 <- "love"
str3 <- 'this'
str4 <- "game"

print(str1)
print(str2)
print(str3)
print(str4)


int1 <- 1
int2 <- 2

  
int1 + int2

# does not work
str1+str2+str3+str4

mystr <- paste(str1, str2, str3, str4)

print(mystr)


mystr <- paste(str1, str2, str3, str4, sep = '')

print(mystr)


address <- '/Users/leo/Desktop/PolyU_R_Statistics_workshops/0data/'
file <- 'correlation_data.csv'

myfile <- paste(address, file, sep = '')

print(myfile)


myfile <- paste0(address, file)

print(myfile)


str5 <- 'I love this game.'
print(str5)

nchar(str5)

1+2
3-2
4*5
5/6

2**3
2^3


