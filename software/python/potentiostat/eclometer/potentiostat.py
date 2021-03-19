"""
============
potentiostat
============

    This module implements the serial interface to the Rodeostat open source 
    Potentiostat Shield.

    Extended (GVR) to implement serial interface to the LTU ECLometer.  
    Note: ECLometer device is under development. Serial communication protocol 
    documentation is available at (?).  Current firmware uses plain text (no JSON), 
    requiring some packaging/unpackaging of messages and responses to maintain compatibilty
    with original implementation. Handled by a 'raw mode' of communication.

    ** Code is under development **

    :copyright: (c) 2017 by IO Rodeo 
    :license: MIT, see LICENSE.txt for more details.


    Modified by Grant van Riessen, 2021
"""
from __future__ import print_function
import serial
import time
import json
import atexit
import contextlib
import progressbar
import os
import re
from .plots import *
from drawnow import drawnow, figure


try:
    import cPickle as pickle
except ImportError:
    import pickle


# Json message keys
CommandKey = 'command'
ResponseKey = 'response'
MessageKey = 'message'
SuccessKey = 'success'
TestKey = 'test'
ParamKey = 'param'
TimeKey = 't'
VoltKey = 'v'
CurrKey = 'i'
PhotoCurrKey = 'l' # added GVR
CellKey = 'cell' # added GVR
FeedbackKey = 'feedback' # added GVR
MeasureKey = 'measure' # added GVR
SamplesKey = 'samples' # added GVR
GainKey = 'gain' # added GVR
HVKey = 'HV' # added GVR
HVEnableKey = 'HVEnable' # GVR
VStartKey = "Vstart" # GVR
VEndKey = 'Vend' # GVR
ScanRateKey = 'scanrate' #GVR
StopTestKey = 'stop'


ChanKey = 'n'
RefVoltKey = 'r'
VoltRangeKey = 'voltRange'
CurrRangeKey = 'currRange'
DeviceIdKey = 'deviceId'
SamplePeriodKey = 'samplePeriod'
TestDoneTimeKey = 'testDoneTime'
StepArrayKey = 'step'
TestNameArrayKey = 'testNames'
VersionKey = 'version'
VariantKey = 'variant'
MuxEnabledKey = 'muxEnabled'
MuxChannelKey = 'muxChannel'
ConnectedKey = 'connected'

# Commands
RunTestCmd  = 'runTest'
StopTestCmd = 'stopTest'
GetVoltCmd = 'getVolt'
SetVoltCmd = 'setVolt'
GetCurrCmd = 'getCurr'
GetPhotoCurrCmd = 'getPhotoCurr' # added GVR
GetCellCmd = 'getCell'  #addedGVR
SetCellCmd = 'setCell'  #added GVR
GetFeedbackCmd = 'getFeedback' # GVR
SetFeedbackCmd = 'setFeedback' # GVR
SetMeasureCmd = 'setMeasure' # GVR
SetSamplesCmd  = 'setSamples' # GVR
SetGainCmd = 'setGain' #GVR
GetGainCmd = 'getGain' #GVR 
SetHVCmd = 'setHV' #GVR
GetHVCmd = 'getHV' #GVR
SetHVEnableCmd = 'setHVenable' # GVR
GetHVEnableCmd = 'getHVenable' # GVR
SetVStartCmd = 'setVstart' # GVR
GetVStartCmd = 'getVstart' # GVR
SetVEndCmd = 'setVend' # GVR
GetVEndCmd = 'getVend' # GVR
SetScanRateCmd = 'setScanrate' # GVR
GetScanRateCmd = 'getScanrate' # GVR


GetRefVoltCmd = 'getRefVolt'
GetParamCmd = 'getParam'
SetParamCmd = 'setParam'
GetVoltRangeCmd = 'getVoltRange'
SetVoltRangeCmd = 'setVoltRange'
GetCurrRangeCmd = 'getCurrRange'
SetCurrRangeCmd = 'setCurrRange'
GetDeviceIdCmd = 'getDeviceId'
SetDeviceIdCmd = 'setDeviceId'
GetSamplePeriodCmd = 'getSamplePeriod'
SetSamplePeriodCmd = 'setSamplePeriod'
GetTestDoneTimeCmd = 'getTestDoneTime'
GetTestNamesCmd = 'getTestNames'
GetVersionCmd = 'getVersion'
GetVariantCmd = 'getVariant'
SetMuxEnabledCmd = 'setMuxEnabled'
GetMuxEnabledCmd = 'getMuxEnabled'
SetEnabledMuxChanCmd = 'setEnabledMuxChannels'
GetEnabledMuxChanCmd = 'getEnabledMuxChannels'
GetMuxTestNamesCmd = 'getMuxTestNames'

SetMuxRefElectConnCmd = "setMuxRefElectConnected"
GetMuxRefElectConnCmd = "getMuxRefElectConnected"
SetMuxCtrElectConnCmd = "setMuxCtrElectConnected"
GetMuxCtrElectConnCmd = "getMuxCtrElectConnected"
SetMuxWrkElectConnCmd = "setMuxWrkElectConnected"
GetMuxWrkElectConnCmd = "getMuxWrkElectConnected"
DisconnAllMuxElectCmd = "disconnectAllMuxElect"

# Voltage ranges
VoltRange1V = '1V'
VoltRange2V = '2V'
VoltRange4V = '4V'
VoltRange5V = '5V'
VoltRange8V = '8V'
VoltRange10V = '10V'
VoltRangeList_AD8250 = [VoltRange1V, VoltRange2V, VoltRange5V, VoltRange10V]
VoltRangeList_AD8251 = [VoltRange1V, VoltRange2V, VoltRange4V, VoltRange8V]

HwVariantToVoltRangesDict = {
        'nanoAmpV0.1'         : VoltRangeList_AD8250, 
        'microAmpV0.1'        : VoltRangeList_AD8250, 
        'milliAmpV0.1'        : VoltRangeList_AD8250, 
        'AD8250_nanoAmpV0.1'  : VoltRangeList_AD8250, 
        'AD8250_microAmpV0.1' : VoltRangeList_AD8250, 
        'AD8250_milliAmpV0.1' : VoltRangeList_AD8250, 
        'AD8251_nanoAmpV0.1'  : VoltRangeList_AD8251,  
        'AD8251_microAmpV0.1' : VoltRangeList_AD8251, 
        'AD8251_milliAmpV0.1' : VoltRangeList_AD8251, 
        }

# Current Ranges
CurrRange60nA = '60nA'
CurrRange100nA = '100nA'
CurrRange1uA = '1uA'
CurrRange10uA = '10uA'
CurrRange100uA = '100uA'
CurrRange1000uA = '1000uA'
CurrRange12000uA = '12000uA'
CurrRange24000uA = '24000uA'

CurrRangeListNanoAmp = [CurrRange1uA, CurrRange10uA, CurrRange100nA, CurrRange60nA]
CurrRangeListMicroAmp = [CurrRange1uA, CurrRange10uA, CurrRange100uA, CurrRange1000uA]
CurrRangeListMilliAmp = [CurrRange100uA, CurrRange1000uA, CurrRange12000uA, CurrRange24000uA]

HwVariantToCurrRangesDict = {
        'nanoAmpV0.1'         :  CurrRangeListNanoAmp,
        'microAmpV0.1'        :  CurrRangeListMicroAmp, 
        'milliAmpV0.1'        :  CurrRangeListMilliAmp,
        'AD8250_nanoAmpV0.1'  :  CurrRangeListNanoAmp,
        'AD8250_microAmpV0.1' :  CurrRangeListMicroAmp, 
        'AD8250_milliAmpV0.1' :  CurrRangeListMilliAmp,
        'AD8251_nanoAmpV0.1'  :  CurrRangeListNanoAmp,
        'AD8251_microAmpV0.1' :  CurrRangeListMicroAmp, 
        'AD8251_milliAmpV0.1' :  CurrRangeListMilliAmp,
        }

TimeUnitToScale = {'s': 1.e-3, 'ms': 1}

MinimumFirmwareVersionForMux = '0.0.5'

TxtOutputFileType = 0
PklOutputFileType = 1



#added GVR, for raw mode testing...
cmdMap = {
          GetVariantCmd:VariantKey,
          GetVersionCmd:VersionKey,
          SetVoltRangeCmd:VoltRangeKey,
          SetCurrRangeCmd:CurrRangeKey,
          SetVoltCmd: VoltKey,
          GetVoltCmd: VoltKey,
          GetCurrCmd: CurrKey,
          GetPhotoCurrCmd: PhotoCurrKey,
          GetCellCmd : CellKey,
          SetCellCmd : CellKey,
          GetFeedbackCmd : FeedbackKey,
          SetFeedbackCmd : FeedbackKey,
          SetMeasureCmd : MeasureKey,
          SetSamplesCmd : SamplesKey,
          SetGainCmd : GainKey,
          GetGainCmd : GainKey,
          SetHVCmd : HVKey,
          GetHVCmd : HVKey,
          SetHVEnableCmd : HVEnableKey,
          GetHVEnableCmd : HVEnableKey,
          GetVStartCmd : VStartKey,
          SetVStartCmd : VStartKey,
          GetVEndCmd : VEndKey,
          SetVEndCmd : VEndKey,
          GetScanRateCmd : ScanRateKey,
          SetScanRateCmd : ScanRateKey,
          StopTestCmd : StopTestKey,
          RunTestCmd : TestKey
         }




class Potentiostat(serial.Serial):

    """Provides a high level interface  performing serial communications with the Rodeostat. 

    :param str port: serial port associated with the Rodeostat, e.g. /dev/ttyACM0, COM1, etc.

    :Keyword Arguments:


    """

    ResetSleepDt = 0.0
    Baudrate = 115200

    #def __init__(self, port, timeout=4.0, debug=False):
    def __init__(self, port, timeout=4.0, raw = True, debug=False):
    
        """ Constructor
        """
        params = {'baudrate': self.Baudrate, 'timeout': timeout}

         # GVR added for testing
        self.RawMode = raw
        self.test_running = False

        self.measure = [TimeKey, CurrKey, VoltKey] # do we want a default? (or None?)   [gvr]
        self.debug = debug
         
        # try:
        #     super(Potentiostat,self).__init__(port,**params)
        # except SerialException as e:
        #     print('Serial port {} not found. Available serial ports:\n'.format(e.args))
        super(Potentiostat,self).__init__(port,**params)    
        
        time.sleep(self.ResetSleepDt)
        atexit.register(self.atexit_cleanup)
        
        while self.inWaiting() > 0:
            val = self.read()
            print(f"val= "+val)
        self.hw_variant = self.get_hardware_variant()
        self.firmware_version = self.get_firmware_version()

        print(self.hw_variant)
        print(self.firmware_version)
 

    def get_hardware_variant(self):
        """Returns a string representing the hardware variant.
        
        """
        cmd_dict = {CommandKey: GetVariantCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][VariantKey]


    def stop_test(self):
        """Stops (any) currently running tests.

        """
        cmd_dict = {CommandKey: StopTestCmd}
        msg_dict = self.send_cmd(cmd_dict)


    def get_volt(self):
        """Returns the output voltage setting, i.e, the potential between the working and reference electrode. 

        """
        cmd_dict = {CommandKey: GetVoltCmd}
        msg_dict = self.send_cmd(cmd_dict)
        volt = msg_dict[ResponseKey][VoltKey]
        return volt


    def set_volt(self,volt):
        """Sets the output voltage setting, i.e., the potential between the working and reference electrode. 

        """
        cmd_dict = {CommandKey: SetVoltCmd, VoltKey: volt}
        msg_dict = self.send_cmd(cmd_dict)
        volt = msg_dict[ResponseKey][VoltKey]
        return volt


    def get_curr(self):
        """Returns and immediate measurement of electrical current flowing in/out of the working electrode. 

        """
        cmd_dict = {CommandKey: GetCurrCmd}
        msg_dict = self.send_cmd(cmd_dict)
        curr = msg_dict[ResponseKey][CurrKey]
        return curr

    #GVR added
    def get_photo_curr(self):
        """Returns measurement of photocurrent """
        cmd_dict = {CommandKey: GetPhotoCurrCmd}
        msg_dict = self.send_cmd(cmd_dict)
        photocurr = msg_dict[ResponseKey][PhotoCurrKey]
        return photocurr

    #GVR added
    def get_cell(self):
        """Returns status of cell (off | on) """
        cmd_dict = {CommandKey: GetCellCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][CellKey]
        return rsp

    #GVR added
    def set_cell(self, s):
        """Set status of cell (on | off) """
        cmd_dict = {CommandKey: SetCellCmd, CellKey: s}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][CellKey]
        return rsp
    
    #GVR added
    def get_feedback(self):
        """Returns feedback setting (Current | Voltage) """
        cmd_dict = {CommandKey: GetFeedbackCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][FeedbackKey]
        return rsp

    #GVR added
    def set_feedback(self, s):
        """Set feedback setting (s = Current | Voltage) """
        cmd_dict = {CommandKey: SetFeedbackCmd, FeedbackKey: s}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][FeedbackKey]
        return rsp

    #GVR added
    def set_measure(self, m):
        """Set what is measured (m = IP | IV | PV) """
        cmd_dict = {CommandKey: SetMeasureCmd, MeasureKey: m}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][MeasureKey]
        
        #need to know what is being measured during a test, without polling device. Need to remember this state.
        if m == 'IP':
            self.measure = [TimeKey,CurrKey,PhotoCurrKey]
        if m == 'IV':
            self.measure = [TimeKey,CurrKey, VoltKey]
        if m == 'PV':
            self.measure = [TimeKey,PhotoCurrKey,VoltKey]    

        return rsp
    
    #GVR added
    def set_samples(self, n):
        """Set number of samples to measure """
        cmd_dict = {CommandKey: SetSamplesCmd, SamplesKey: n}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][SamplesKey]
        return rsp

    #GVR added
    def set_gain(self, g):
        """Set gain  (g = 0,1,2; corresponding to a gain value set in firmware that is expected to be returned) """
        cmd_dict = {CommandKey: SetGainCmd, GainKey: g}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][GainKey]
        return rsp

    #GVR added
    def get_gain(self):
        """Get gain value  """
        cmd_dict = {CommandKey: GetGainCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][GainKey]
        return rsp

    #GVR added
    def set_HV(self, HV):
        """Set HV (target, does not enable HV) """
        cmd_dict = {CommandKey: SetHVCmd, HVKey: HV}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][HVKey]
        return rsp

    #GVR added
    def get_HV(self):
        """Get HV value  """
        cmd_dict = {CommandKey: GetHVCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][HVKey]
        return rsp

    #GVR added
    def set_HVEnable(self, en):
        """Enable/Disable HV (en = 'On' | 'Off') """
        cmd_dict = {CommandKey: SetHVEnableCmd, HVEnableKey: en}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][HVEnableKey]
        return rsp

    #GVR added
    def get_HVEnable(self):
        """Get HV value  """
        cmd_dict = {CommandKey: GetHVEnableCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][HVEnableKey]
        return rsp

    #GVR added
    def set_VStart(self, V):
        """Set start voltage """
        cmd_dict = {CommandKey: SetVStartCmd, VStartKey: V}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][VStartKey]
        return rsp

    #GVR added
    def get_VStart(self):
        """Get start voltage  """
        cmd_dict = {CommandKey: GetVStartCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][VStartKey]
        return rsp

    #GVR added
    def get_VEnd(self):
        """Get end voltage  """
        cmd_dict = {CommandKey: GetVEndCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][VEndKey]
        return rsp

    #GVR added
    def set_VEnd(self, V):
        """Set end voltage """
        cmd_dict = {CommandKey: SetVEndCmd, VEndKey: V}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][VEndKey]
        return rsp

    #GVR added
    def get_ScanRate(self):
        """Get scan rate  """
        cmd_dict = {CommandKey: GetScanRateCmd}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][ScanRateKey]
        return rsp

    #GVR added
    def set_ScanRate(self, r):
        """Set scan rate """
        cmd_dict = {CommandKey: SetScanRateCmd, ScanRateKey: r}
        msg_dict = self.send_cmd(cmd_dict)
        rsp = msg_dict[ResponseKey][ScanRateKey]
        return rsp

    def get_ref_volt(self):
        """Returns the measurement of the potential between the working and reference electrode. 

        """
        cmd_dict = {CommandKey: GetRefVoltCmd}
        msg_dict = self.send_cmd(cmd_dict)
        volt = msg_dict[ResponseKey][RefVoltKey]
        return volt

    def get_param(self,testname):
        """Returns the current values of the parameters for the specified voltammetric test. 

        """
        cmd_dict = {CommandKey: GetParamCmd, TestKey: testname} 
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ParamKey]

    '''
    def set_param(self,testname,param):
        """Sets the parameters for the specified voltammetric test.

        """
        cmd_dict = {CommandKey: SetParamCmd, TestKey: testname, ParamKey: param}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ParamKey]
    '''
    def set_param(self, testname, param):
        """ Sets parameters for the specified test, with modifications to handle DE firmware V0.1
            Compatibility with original functionality is preserved RawMode is True  """

        if self.RawMode and testname == 'cyclic':
            
                # param['quietValue']    #ignore for now
                # param['quietTime']        #ignore for now
                # param['shift']    #ignore for now
                # param['numCycles']    #ignore for now

                if 'gain' in param.keys():
                    rsp = self.set_gain(param['gain'])

                if 'HV' in param.keys():
                    rsp = self.set_HV(param['HV'])

                if 'measure' in param.keys():
                    rsp = self.set_measure(param['measure']) 

                rsp = self.set_VStart(param['offset'] - param['amplitude'] /2)
                rsp = self.set_VEnd(param['offset'] + param['amplitude'] /2)

                self.scanRate = (4*1000 * param['amplitude'] ) / param ['period']  #period [ms] to V/s
                rsp = self.set_ScanRate( self.scanRate ) 

                self.testDuration = np.abs(param['amplitude']) / self.scanRate
                self.testLength = int(self.testDuration * 1000)  #!!! Hardcoded in firmware too !!! TODO: change in firmware and here.
                #print('Length: ', self.testLength)
                return rsp   # not ideal to return response from last command  -  fix todo 

        else:    
            cmd_dict = {CommandKey: SetParamCmd, TestKey: testname, ParamKey: param}
            msg_dict = self.send_cmd(cmd_dict)
            return msg_dict[ResponseKey][ParamKey]


    def set_volt_range(self,volt_range):
        """Sets the output voltage range (V)- used when setting output voltage manually.

        """
        if not volt_range in self.get_all_volt_range():
            raise ValueError('unknown voltage range')
        cmd_dict = {CommandKey: SetVoltRangeCmd, VoltRangeKey: volt_range}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][VoltRangeKey]


    def get_volt_range(self):
        """Gets the current value for the output voltage range (V).

        """
        cmd_dict = {CommandKey: GetVoltRangeCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][VoltRangeKey]


    def get_all_volt_range(self):
        """Gets a list of voltage ranges supported by the device.

        """
        return HwVariantToVoltRangesDict[self.hw_variant]


    def set_curr_range(self,curr_range):
        """Sets the measurement current range (uA).

        """
        if not curr_range in self.get_all_curr_range(): 
            raise ValueError('unknown current range')
        cmd_dict = {CommandKey: SetCurrRangeCmd, CurrRangeKey: curr_range}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][CurrRangeKey]


    def get_curr_range(self):
        """Gets the current value of the measurement current range (uA).

        """
        cmd_dict = {CommandKey: GetCurrRangeCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][CurrRangeKey]


    def get_all_curr_range(self):
        """Gets a list of all current ranges supported by the device.

        """
        return HwVariantToCurrRangesDict[self.hw_variant]


    def get_device_id(self):
        """Gets the current value of the device identification number

        """
        cmd_dict = {CommandKey: GetDeviceIdCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][DeviceIdKey]


    def set_device_id(self,device_id):
        """Sets the current value of the device identification number.

        """
        cmd_dict = {CommandKey: SetDeviceIdCmd, DeviceIdKey: device_id}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][DeviceIdKey]


    def set_sample_period(self,sample_period):
        """Sets the sample period (s) used for measurements. The sample period is the
        time between samples. 

        """
        cmd_dict = {CommandKey: SetSamplePeriodCmd, SamplePeriodKey: sample_period}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][SamplePeriodKey]


    def get_sample_period(self):
        """Gets the current value for the sample period (s). The sample period is the
        time between samples.

        """
        cmd_dict = {CommandKey: GetSamplePeriodCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][SamplePeriodKey]


    def set_sample_rate(self,sample_rate):
        """Sets the measurement sample rate (Hz). Note, this is an alternative way to set 
        the sample period. 

        """
        sample_period = int(1.0e3/sample_rate)
        return self.set_sample_period(sample_period)


    def get_sample_rate(self):
        """Gets the measurement sample period (Hz). Note, the sample rate is 1/sample_period.

        """
        sample_period = self.get_sample_period()
        sample_rate = 1.0e3/sample_period
        return sample_rate


    def get_test_done_time(self, test, timeunit='ms'):
        """Gets the time in seconds required to complete the specified test including any quietTime, etc. 

        """
        cmd_dict = {CommandKey: GetTestDoneTimeCmd, TestKey: test}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][TestDoneTimeKey]*TimeUnitToScale[timeunit]


    def get_test_names(self):
        """Gets the list of the names of all tests which can be performed by the device with the current firmware. 

        """
        cmd_dict = {CommandKey: GetTestNamesCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][TestNameArrayKey]


    def get_firmware_version(self):
        """Gets the version string for the firmware on the device.

        """
        cmd_dict = {CommandKey: GetVersionCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][VersionKey]


    def set_mux_enabled(self, value):
        """Enable/Disables the multiplexer expansion hardware

        """
        cmd_dict = {CommandKey: SetMuxEnabledCmd, MuxEnabledKey: value}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][MuxEnabledKey]


    def get_mux_enabled(self):
        """Get multiplexer expansion hardware enabled state 

        """
        cmd_dict = {CommandKey: GetMuxEnabledCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][MuxEnabledKey]


    def set_enabled_mux_channels(self,channels):
        """Enables the specified subset of multiplexer working electrode channels

        """
        cmd_dict = {CommandKey: SetEnabledMuxChanCmd, MuxChannelKey: channels}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][MuxChannelKey]


    def get_enabled_mux_channels(self):
        """Get the list of currently enabled multiplexer working electrode channels

        """
        cmd_dict = {CommandKey: GetEnabledMuxChanCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][MuxChannelKey]

    def get_mux_test_names(self):
        """Gets the list of test which are compatible with the multiplexer expansion hardware

        """
        cmd_dict = {CommandKey: GetMuxTestNamesCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][TestNameArrayKey]


    def set_mux_ref_elect_connected(self,value):
        """Sets the connected state (True/False) of the reference electrode when using the multiplexer 
        expansion hardware.

        """
        cmd_dict = {CommandKey: SetMuxRefElectConnCmd,ConnectedKey: value}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ConnectedKey]


    def get_mux_ref_elect_connected(self):
        """ Returns the connected state (True/False) of the reference electrode when using the multiplexer
        expansion hardware.

        """
        cmd_dict = {CommandKey: GetMuxRefElectConnCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ConnectedKey]


    def set_mux_ctr_elect_connected(self,value):
        """Sets the connected state (True or False) of the counter electrode when using the multiplexer
        expansion hardware.

        """
        cmd_dict = {CommandKey: SetMuxCtrElectConnCmd, ConnectedKey: value}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ConnectedKey]


    def get_mux_ctr_elect_connected(self):
        """Returns the connected state (True or False) of the counter electrode when using the multiplexer
        expansion hardware.

        """
        cmd_dict = {CommandKey: GetMuxCtrElectConnCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ConnectedKey]


    def set_mux_wrk_elect_connected(self, value):
        """Sets the connected state (1, 2, 3, 4, 5, 6, 7 or False) of the working electrode when using the 
        multiplexer expansion hardware.

        """
        cmd_dict = {CommandKey: SetMuxWrkElectConnCmd, ConnectedKey: value}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ConnectedKey]


    def get_mux_wrk_elect_connected(self):
        """Returns the connected state (1, 2, 3, 4, 5, 6, 7 or False) of the working electrode when using 
        the multiplexer expansion hardware.

        """
        cmd_dict = {CommandKey: GetMuxWrkElectConnCmd}
        msg_dict = self.send_cmd(cmd_dict)
        return msg_dict[ResponseKey][ConnectedKey]


    def disconnect_all_mux_elect(self):
        """Disconnects all electrodes (reference, counter and working) when using the multiplexer expansion
        hardware.

        """
        cmd_dict = {CommandKey: DisconnAllMuxElectCmd}
        msg_dict = self.send_cmd(cmd_dict)


    def run_test(self, testname, param=None, filename=None, display='pbar', timeunit='s'):
        """Runs the test with specified test name and returns the time, voltage and current data.

        """

        # repeating a test seems to fail... try to stop first - probably not required.
        self.stop_test()

        mux_enabled = False
        channel_list = [0]
        # try/except to handly lack of mux implementation for ECL device (GVR)
        
        #if self.firmware_version >= MinimumFirmwareVersionForMux:
        #    mux_enabled = self.get_mux_enabled()
        
        mux_enabled = False

        if mux_enabled:
                channel_list = self.get_enabled_mux_channels()

        if timeunit not in TimeUnitToScale:
            raise RuntimeError('uknown timeunit option {0}'.format(timeunit))
        if display not in (None, 'pbar', 'data', 'plot'):
            raise RuntimeError('uknown display option {0}'.format(display))

        if param is not None:
            self.set_param(testname,param)

        if display in ('pbar', 'data'):
            print()
            print('test: {0}'.format(testname))
            print()
            display_print = True
        else:
            display_print = False

        if display == 'pbar':
            test_done_tval = self.get_test_done_time(testname, timeunit=timeunit)
            widgets = [progressbar.Percentage(),progressbar.Bar()]
            pbar = progressbar.ProgressBar(widgets=widgets,maxval=test_done_tval)
            pbar.start()

        
        data_dict = {chan:{TimeKey:[],VoltKey:[],CurrKey:[],PhotoCurrKey:[]} for chan in channel_list}  # added PhotoCurr

        if display == 'plot':    # added GVR
            plotActive = livePlot(data_dict)
            figure(figsize=(7, 7/2))
            

        # Determine output file type and open if required
        if filename is not None:
            filename_base, filename_ext = os.path.splitext(filename)
            if filename_ext == '.pkl':
                output_filetype = PklOutputFileType
            else:
                output_filetype = TxtOutputFileType
                fid = open(filename,'w')

        # write parameters to file as header (added GVR)
        if (filename is not None) and (output_filetype == TxtOutputFileType):
            fid.write(json.dumps(param))

        # Start voltammetric test
        cmd_dict = {CommandKey: RunTestCmd, TestKey: testname}
        msg_dict = self.send_cmd(cmd_dict)
        self.test_running = True

        done = False
        endPattern = re.compile("EndOfTest")   # DE 15.3   GVR todo: modify to avoid exceptional handling of endoftest
        while not done: 
         
            if self.RawMode:
                v = self.readline()    
                if endPattern.search(str(v)):
                    print("End of Test")
                    sample_dict = {}
                else:             
                    vals = [float(i) for i in v.split()]
                    # in raw mode we expect 2 or 3 floats in order determined they are listed in self.measure
                    sample_dict = dict.fromkeys(self.measure)  # initialise dictionary w
            
                    try:
                        for key in self.measure:
                            sample_dict[key] = vals.pop(0)
                    except:
                        sample_dict = {}

                    if self.debug:
                        print("Sample dictionary: ",sample_dict)

            else:
                sample_json = self.readline()
                sample_json = sample_json.strip()
                sample_dict = json.loads(sample_json.decode())

            if len(sample_dict) > 0:
                
                chan = 0  # Dummy channel used when mux isn't running
                if mux_enabled:
                    chan = sample_dict[ChanKey]
                    
                tval = sample_dict[TimeKey]*TimeUnitToScale[timeunit]
                data_dict[chan][TimeKey].append(tval)

                try:
                    volt = sample_dict[VoltKey]
                except: 
                    volt = None
                else: 
                    data_dict[chan][VoltKey].append(volt)

                try:    
                    curr = sample_dict[CurrKey]
                except:
                    curr = None
                else:
                    data_dict[chan][CurrKey].append(curr)
                
                try:
                    phot = sample_dict[PhotoCurrKey]
                except:
                    phot = None
                else:
                    data_dict[chan][PhotoCurrKey].append(phot)
                
                #for k,v in [(TimeKey,tval),(VoltKey,volt),(CurrKey,curr),(PhotoCurrKey,phot)]:
                #    data_dict[chan][k].append(v)

                # Write data to file
                if (filename is not None) and (output_filetype == TxtOutputFileType):
                    if chan == 0:
                        #fid.write('{0:1.3f}, {1:1.4f}, {2:1.4f}\n'.format(tval,volt,curr))
                        fid.write('{},{},{},{}\n'.format(tval,volt,curr,phot))
                    else:
                        fid.write('{0}, {1:1.3E}, {2:1.4E}, {3:1.4E}, {3:1.4E}\n'.format(chan,tval,volt,curr,phot))

                # Handle diplay options
                if display == 'data':
                    if chan == 0:
                        print('{}, {}, {}, {}'.format(tval,volt,curr,phot))
                        #print(f'{tval:9.4f, volt:9.4f, curr:9.4f\n}')
                    else:
                        print('ch{0}: {1:1.3f}, {2:1.4f}, {3:1.4f}, {3:1.4f}'.format(chan,tval,volt,curr,phot))

                if display == 'plot':
                    plotActive.data =  data_dict   # need to append not replace!
                    drawnow(plotActive.draw, stop_on_close=True)
                    # if chan == 0:
                    #     y_vec.append(sample_dict[self.measure[2]])
                    #     x_vec.append(sample_dict[self.measure[0]])
                    #     #line1 = live_plotter(x_vec,y_vec,line1,identifier='',ylabel=self.measure[2],xlabel=self.measure[0])
                    # else:
                    #     pass # case not implemented
                    
                elif display == 'pbar':
                    pbar.update(tval)
            else:
                done = True

        self.test_running = False

        if display_print:
            print()
            print()

        if filename is not None:
            if output_filetype == PklOutputFileType:
                with open(filename,'w') as fid:
                    if mux_enabled:
                        cPickle.dump(data_dict, fid)
                    else:
                        cPickle.dump(data_dict[0], fid)
            else:
                fid.close()
            print('Data written to file: {}'.format(filename))

        if mux_enabled:
            out = data_dict 
        else:
            #return data_dict[0][TimeKey], data_dict[0][VoltKey], data_dict[0][CurrKey]
            #return data_dict[0][TimeKey], data_dict[0][VoltKey], data_dict[0][CurrKey], data_dict[0][PhotoCurrKey]
            out = data_dict[0]
        
        self.flush()   # included in attempt to fix communication error after experiment
        
        return out
 
    def flush(self):
        """ not sure if required...

        """
        self.reset_input_buffer()
        self.reset_output_buffer()


    def send_cmd(self,cmd_dict):
        """Sends a command to the device.  Low-level method - command is specified 
        using command dictionary.

        """
        cmd_json = json.dumps(cmd_dict) + '\n'
        
        # GVR: raw option added 
        if self.RawMode == True:
            
            cmdStr = cmd_dict[CommandKey]
            params = [str(v) for k,v in cmd_dict.items() if k != CommandKey]   
            if params:
                paramStr = ' '.join(params) 
                cmdStr +=  " " + paramStr
            cmdStr += '\r'

            if self.debug:
                print('Command: {}\n'.format(cmd_dict))
                print('Raw: ',cmdStr)

            cmd = cmdStr
        else:
            cmd = cmd_json
        
        self.write(cmd.encode())
      
        # raw option added (gvr)
        if self.RawMode == True:    
            msg = self.readline()
            msg = msg.strip()
            # package it up... obviously not as robust, assumes response matched command sent
            # and uses dict cmdMap to provide expected response for given command
            v = msg.decode()

            #print ('Decoded: ', v)
            if v != '':
                try:
                    v = float(v)
                except ValueError:
                    pass
                msg_dict = {ResponseKey: 
                        {cmdMap[cmd_dict[CommandKey]]: v,
                         CommandKey: cmd_dict[CommandKey]},  
                        SuccessKey: '1'}  
            else:
                 msg_dict = {ResponseKey: 
                        {cmdMap[cmd_dict[CommandKey]]: v,
                         CommandKey: cmd_dict[CommandKey]}}  
            
            if self.debug:
                print('Response received: ' + str(msg) + '\n')
                print('Response interpreted as: ' + str(msg_dict) + '\n')
            
 
        else:    
            msg_json = self.readline()
            msg_json = msg_json.strip()
            msg_dict = json.loads(msg_json.decode())


        self.check_cmd_msg(cmd_dict,msg_dict)
        return msg_dict


    def check_cmd_msg(self,cmd_dict,msg_dict):
        self.check_for_success(msg_dict)
        self.check_cmd_match(cmd_dict,msg_dict)
        
        
        if TestKey in cmd_dict:
           if self.RawMode == False:   
                self.check_test_match(cmd_dict,msg_dict)

                    
    def check_for_success(self,msg_dict):
        try: 
            success = msg_dict[SuccessKey] 
        except KeyError:
            if self.debug:
                print('msg_dict: {0}'.format(msg_dict))
            raise IOError('json key {0} missing'.format(SuccessKey))
        if not success: 
            raise IOError('{0}, {1}'.format(msg_dict[MessageKey], msg_dict))


    def check_cmd_match(self,cmd_dict,msg_dict):
        cmd_sent = cmd_dict[CommandKey]
        cmd_recv = msg_dict[ResponseKey][CommandKey]
        if cmd_recv != cmd_sent: 
            raise IOError('command sent, {0}, not same as received, {1}'.format(cmd_sent, cmd_recv))


    def check_test_match(self,cmd_dict,msg_dict): 
        test_sent = cmd_dict[TestKey]
        test_recv = msg_dict[ResponseKey][TestKey]
        if test_recv != test_sent:
            raise IOError('testname sent, {0}, not same as received, {1}'.format(test_sent,test_recv))


    def atexit_cleanup(self):
        
        #print('Exiting...')
        if self.isOpen() and self.test_running:
            print('Stopping test...')
            self.stop_test()
        
        # close port
        if self.isOpen():
            print('Closing serial connection...',end='')
            self.close()
            print ('done.')

