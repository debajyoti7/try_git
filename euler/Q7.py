import time
import numpy as np

limit = 10001

def isPrime(divisor):
    bench = np.sqrt(divisor)
    j = 3
    while (j <= bench):
        if (0 == (divisor % j)):
            return 0
        j += 2
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
