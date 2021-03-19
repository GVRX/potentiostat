#!/usr/bin/env python

import argparse 
import json
import json_tricks
import os
from gooey import Gooey
#import runECL
from  utilCLI import floatRange, IntRange, jsonLoadFromFile

@Gooey(
       #target=runECL.runTest ,     # Explicitly set the subprocess executable arguments
       program_name='LTU ECLometer (Version 0.0.1)',       # Defaults to script name
       default_size=(800, 800),   # starting size of the GUI
       required_cols=1,           # number of columns in the "Required" section
       optional_cols=3,           # number of columns in the "Optional" section
       dump_build_config=False,   # Dump the JSON Gooey uses to configure itself
       load_build_config=None,    # Loads a JSON Gooey-generated configuration
       monospace_display=False)   # Uses a mono-spaced font in the output screen
def main():
    # Load default values from configuration file  
    defaults =  jsonLoadFromFile('defaults.json') #'defaults.json')
    #print (defaults)
   
    parser = argparse.ArgumentParser()#(prog=os.path.basename(__file__), 
                                      #description='Control the LTU ECLometer')
    
    parser.add_argument('-F', 
                        dest='paramFile',
                        help='Specify file containing parameters in commented JSON format. Additional arguments will override values in the file.'
                        )


    parser.add_argument('--version', action='version', version='eclometer.__version__')


    parser.add_argument('-p', '--port', 
                      dest='port', 
                      help='specify port used by potentiostaa, e.g /dev/ttyACM0',  
                      default=defaults['port'])
    
    parser.add_argument('-t', '--test', 
                      dest='testName', 
                      help='Specify test type',
                      default=defaults['testName'],
                      choices=['cyclic', 'linear', 'sin'])  # to extend later

    parser.add_argument('-n', '--numrep',
                      dest='numRepeat', 
                      type=IntRange(1), 
                      help='Specify number of repititions',
                      default=defaults['numRep'])
    
    parser.add_argument('-c', '--numCycles',
                      dest='numCycles', 
                      type=IntRange(1), 
                      help='Specify number of waveform cycles',
                      default=defaults['numCycles'])

    parser.add_argument('-f', '--file', 
                      dest='dataFileName', 
                      help='Path for output file. You can include %%d in the string and it will be substituted with the the number of the current repeat of the test.',
                      default=defaults['dataFileName'])

    # parser.add_argument('-V', '--voltRange',
    #                   dest='voltRange', 
    #                   nargs=2,
    #                   metavar=('VMin', 'VMax'),
    #                   default=(defaults['VMin'], defaults['VMax']),
    #                   type=float,
    #                   choices=floatRange(-3.0, 3.0),
    #                   help='Lower and upper limits for the voltage',
    #                   )

    parser.add_argument('-r', '--rate',
                      dest='rate', 
                      type=float,
                      #choices=floatRange(0.1,10),
                      help='Scan rate (V/s)',
                      default=defaults['rate'])

    parser.add_argument('-g', '--gain',
                      dest='gain', 
                      type=float,
                      choices=[0.0, 1.0, 2.0, 3.0],
                      help='I or V gain',
                      default=defaults['gain'])

    parser.add_argument('--s', '--shift',
                      dest='shift', 
                      type=float,
                      #choices=floatRange(0.0, 1.0),
                      help='Waveform phase shift [0,1]: 0 = no phase shift, 0.5 = 180 deg phase shift, etc.',
                      default=defaults['shift'])

    parser.add_argument('--HV',
                      dest='HV', 
                      #type=IntRange(0, 1100),
                      help='PMT High Voltage',
                      default=defaults['HV'])

    # parser.add_argument('-q', '--quiet',
    #                   dest='quiet', 
    #                   nargs=2,
    #                   metavar=('quietTime', 'quietValue'),
    #                   default=(defaults['quietTime'], defaults['quietValue']),
    #                   type=float,
    #                   help='Quiet time — NOT IMPLEMENTED YET',
    #                   )

    # parser.add_argument('--smooth',
    #                   dest='smooth', 
    #                   type=IntRange(1), 
    #                   help='Specify number data points that are smoothed for display',
    #                   default=defaults['smooth'])

    parser.add_argument('-m', '--measure', 
                     dest='measure', 
                     choices=['IP', 'IV', 'PV'],
                     help='Specify what quantities are measured. Valid values are IP, IV, and PV', 
                     default=defaults['measure'])

    # parser.add_argument('--plot', action='store_true', help='Plot data after test')
    
    # group = parser.add_mutually_exclusive_group()
    # group.add_argument('--data', action='store_true', help='Write data to stdout')
    # group.add_argument('--live', action='store_true', help='Live plot data (beta!)')
    # group.add_argument('--progress', action='store_true', help='Display progress bar')
    # group.add_argument('--debug', action='store_true', help='Use debugging mode for ECL test.')


    args = parser.parse_args() 
    paramsDict = vars(args)
    #paramsDict['VMin'] = paramsDict['voltRange'][0]
    #paramsDict['VMax'] = paramsDict['voltRange'][1]
    #print (paramsDict)


    if args.paramFile is not None:
        print('Loading parameters from {}...'.format(args.paramFile), end='')
        paramFileDict =  jsonLoadFromFile(args.paramFile)
        
        # merge paramDict with dict containing individual args
        params = dict(list(paramFileDict.items()) + list(paramsDict.items()))
        print('done.')
    else:
        params = paramsDict

    from runECL import runTest
    runTest(params)
     
    
if __name__ == '__main__':
    main()