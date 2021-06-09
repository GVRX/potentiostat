

'''
   Simple script to test ECL potentiostat

   Uses potentiostat class adapted from RodeoStat

   Status:  works for test = cyclic on unix variants.  Serial device  communication breaks after one test - to be investigated.

   Grant van Riessen, La Trobe University, 2021

'''

# %%

from potentiostat import Potentiostat, plotData
# %%

test_name = 'cyclic'   # name of test (only one currently implemented in firmware)

port = '/dev/tty.usbmodem65156601'     # Serial port for potentiostat device. This will need to be changed for different OS

testCounter = 0
dataFileName = test_name+'_%d.txt'       # Output file for data.  %d will be substitued by counter value

volt_min = -0.4             # The minimum voltage in the waveform (V)
volt_max =  0.4            # The maximum voltage in the waveform (V)
volt_per_sec = 0.5         # The rate at which to transition from volt_min to volt_max (V/s)
num_cycles = 1              # The number of cycle in the waveform

# Convert parameters to amplitude, offset, period, phase shift for triangle waveform
amplitude = abs(volt_max - volt_min)/2.0            # Waveform peak amplitude (V) 
offset = (volt_min-volt_max)/2.0               # Waveform offset (V) 
period_ms = int(1000*4*amplitude/volt_per_sec)   # Waveform period in (ms)
shift = 0.0                                      # Waveform phase shift - expressed as [0,1] number
                                                 # 0 = no phase shift, 0.5 = 180 deg phase shift, etc.
gain = 0.0
HV = 550 #extrasafe #400 # low enough to be safe with ambient lighting, just high enough to observe signal
measure = 'IV'  #measure current and photocurrent ( = IP, IV, or PV)

# Create dictionary of waveform parameters for cyclic voltammetry test
test_param = {
        'quietValue' : 0.0,          #ignored in current version
        'quietTime'  : 0,            #ignored in current version
        'amplitude'  : amplitude,
        'offset'     : offset,
        'period'     : period_ms,
        'numCycles'  : num_cycles,             #ignored in current version
        'shift'      : shift,
        'gain'       : gain,
        'HV'         : HV,
        'measure'    : measure
        }
# %%
# Create potentiostat object and set current range, sample rate and test parameters
dev = Potentiostat(port, 
                   raw=True,     # required for DE firmware 
                   debug=True   # optionally turn on debug flag, outputs lots of messages
                   )     

# %%
# Run cyclic voltammetry test, returns a dictionary containing time (t), current (i), voltage, (v), and photocurrent values. 
testCounter += 1
data = dev.run_test(test_name,   # name of test to run
                    test_param,  # dictionary of experimental parameters 
                    display = 'data',   # (data |  plot ), plot requires testing, pbar option not implemented
                    filename = dataFileName % testCounter)



# %%
# Plot combinations of values vontained in argument data.
plotData(data)




# %%
