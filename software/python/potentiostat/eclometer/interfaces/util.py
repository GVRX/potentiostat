'''

Utilities to support potentiostat interfaces


Grant van Riessen, 2021

'''

#import argparse
from gooey import Gooey, GooeyParser
import json_tricks
import string


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
            #return argparse.ArgumentTypeError(f"Must be an integer in the range [{self.imin}, {self.imax}]")
            return GooeyParser.ArgumentTypeError(f"Must be an integer in the range [{self.imin}, {self.imax}]")
        elif self.imin is not None:
            #return argparse.ArgumentTypeError(f"Must be an integer >= {self.imin}")
            return GooeyParser.ArgumentTypeError(f"Must be an integer >= {self.imin}")
        elif self.imax is not None:
            #return argparse.ArgumentTypeError(f"Must be an integer <= {self.imax}")
            return GoeeyParser.ArgumentTypeError(f"Must be an integer <= {self.imax}")
        else:
            #return argparse.ArgumentTypeError("Must be an integer")
            return GooeyParser.ArgumentTypeError("Must be an integer")


def jsonLoadFromFile(path):
    with open(path,'r') as f: 
        jsonDict = json_tricks.load(f, ignore_comments=True)
    return jsonDict


class PartialFormatter(string.Formatter):
    def __init__(self, missing='~', bad='!!'):
        self.missing=missing
        self.bad =bad

    def get_field(self, field_name, args, kwargs):
        # Handle a key not found
        try:
            val=super(PartialFormatter, self).get_field(field_name, args, kwargs)
            # Python 3, 'super().get_field(field_name, args, kwargs)' works
        except (KeyError, AttributeError):
            val=None,field_name 
        return val 

    def format_field(self, value, spec):
        # handle an invalid format
        if value==None: return self.missing
        try:
            return super(PartialFormatter, self).format_field(value, spec)
        except ValueError:
            if self.bad is not None: return self.bad 
            else: raise