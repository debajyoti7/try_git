import time
import numpy as np

limit = 10001

def isPrime(divisor):
    bench = np.sqrt(divisor)
    for j in range(3 , int(bench)+1, 2):
        if ( (divisor % j) == 0) :
            return 0
    return 1

def findPrime(n):
    i = 3
    count = 1
    while(count < n):
        if ( isPrime(i) ):
            count += 1
            if(count == n):
                return i
        i += 2

def run():
    start = time.clock()
    print findPrime(limit)
    end = time.clock()
    print 'Code time %.6f seconds' % (end - start)


if __name__ == "__main__":
    run()
