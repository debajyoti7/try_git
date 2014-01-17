import time

palList = []

def ispal(num):
    if(str(num)==str(num)[::-1]):
        return 1
    else:
        return 0

def findPal():
    n = 0
    a = 999
    b = 999
    while (a > 100):
        b = 990
        while(b > 100):
            k = a * b
            if ( k > n):
                if(ispal(k)):
                    n = k
                    palList.append(k)
            b -= 11
        a -= 1
    print n
            
def run():
    start = time.clock()
    findPal()
    end = time.clock()
    print 'Code time %.6f seconds' % (end - start)


if __name__ == "__main__":
    run()
                