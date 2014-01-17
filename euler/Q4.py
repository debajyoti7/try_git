import time

palList = []

def ispal(num):
    if(str(num)==str(num)[::-1]):
        return 1
    else:
        return 0

def findPal():
    k = 123
    for a in range(999,100,-1):
        for b in range(999,100,-1):
            k = a*b
            if( ispal(k) ):
                palList.append(k)
    
    palList.sort()
    print palList[-1]

def run():
    start = time.clock()
    findPal()
    end = time.clock()
    print 'Code time %.6f seconds' % (end - start)


if __name__ == "__main__":
    run()
                