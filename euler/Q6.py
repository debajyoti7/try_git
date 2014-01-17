import time


limit = 100000


def findNum(n):
    return (n * (n+1) * ( (3 * n * n)- n - 2) / 12)

def run():
    start = time.clock()
    print findNum(limit)
    end = time.clock()
    print 'Code time %.6f seconds' % (end - start)


if __name__ == "__main__":
    run()
