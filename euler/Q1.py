import numpy

limit = 1000
sum = 0

for i in range(limit):
    if ((i % 5 == 0) or (i % 3 == 0)):
        sum += i
            
print sum