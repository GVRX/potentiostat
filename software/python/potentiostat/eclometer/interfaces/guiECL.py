#!/usr/bin/env python

import argparse 
import json
import json_tricks
import os
from gooey import Gooey, GooeyParser
#import runECL
from  eclometer.interfaces.utilCLI import floatRange, IntRange, jsonLoadFromFile
import sys

#reopen Python's stdout in write mode with buffer size of 0 ( which forces it to constantly flush). 
# This let's Gooey read from program in realtime as it's generating output. 
#nonbuffered_stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)
#sys.stdout = nonbuffered_stdout

@Gooey(
       #target=runECL.runTest ,     # Explicitly set the subprocess executable arguments
       program_name='LTU ECLometer (Version 0.0.1)',       # Defaults to script name
       default_size=(700, 960),   # starting size of the GUI
       required_cols=2,           # number of columns in the "Required" section
       optional_cols=4,           # number of columns in the "Optional" section
       dump_build_config=False,   # Dump the JSON Gooey uses to configure itself
       load_build_config=None,    # Loads a JSON Gooey-generated configuration
       monospace_display=False,     # Uses a mono-spaced font in the output screen
       )  
def main():
    # Load default values from configuration file  
    defaults =  jsonLoadFromFile('defaults.json') #'defaults.json')
    #print (defaults)
   
    parser = GooeyParser()#argparse.ArgumentParser()#(prog=os.path.basename(__file__), 
                                      #description='Control the LTU ECLometer')
    
    parser.add_argument('-F', 
                       dest='paramFile',
                       #help='Specify file containing parameters in commented JSON format. Additional arguments will override values in the file.'
                       metavar='Parameter file (other options will override)',
                       gooey_options={'visible': False}   # to keep this for GUI would require updating other fields upon change of parmeter file
                       )


    parser.add_argument('--version', 
                         action='version', 
                         version='eclometer.__version__',
                         gooey_options={'visible': False})


    testGroup = parser.add_argument_group(
                            "Experiment"
                        )
    
    testGroup.add_argument('-t', '--test', 
                      dest='testName', 
                      #help='Specify test type',
                      metavar='Test Type',
                      default=defaults['testName'],
                      choices=['cyclic', 'linear', 'sin'])  # to extend later
    
    testGroup.add_argument('-m', '--measure', 
                        dest='measure', 
                        choices=['IP', 'IV', 'PV'],
                        #help='Specify what quantities are measured. Valid values are IP, IV, and PV', 
                        metavar = 'Measurement',
                        default=defaults['measure'])

    testGroup.add_argument('-n', '--numrep',
                      dest='numRepeat', 
                      type=IntRange(1), 
                      #help='Specify number of repititions',
                      metavar = 'Repeats',
                      default=defaults['numRep'])
    
    testGroup.add_argument('-c', '--numCycles',
                      dest='numCycles', 
                      type=IntRange(1), 
                      help='Specify number of waveform cycles',
                      default=defaults['numCycles'],
                      gooey_options={'visible': False})



    testGroup.add_argument('-V', '--voltRange',
                        dest='voltRange', 
                        nargs=2,
                        #metavar=('VMin', 'VMax'),
                        default=(defaults['VMin'], defaults['VMax']),
                        type=float,
                        #choices=floatRange(-3.0, 3.0),
                        help='Lower and upper limits for the voltage',
                        gooey_options={'visible': False}
                        )



    testGroup.add_argument('-r', '--rate',
                      dest='rate', 
                      type=float,
                      #choices=floatRange(0.1,10),
                      #help='Scan rate (V/s)',
                      metavar='Scan rate (V/s)',
                      default=defaults['rate'])



    testGroup.add_argument('--s', '--shift',
                      dest='shift', 
                      type=float,
                      #choices=floatRange(0.0, 1.0),
                      help='Waveform phase shift [0,1]: 0 = no phase shift, 0.5 = 180 deg phase shift, etc.',
                      default=defaults['shift'],
                      gooey_options={'visible': False}   # not currently used, so let's hide it.
                      )
    
    
    groupVolt = parser.add_argument_group(
                            "Voltage Range"
                        )

    groupVolt.add_argument('--voltmin',
                        metavar='Minimum',
                        dest='VMin', 
                        default=defaults['VMin'],
                        type=float,
                        #choices=floatRange(-3.0, 3.0),
                        #help='Lower limit for the voltage',
                      )

    groupVolt.add_argument('--voltmax',
                        metavar='Maximum',
                        dest='VMax', 
                        default=defaults['VMax'],
                        type=float,
                        #choices=floatRange(-3.0, 3.0),
                        #help='Upper limit for the voltage',
                      )

   
    groupDevice= parser.add_argument_group(
                            "ECLometer Device"
                        )

    groupDevice.add_argument('-p', '--port', 
                      dest='port', 
                      #help='specify port used by potentiostaa, e.g /dev/ttyACM0',  
                      metavar='Serial Port',
                      default=defaults['port'])

    groupDevice.add_argument('--HV',
                      dest='HV', 
                      #type=IntRange(0, 1100),
                      #help='PMT High Voltage',
                      metavar='PMT High Voltage',
                      default=defaults['HV'])


    groupDevice.add_argument('-g', '--gain',
                      dest='gain', 
                      type=float,
                      choices=[0.0, 1.0, 2.0, 3.0],
                      #help='I or V gain',
                      metavar='Gain',
                      default=defaults['gain'])

    # parser.add_argument('-q', '--quiet',
    #                   dest='quiet', 
    #                   nargs=2,
    #                   metavar=('quietTime', 'quietValue'),
    #                   default=(defaults['quietTime'], defaults['quietValue']),
    #                   type=float,
    #                   help='Quiet time — NOT IMPLEMENTED YET',
    #                   )

    groupOutput = parser.add_argument_group(
                            "Output"
                        )

    groupOutput.add_argument('-f', '--file', 
                      dest='dataFileName', 
                      metavar='Output file path',
                      #help='%%d in the string and it will be substituted with the the number of the current repeat of the test.',
                      default=defaults['dataFileName'],
                      gooey_options={
                                'full_width': True
                            }
                        )      

    groupOutput.add_argument('--plot', 
                        action='store_true', 
                        help='Plot data after test',
                        metavar='Plot')

    groupOutput.add_argument('--smooth',
                      dest='smooth', 
                      type=IntRange(1), 
                      #help='Specify number data points that are smoothed for display',
                      metavar='Smoothing width',
                      default=defaults['smooth'])

    groupOutput.add_argument('--data', 
                       action='store_true', 
                       help='Write data to stdout',
                       metavar='Raw')   
    
           
    
    group = parser.add_mutually_exclusive_group(gooey_options={'visible': False})
    #group.add_argument('--data', action='store_true', help='Write data to stdout',gooey_options={'visible': False})
    group.add_argument('--live', action='store_true', help='Live plot data (beta!)',gooey_options={'visible': False})
    group.add_argument('--progress', action='store_true', help='Display progress bar',gooey_options={'visible': False})
    
    groupOutput.add_argument('--debug', 
                        action='store_true', 
                        #help='Use debugging mode for ECL test.'
                        metavar = 'Debugging Mode',
                        gooey_options={'visible': False})


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