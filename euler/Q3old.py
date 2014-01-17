from collections import defaultdict
from math import sqrt

num = 60085147514300000000

def factor(n):
    i = 2
    limit = sqrt(n)    
    while i <= limit:
      if n % i == 0:
        yield i
        n = n / i
        limit = sqrt(n)   
      else:
        i += 1
    if n > 1:
        yield n

def pfac(num):
    d=defaultdict(int)
    for f in factor(num):
        d[f]+=1

    terms=[]
    for e in sorted(d.keys()):
        if d[e]>1:
            terms.append('{:,}^{}'.format(e,d[e]))
        else:
            terms.append('{:,}'.format(e))
    print ' * '.join(terms),'=','{:,}'.format(num)           

pfac(num)