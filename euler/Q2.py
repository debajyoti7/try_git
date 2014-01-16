import numpy

limit = 4000000
sum = 0
num1 = 0
num2 =  1
num3 = 0

while(num3 <= limit):
    num3 = num1+ num2
    num1 = num2
    num2 = num3
    
    if(num3 % 2 == 0):
          sum += num3
print sum