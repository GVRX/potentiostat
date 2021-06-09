#!/usr/bin/env python

import argparse 
import json
import json_tricks
import os

try:
    import gooey
    #from gooey import Gooey, GooeyParser
except ImportError:
    gooey = None


#from  eclometer.interfaces.util import floatRange, IntRange, jsonLoadFromFile
import sys
import string
import serial.tools.list_ports 

gui_decorator = gooey.Gooey( #target=runECL.runTest,     # Explicitly set the subprocess executable arguments
                            program_name="LTU ECLometer (Version 0.0.2)", 
                            default_size=(1050, 680),   # starting size of the GUI
                            dump_build_config=False,   # Dump the JSON Gooey uses to configure itself
                            load_build_config=None,    # Loads a JSON Gooey-generated configuration
                            monospace_display=False,     # Uses a mono-spaced font in the output screen
                            tabbed_groups=True,
                            navigation='Tabbed',
                            # poll_external_updates=True   # seems to be buggy, at least on osx
                            use_cmd_args = True,         # Substitute any command line arguments provided at run time for the default values specified in the Gooey configuration
                            #suppress_gooey_flag=True,
                            )
    

def flex_add_argument(f):
    '''Make the add_argument accept (and ignore) the widget, metavar and gooey_options option.
       Based on suggestion by KrzysiekJ at https://github.com/chriskiehl/Gooey/issues/296#issuecomment-642115493
    '''
    def f_decorated(*args, **kwargs):
        kwargs.pop('widget', None)
        kwargs.pop('metavar', None)
        kwargs.pop('gooey_options', None)
        
        return f(*args, **kwargs)

    return f_decorated

def flex_add_argument_group(f):
    ''' Make the add_argument_group accept and ignore the gooey_options option '''
     
    def f_decorated(*args, **kwargs):
        kwargs.pop('gooey_options',None)
        return f(*args,**kwargs)  
     
    return f_decorated 

# Monkey-patching private classes …
argparse._ActionsContainer.add_argument = flex_add_argument(argparse.ArgumentParser.add_argument)
argparse._ActionsContainer.add_argument_group = flex_add_argument_group(argparse.ArgumentParser.add_argument_group)


class ECLTest():
                  
    def __init__(self,options=None, gui=False):

        self.gui = gui
        
        if options is not None:
            self.opt = options
        else:    
            if self.gui == True:
                self.parser = gui_decorator(self.parserBase)
            else:
                self.parser = self.parserBase
            self.opt = self.parser()

        if self.checkPort() == True: 
            # import here to avoid issues with Gooey? 
            from eclometer.potentiostat import Potentiostat
            self.dev = Potentiostat(self.opt['port'],
                                    raw=True,  # required for ECL firmware (version 0.x)
                                    debug=self.opt['debug'])
        self.counter = 0
        self.run()

        
    def checkPort(self):
        
        try:
            import serial.tools.list_ports 
            ser = serial.Serial(self.opt['port'])  # open serial port
        except:
            print('Problem connecting to serial port {}. Check if device is connected.'.format(self.opt['port']))
            
            ports = getPorts()
            print('\nDetected the following serial ports:')
            i = 0
            for w in ports:
                print('%d)\t%s\t(USB VID=%04X)\t Serial#:=%s' % (i, w[1], w[0] if (type(w[0]) is int) else 0, w[2]))
                i += 1
            
            return False
        else:
            ser.close()   # close port
            return True


    def run(self):

        if not self.dev:
           print('Device not initialised')
        else:
            # Create dictionary of waveform parameters for cyclic voltammetry test
            param = {
                    #'quietValue' : 0.0,          #ignored in current version
                    #'quietTime'  : 0,            #ignored in current version
                    #'amplitude'  : amplitude,
                    #'offset'     : offset,
                    'period'     : self.opt['period'],
                    'Cycles'  : self.opt['Cycles'],
                    #'shift'      : self.opt['shift'],
                    'gain'       : self.opt['gain'],
                    'HV'         : self.opt['HV'],
                    'measure'    : self.opt['measure'],
                    'debug'      : self.opt['debug'],
                    'smooth'     : 10, 
                    'E0'         : self.opt['E0'],
                    'E1'         : self.opt['E1'],
                    'E2'         : self.opt['E2'],
                    'T0'         : self.opt['T0'],
                    'T1'         : self.opt['T1'],
                    'T2'         : self.opt['T2']

                    }

            disp=None
            if self.opt['data'] is True: disp = 'data'
            if self.opt['live'] is True: disp = 'plot' 
            if self.opt['progress'] is True: disp = 'pbar'

            
            for i in range(0,self.opt['numRepeat']):
                print()
                print('Starting {0} test {1} of {2}'.format(self.opt['testName'],i+1,self.opt['numRepeat']))
                self.data = self.dev.run_test(self.opt['testName'],      
                                    param,  
                                    display = disp,  
                                    filename = self.opt['dataFileName'] % self.counter)           
                self.counter += 1
                print()
                print('Completed {0} test {1} of {2}'.format(self.opt['testName'],i+1,self.opt['numRepeat']))

                #print (self.opt)
                if self.opt['plot']:
                    self.plot()


    def plot(self):
        # Plot combinations of values contained in argument data.
        plotData(self.data, smooth = self.opt['smooth'])


 

#@gui_decorator
def parserBase():
    # Load default values from configuration file.  These are overridden by command-line arguments
    defaults =  jsonLoadFromFile('defaults.json') 

    parser = ArgumentParser(description='ECLometer')
    
    testGroup = parser.add_argument_group("Experiment",
                                        gooey_options={'columns': 2}
                                        )
    
    testGroup.add_argument('-F', 
                    dest='paramFile',
                    #help='Specify file containing parameters in commented JSON format. Additional arguments will override values in the file.'
                    metavar='Parameter file (other options will override)',
                    gooey_options={'visible': False},   # to keep this for GUI would require updating other fields upon change of parmeter file
                    action='store_true',
                    )

    optionsE = {'min': -3.0, 
                'max':  3.0, 
                'increment' : 0.1 
                }

    optionsT = {'min': 0, 
                'increment' : 0.1
                }

    ETGroup = testGroup.add_argument_group(
                                        gooey_options={
                                        'show_border': True,
                                        'show_underline': False,
                                        'label_color': '#FF9900',
                                        'columns': 1,
                                        #'margin_top': 1.
                                        }
                                        ) 

    prescanGroup = ETGroup.add_argument_group('Prescan',
                                            gooey_options={
                                            'show_border': True,
                                            'show_underline': False,
                                            'label_color': '#FF9900',
                                            'columns': 1,
                                            'margin_top': 1}
                                            ) 

    prescanGroup.add_argument('--E0',
                            dest='E0', 
                            type=floatRange(optionsE['min'],optionsE['max']),
                            widget='DecimalField', 
                            gooey_options=optionsE,
                            help='Prescan potential (V)',
                            default=defaults['E0']
                            )

    prescanGroup.add_argument('--T0',
                            dest='T0', 
                            type=floatRange(optionsT['min']),
                            widget='DecimalField', 
                            gooey_options=optionsT,
                            help='Prescan time (s)',
                            default=defaults['T0'],
                            )
    
    stepAGroup = ETGroup.add_argument_group('Cycle Start',
                                            gooey_options={
                                            'show_border': True,
                                            'show_underline': False,
                                            'label_color': '#FF9900',
                                            'columns': 1,
                                            'margin_top': 1}
                                            ) 

    stepAGroup.add_argument('--E1',
                            dest='E1', 
                            type=floatRange(optionsE['min'],optionsE['max']),
                            widget='DecimalField', 
                            gooey_options=optionsE,
                            help='Start potential (V)',
                            default=defaults['E1']
                        )

    stepAGroup.add_argument('--T1',
                            dest='T1', 
                            type=floatRange(optionsT['min']),
                            widget='DecimalField', 
                            gooey_options=optionsT,
                            help='E0 to E1 time (s)',
                            default=defaults['T1'],
                        )                 

    stepBGroup = ETGroup.add_argument_group('Cycle End',
                                            gooey_options={
                                            'show_border': True,
                                            'show_underline': False,
                                            'label_color': '#FF9900',
                                            'columns': 1,
                                            'margin_top': 1}
                                            ) 

    stepBGroup.add_argument('--E2',
                            dest='E2', 
                            type=floatRange(optionsE['min'],optionsE['max']),
                            widget='DecimalField', 
                            gooey_options=optionsE,
                            help='End potential (V)',
                            default=defaults['E2'],     
                        )  
    
    stepBGroup.add_argument('--T2',
                            dest='T2', 
                            type=floatRange(optionsT['min']),
                            widget='DecimalField', 
                            gooey_options=optionsT,
                            help='E1 to E2 time (s)',
                            default=defaults['T2'],
                        )
    
    testSubGroup = testGroup.add_argument_group(#"Options",
                                                gooey_options={
                                                    'columns': 2}
                                            )         

    testSubGroup.add_argument('-t', '--test', 
                            dest='testName', 
                            help='Choose the test that will be performed',
                            metavar='Test Type',
                            default=defaults['testName'],
                            choices=['cyclic', 'chrono', 'debug']
                            )  
    
    testSubGroup.add_argument('-m', '--measure', 
                            dest='measure', 
                            choices=['IP', 'IV', 'PV'],
                            help='Measurement combinations (I: current, V: voltage, P: photocurrent)', 
                            metavar = 'Measurement',
                            default=defaults['measure'])

    testSubGroup.add_argument('-n', '--numrep',
                            dest='numRepeat', 
                            type=IntRange(1), 
                            help='Number of test repeats',
                            metavar='Repeat',
                            default=defaults['numRep'],
                            gooey_options={'visible': True}
                            )
    
    testSubGroup.add_argument('-c', '--numCycles',
                            dest='Cycles', 
                            type=IntRange(1), 
                            help='Repeats cycle [E1(T1)-E2(T2)]',
                            default=defaults['Cycles'],
                            gooey_options={'visible': True}
                            )

    testSubGroup.add_argument('-r', '--rate',
                            dest='rate', 
                            type=floatRange(0.0),
                            #choices=floatRange(0.1,10),
                            #help='Scan rate (V/s)',
                            metavar='Scan rate (V/s)',
                            default=defaults['rate'])          

    groupDevice= parser.add_argument_group("Device")

    groupDevice.add_argument('-p', '--port', 
                            dest='port', 
                            help='Connect device and restart if device not listed',  
                            metavar='Serial Port',
                            choices = getPorts(),
                            #default=defaults['port']
                            )

    groupDevice.add_argument('--HV', 
                            dest = 'HV',
                            widget='IntegerField', 
                            help='High Voltage (V)',
                            type=IntRange(0,1150),
                            gooey_options={
                                'min': 0, 
                                'max': 1150, 
                                'increment' : 50,
                                #'show_help': False   
                            },
                            metavar='PMT',
                            default=defaults['HV']
                            )

    groupDevice.add_argument('-g', '--gain',
                            dest='gain', 
                            type=float,
                            choices=[0.0, 1.0, 2.0, 3.0],
                            help='Amplification gain for measurement of I and V',
                            metavar='Gain',
                            default=defaults['gain']
                            )

    groupDevice.add_argument('--samplePeriod',
                            dest='period', 
                            metavar='Sampling',
                            type=floatRange(500.e-6,10.e-3),
                            widget='DecimalField', 
                            gooey_options={
                                        'min': 500.e-6, 
                                        'max': 10.e-3, 
                                        'increment' : 100.e-6 
                                    }, 
                            help='Sampling Period (s)',
                            default=defaults['period']
                            )

    groupOutput = parser.add_argument_group( "Output",
                                            gooey_options={'columns': 2})

    fileGroup = groupOutput.add_argument_group('File',
                                            gooey_options={
                                            'show_border': True,
                                            'label_color': '#FF9900',
                                            'columns': 1,
                                            #'margin_top': 1
                                            }
                                            ) 
    
    #cwd = os.path.abspath(os.path.dirname(__file__))  
    fileGroup.add_argument('-f', '--file', 
                            dest='dataFileName', 
                            metavar='Output File',
                            help='Wildcard % increments with each repeat',
                            widget='FileChooser',
                            gooey_options={
                                'wildcard':
                                    "Comma separated file (*.csv)|(*.CSV)"
                                    "All files (*.*)|*.*",
                                #'default_dir': "",
                                'default_file': "ecl_%d.txt",
                                'message': "Choose file for data to be saved to.",
                                'full_width': False
                            },
                            default=defaults['dataFileName']
                            )

    plotGroup = groupOutput.add_argument_group('Plot',
                                            gooey_options={
                                            'show_border': True,
                                            'label_color': '#FF9900',
                                            'columns': 1,
                                            #'margin_top': 1
                                            }
                                            ) 

    plotGroup.add_argument('--plot', 
                            action='store_true', 
                            help='Plot data after test',
                            metavar='Plot',
                            )

    plotGroup.add_argument('--smooth',
                            dest='smooth', 
                            type=IntRange(1), 
                            help='Plot data smoothed if value > 1',
                            metavar='Smoothing width',
                            default=defaults['smooth']
                            )
    
    #groupDisplay = parser.add_mutually_exclusive_group('Display'
                                                    #gooey_options={'visible': False}
    groupDisplay = groupOutput.add_argument_group('Display',
                                                gooey_options={
                                                'show_border': True,
                                                'label_color': '#FF9900',
                                                'columns': 3,
                                                #'margin_top': 1
                                                })
    groupDisplay.add_argument('--live', 
                            action='store_true', 
                            help='Live plot data (beta!)',
                            metavar = 'Live plot data during test.',
                            gooey_options={'visible': True})
    
    groupDisplay.add_argument('--progress', 
                            action='store_true', 
                            help='Display progress bar',
                            gooey_options={'visible': False})

    groupDisplay.add_argument('--data', 
                            action='store_true', 
                            help='Display data during acquisition',
                            metavar='Raw')   
    
    groupDisplay.add_argument('--debug', 
                            action='store_true', 
                            help='Output debugging information',
                            metavar = 'Debug',
                            gooey_options={'visible': True}
    )

    groupOutput.add_argument('--ref',
                            action='store_true',
                            gooey_options={'visible': False},
                            help = 'reserved for future use'

                        )

    args = parser.parse_args() 
    paramsDict = vars(args)

    if args.paramFile:
        print('Loading parameters from {}...'.format(args.paramFile), end='')
        paramFileDict =  jsonLoadFromFile(args.paramFile)
        
        # merge paramDict with dict containing individual args
        params = dict(list(paramFileDict.items()) + list(paramsDict.items()))
        print('done.')
    else:
        params = paramsDict

    #try:
    ecl=ECLTest(options=params)
    print('Device initialised...')
    #except:
    #   print('Device initialisation failed.')
    #else:
    ecl.run()


def getPorts():
    '''
    return a list of serial ports
    '''
    ports=[]
    for w in serial.tools.list_ports.comports():
        ports.append((w.vid, w.device, w.serial_number))

    #ports.sort(key=lambda ports: ports[1])
    portNames = [p[1] for p in ports]
    
    return portNames


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


class floatRange:
    ''' Custom argparse type representing a bounded float
    Usage examples:
        parser.add_argument('foo', type=floatRange(1.0))     # Must have foo >= 1.0
        parser.add_argument('bar', type=floatRange(1.0, 7.0))  # Must have 1.0 <= bar <= 7.0
    '''
    def __init__(self, imin=None, imax=None):
        self.imin = imin
        self.imax = imax

    def __call__(self, arg):
        try:
            value = float(arg)
        except ValueError:
            raise self.exception()
        if (self.imin is not None and value < self.imin) or (self.imax is not None and value > self.imax):
            raise self.exception()
        return value

    def exception(self):
        if self.imin is not None and self.imax is not None:
            #return argparse.ArgumentTypeError(f"Must be an integer in the range [{self.imin}, {self.imax}]")
            return GooeyParser.ArgumentTypeError(f"Must be a number in the range [{self.imin}, {self.imax}]")
        elif self.imin is not None:
            #return argparse.ArgumentTypeError(f"Must be an integer >= {self.imin}")
            return GooeyParser.ArgumentTypeError(f"Must be a number in the range >= {self.imin}")
        elif self.imax is not None:
            #return argparse.ArgumentTypeError(f"Must be an integer <= {self.imax}")
            return GoeeyParser.ArgumentTypeError(f"Must be a number in the range <= {self.imax}")
        else:
            #return argparse.ArgumentTypeError("Must be an integer")
            return GooeyParser.ArgumentTypeError("Must be an floating-point number")


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
    


if __name__ == '__main__':

    if 'ports' in sys.argv:
                [print(p) for p in getPorts()]
    else:
        if gooey is None or 'nogui' in sys.argv:  # do not run GUI if not available or 'nogui' flag used
            ArgumentParser = argparse.ArgumentParser
            parser = parserBase
            parser()

        else:
            ArgumentParser = gooey.GooeyParser
            parser = parserBase
            parser = gui_decorator(parserBase)
            parser()



