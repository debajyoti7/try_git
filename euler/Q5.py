import numpy as np
import time

limit = 20
start = 9699690

def findNum(b):
    num = start
    a = 4
    while (a < b):
        if(0 != (num % a)):
            if(0 == (a % 2)):
                num *= 2
                continue
            if(0 == (a % 3)):
                num *= 3
                continue
            if(0 == (a % 5)):
                num *= 5
                continue
            if(0 == (a % 7)):
                num *= 7
                continue
            if(0 == (a % 9)):
                num *= 9
                continue
            if(0 == (a % 11)):
                num *= 11
                continue
            if(0 == (a % 13)):
                num *= 13
                continue
            if(0 == (a % 17)):
                num *= 17
                continue
            if(0 == (a % 19)):
                num *= 19
                continue
                              
        a += 1
    print num

def run():
    start = time.clock()
    findNum(limit)
    end = time.clock()
    print 'Code time %.6f seconds' % (end - start)


if __name__ == "__main__":
    run()