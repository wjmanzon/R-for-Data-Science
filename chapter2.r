# Load library
library(nycflights13)

# Load package
nycflights13::flights

# See tabular data
flights

# Retrieve specific information from the data
filter(flights, month==1, day==1)

# Store in a variable
jan1 <- filter(flights, month==1, day==1)

# View the data stored in variable
jan1

# Save the data in a variable and display the results on screen
(dec25 <- filter(flights, month==12, day==25))

#Common mistake is using = not ==
filter(flights, month =1) # Returns an error

sqrt(2)^2 == 2
# FALSE

1/49 * 49 == 1
# FALSE

# Computers use finite precision arithmetic (they can't store an infinite number of digits)
# so remember that every number you see is an approximation. Instead of relying on ==,
# use near()

near(sqrt(2)^2, 2)
# TRUE

near(1/49 * 49, 1)
# TRUE