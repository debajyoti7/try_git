import numpy as np
import time

num  = 600851475143
flist = []

def isprime(divisor, n):
    bench = np.sqrt(divisor)
    i = 2
    while(i <= bench):
        if( 0 == (divisor % i)):
            divisor = flist(n)
            isprime(divisor, n -1)
        i += 1
    return divisor
    
def factorise(num):
    factor = 2
    while (num > 1):
        if(0 == (num % factor)):
            num /= factor
            flist.append(factor)
            factor -= 1
        
        factor += 1    

    print isprime(factor, (len(flist) - 1))

def run():
    start = time.clock()
    factorise(num)    
    end = time.clock()
    print 'Code time %.8f seconds' % (end - start)
    

if __name__ == '__main__':
    run()