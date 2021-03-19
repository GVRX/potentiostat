#!/usr/bin/env python

from eclometer.potentiostat import Potentiostat
import argparse 
import json
import os
import serial.tools.list_ports 
import serial 
from eclometer.interfaces.utilCLI import *


class runTest():
                  

    def __init__(self,options):
        self.opt = options
        
        if self.checkPort() == True: 
            self.dev = potentiostat.Potentiostat(self.opt['port'],
                                                raw=True,     # required for ECL firmware (version 0.x)
                                                debug=self.opt['debug'])
            self.counter = 0
            self.run()


    def checkPort(self):
        
        try:
            ser = serial.Serial(self.opt['port'])  # open serial port
        except:
            print('Problem connecting to serial port {}. Check if device is connected.'.format(self.opt['port']))
            
            a = serial.tools.list_ports.comports()
            ports=[]
            for w in a:
                ports.append((w.vid, w.device, w.serial_number))

            ports.sort(key=lambda ports: ports[1])

            print('\nDetected the following serial ports:')
            i = 0
            for w in ports:
                print('%d)\t%s\t(USB VID=%04X)\t Serial#:=%s' % (i, w[1], w[0] if (type(w[0]) is int) else 0, w[2]))
                i = i + 1
            total_ports = i  # now i= total ports

            return False
        else:
            ser.close()   # close port
            return True

    def run(self):

        # Convert parameters to amplitude, offset, period for triangle waveform
        amplitude = (self.opt['VMin'] - self.opt['VMax'])                # Waveform peak amplitude (V)
        offset = ((self.opt['VMin'] + self.opt['VMax']) )/2.0                 # Waveform offset (V) 
        period_ms = int(1000*4*amplitude/self.opt['rate'])   # Waveform period in (ms)
     
        # Create dictionary of waveform parameters for cyclic voltammetry test
        param = {
                'quietValue' : 0.0,          #ignored in current version
                'quietTime'  : 0,            #ignored in current version
                'amplitude'  : amplitude,
                'offset'     : offset,
                'period'     : period_ms,
                'numCycles'  : self.opt['numCycles'],             #ignored in current version
                'shift'      : self.opt['shift'],
                'gain'       : self.opt['gain'],
                'HV'         : self.opt['HV'],
                'measure'    : self.opt['measure'],
                'debug'      : self.opt['debug'],
                'smooth'     : 10,          
                }

        disp=None
        if self.opt['data'] is True: disp = 'data'
        if self.opt['live'] is True: disp = 'plot' 
        if self.opt['progress'] is True: disp = 'pbar'

        
        for i in range(0,self.opt['numRepeat']):
            print('i = {0}/{1}'.format(i+1,self.opt['numRepeat']))
            print()
            self.counter += 1
            self.data = self.dev.run_test(self.opt['testName'],      
                                param,  
                                display = disp,  
                                filename = self.opt['dataFileName'] % self.counter)           
            print()

            #print (self.opt)
            if self.opt['plot']:
                self.plot()


    def plot(self):
        # Plot combinations of values contained in argument data.
        potentiostat.plotData(self.data, smooth = self.opt['smooth'])



if __name__ == '__main__':
    cwd = os.path.abspath(os.path.dirname(__file__))

    # Load default values from configuration file  
    defaults =  jsonLoadFromFile(os.path.join(cwd,'defaults.json')) #'defaults.json')
    #print (defaults)
   
    parser = argparse.ArgumentParser(prog=os.path.basename(__file__), 
                                     description='Control the LTU ECLometer')
    
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

    parser.add_argument('-V', '--voltRange',
                      dest='voltRange', 
                      nargs=2,
                      metavar=('VMin', 'VMax'),
                      default=(defaults['VMin'], defaults['VMax']),
                      type=float,
                      choices=floatRange(-3.0, 3.0),
                      help='Lower and upper limits for the voltage',
                      )

    parser.add_argument('-r', '--rate',
                      dest='rate', 
                      type=float,
                      choices=floatRange(0.1,10),
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
                      choices=floatRange(0.0, 1.0),
                      help='Waveform phase shift [0,1]: 0 = no phase shift, 0.5 = 180 deg phase shift, etc.',
                      default=defaults['shift'])

    parser.add_argument('--HV',
                      dest='HV', 
                      type=IntRange(0, 1100),
                      help='PMT High Voltage',
                      default=defaults['HV'])

    parser.add_argument('-q', '--quiet',
                      dest='quiet', 
                      nargs=2,
                      metavar=('quietTime', 'quietValue'),
                      default=(defaults['quietTime'], defaults['quietValue']),
                      type=float,
                      help='Quiet time — NOT IMPLEMENTED YET',
                      )

    parser.add_argument('--smooth',
                      dest='smooth', 
                      type=IntRange(1), 
                      help='Specify number data points that are smoothed for display',
                      default=defaults['smooth'])

    parser.add_argument('-m', '--measure', 
                     dest='measure', 
                     choices=['IP', 'IV', 'PV'],
                     help='Specify what quantities are measured. Valid values are IP, IV, and PV', 
                     default=defaults['measure'])

    parser.add_argument('--plot', action='store_true', help='Plot data after test')
    
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--data', action='store_true', help='Write data to stdout')
    group.add_argument('--live', action='store_true', help='Live plot data (beta!)')
    group.add_argument('--progress', action='store_true', help='Display progress bar')
    
    parser.add_argument('--debug', action='store_true', help='Use debugging mode for ECL test.')


    args = parser.parse_args() 
    paramsDict = vars(args)
    paramsDict['VMin'] = paramsDict['voltRange'][0]
    paramsDict['VMax'] = paramsDict['voltRange'][1]
    #print (paramsDict)


    if args.paramFile is not None:
        print('Loading parameters from {}...'.format(args.paramFile), end='')
        paramFileDict =  jsonLoadFromFile(args.paramFile)
        
        # merge paramDict with dict containing individual args
        params = dict(list(paramFileDict.items()) + list(paramsDict.items()))
        print('done.')
    else:
        params = paramsDict
    


    print(params)
    runTest(params) 
    
