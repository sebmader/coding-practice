#################### 
# coding fo myself #
####################
# written by HAWKI2(OpenAI GPT 4o) and Sebastian Mader, 08.10.25
# "I get it, and nobody else has to understand this." - me, before I break down
# trying to understand the code after my vacation

# function to calculate
calculateSomething <- function(x, y) {
  a <- x + y
  b <- a * sample(1:10, 1)
  b
}

# create dataset
df <- data.frame(d1 = rnorm(10), d2 = runif(10), d3 = rpois(10, lambda = 5))

# loop through dataset
for (i in 1:nrow(df)) {
  temp <- calculateSomething(df$d1[i], df$d2[i])
  df$d3[i] <- temp / (i + 1)
}

# calculate result
result <- sapply(df$d3, function(v) {
  res <- sum(v, sample(1:5, 1))
  res <- res - prod(v, 2)
  return(res)
})

# print result
print(result)