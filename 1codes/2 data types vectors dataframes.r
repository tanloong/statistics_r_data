print('Hello world!')

2**3

log(8)

log2(8)

m <-  72
sd <- 12

x <- 90

z <- ((x - m)/sd ) * 100 + 500

print(z)

# vector

c()   # concatenate, v. 

myscore <- c(82, 90, 92, 60)

myscore

myscore + 1

myscore*10

myscore / 2

z <- ((myscore - m)/sd ) * 100 + 500
z


c()

myvector <- 1:10

myvector

sample(myvector, 6, replace = T)


set.seed(1)

sample(myvector, 6, replace = T)



id_v <- c(1, 2, 5, 6, 8)

name_v <- c("Mary", "Tom", "Kathy", "Michael", "Gousheng")

name_v

# cannot calculate on strings
name_v *2

id_v * 2


myvec1 <- 1:50
myvec2 <- 51:100

myvec3 <- myvec1 + myvec2
myvec3

myvec4 <- c(myvec1, myvec2)
myvec4


myvec5 <- c(id_v, name_v)
myvec5


id_v

1:10

seq(1, 10, by=3)

rep()

rep(1:3, 3)


rep(1:4, each = 2)


g <- as.factor(c('male', 'female'))

gender <- rep(c('male', 'female'), each=50)

gender

1:5

mystring <- as.character(1:5)
mystring

as.integer(mystring)

as.double(mystring)

# subscripting 
# extract part of a vector

myvec <- 1:10

myvec[2]
myvec[5]

name_v

name_v[3]

name_v[1:3]


length()

length(name_v)


name_v[length(name_v)-1]


name_v

# remove the first one
name_v[-1]

# remove the last one
name_v[-length(name_v)]


name_v[1:(length(name_v) - 2)]


name_v

sort(name_v)


myv <- c("Gousheng", "kathy", "Kathy", "Mary", "michael", "Tom")

sort(myv)


1:15

mymatrix1 <- matrix(1:15, nrow = 5, ncol = 3)

mymatrix1

mymatrix2 <- matrix(1:15, nrow = 3, ncol = 5)

mymatrix2

mymatrix3 <- matrix(1:15, nrow = 3, ncol = 5, byrow = T)

mymatrix3



mymatrix1 <- matrix(1:15, nrow = 5, ncol = 3)

mymatrix1

colnames(mymatrix1) <-  c('score1', 'score2', 'score3')

mymatrix1[,1]

mymatrix1[,2]

mymatrix1[1,]

mymatrix1

mymatrix1[1:2,]

mymatrix1[,2:3]

mymatrix1[1,2:3]

