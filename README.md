# IO Rodeo Potentiostat Shield (Variant for ECL — under development)

![alt text]

Forked from https://github.com/iorodeo/potentiostat. 

Under development:
  - New version of firmware for modified hardware for electrocheminiluminescence (ECL). Details to be provided...
  - Modification of python software to work with ECL device firmware.
  - CLI and GUI apps to support testing and development of the ECL device


## Installation


## Examples


###### Serial Interface

The serial inteface is compatible with the IO Rodeostat serial interface on which the ECLometer is based.  The (beta)
version of the ECLometer firmware does not support encoding/docoding of JSON strings so a raw serial mode of communication was implemented.  Compatibility is generally preserved by encoding responses received from the device and decoding them before sending to the device. This mode is unlikely to be supported in future versions of the firmware or the serial interface.

Example usage:

Define dictionary containint test parameters
'''
test_param = {
        'amplitude'  : 2.0,  # V
        'offset'     : 0,    # waveform offset (V)
        'period'     : 10,   # sample period (m/s) — converted to scan rate (V/s) for ECL
        'shift'      : 0,    # waveform phase shift as fraction of wavelength
        'gain'       : 1.0,  # amplification gain for measured current
        'HV'         : 950,  # the voltage applied to the photon detector (PMT)
        'measure'    : 'IP'  # = (IV, IP, PV), where I=current, V=voltage, P=photocurrent
        }
'''

Create potentiostat object 
'''
dev = Potentiostat(port, 
                   raw=True,     # required for ECL firmware (version 0.x)
                   debug=False   # enable/disable debug mode
                   )     
'''

Run test :

'''
data = dev.run_test(test_name,   # name of test to run
                    test_param,  
                    display = 'data',      # specify what is displayed during test (data |  plot | pbar)
                    filename = 'data.txt'  # data output path
                    )
'''


'data' contains a dictionary containing time (t), current (i), voltage, (v), and photocurrent (p) values. 

'''
plots.plotData(data, smooth = 10)
'''


###### Utilities for testing

See examples/*.py

###### Command Line Interface (CLI)


###### Graphical User Interface (GUI)

###### Configuration Files for CLI and GUI Interfaces

Default Congiguration File:

Device and test default parameters are stored in defaults.ini and loaded when runECL or guiECL are run.

It is recommended that you change the port here to avoid specifing it each time you run the CLI or GUI.

A quasi-JSON format is used.  Comments (python style, starting with #) are allowed.

Test Configuration File:

Test configuration files may contain any subset of parameters that appear in defaults.ini.  This can be used to specify the
configuration of a commonly used test.

A quasi-JSON format is used.  Comments (python style, starting with #) are allowed.

## Contributors


- Grant van Riessen

- Darrell Elton

- Conor Hogan 

- Laena Dalton

- Eric Huwald

- Philip Pawlowski


## Acknowledgements

(todo)
