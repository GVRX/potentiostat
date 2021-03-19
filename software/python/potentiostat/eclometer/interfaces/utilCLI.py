'''

Utilities to support CLI 


'''



import argparse
import json_tricks



class floatRange(object):
    '''
    Custom class to check if float is within a  specified range.  This can be used as 
    the choices parameter for arg.parse add_argument
    Usage examples:
        parser.add_argument('--foo', type=float, choices=floatRange(0.0, 1.0))
        parser.add_argument('--bar', type=float, choices=[floatRange(0.0, 1.0), floatRange(2.0,3.0)])

    '''
    def __init__(self, start, end):
        self.start = start
        self.end = end

    def __eq__(self, other):
        return self.start <= other <= self.end

    def __contains__(self, item):
        return self.__eq__(item)

    def __iter__(self):
        yield self

    def __str__(self):
        return '[{0},{1}]'.format(self.start, self.end)

class IntRange:
    ''' Custom argparse type representing a bounded int
    Usage examples:
        parser.add_argument('foo', type=IntRange(1))     # Must have foo >= 1
        parser.add_argument('bar', type=IntRange(1, 7))  # Must have 1 <= bar <= 7
    '''
    def __init__(self, imin=None, imax=None):
        self.imin = imin
        self.imax = imax

    def __call__(self, arg):
        try:
            value = int(arg)
        except ValueError:
            raise self.exception()
        if (self.imin is not None and value < self.imin) or (self.imax is not None and value > self.imax):
            raise self.exception()
        return value

    def exception(self):
        if self.imin is not None and self.imax is not None:
            return argparse.ArgumentTypeError(f"Must be an integer in the range [{self.imin}, {self.imax}]")
        elif self.imin is not None:
            return argparse.ArgumentTypeError(f"Must be an integer >= {self.imin}")
        elif self.imax is not None:
            return argparse.ArgumentTypeError(f"Must be an integer <= {self.imax}")
        else:
            return argparse.ArgumentTypeError("Must be an integer")

def jsonLoadFromFile(path):
    with open(path,'r') as f: 
        jsonDict = json_tricks.load(f, ignore_comments=True)
    return jsonDict
