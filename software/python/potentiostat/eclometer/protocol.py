
"""

Provides key-value pairs used for communication with ECLOMETER

TODO: implement more conventional approach to handling configuration parameters or organise as 
      as class or module heirarchy to avoid cluttering namespace 


@author: Grant van Riessen, g.vanriessen@latrobe.edu.au
La Trobe University, 2021
"""


# list of supported experiments
# TODO: read from device via get_test_names
supportedTests = ['cyclic','chrono','debug']


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
V0Key = 'EO'
V1Key = 'E1'
V2Key = 'E2'
T0Key = 'TO'
T1Key = 'T1'
T2Key = 'T2'
ScanRateKey = 'scanrate' #GVR
StopTestKey = 'stop'
CyclesKey = 'Cycles'

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
PrescanKey = 'prescan'
PhotoCurrLimitKey = 'photoCurrLimit'

OffsetKey = 'offset'
AmplitudeKey = 'amplitude'

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

GetPhotoCurrLimitCmd = 'getPhotocurrentLim'

GetV0Cmd = 'getE0'
SetV0Cmd = 'setE0'
GetV1Cmd = 'getE1'
SetV1Cmd = 'setE1'
GetV2Cmd = 'getE2'
SetV2Cmd = 'setE2'

GetT0Cmd = 'getT0'
SetT0Cmd = 'setT0'
GetT1Cmd = 'getT1'
SetT1Cmd = 'setT1'
GetT2Cmd = 'getT2'
SetT2Cmd = 'setT2'

#void set_n_cycles(int i);
GetCyclesCmd = 'getCycles'
SetCyclesCmd = 'setCycles'

#void setSaveprescan  # 'ON' | 'Off'
GetSavePrescanCmd = 'getSavePrescan'
SetSavePrescanCmd = 'setSavePrescan'


GetRefToltCmd = 'getRefVolt'
GetParamCmd = 'getParam'
SetParamCmd = 'setParam'
GetVoltRangeCmd = 'getVoltRange'
SetVoltRangeCmd = 'setVoltRange'
GetCurrRangeCmd = 'getCurrRange'
SetCurrRangeCmd = 'setCurrRange'
GetDeviceIdCmd = 'getDeviceId'
SetDeviceIdCmd = 'setDeviceId'
GetSamplePeriodCmd = 'getSampletime'
SetSamplePeriodCmd = 'setSampletime'
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

PrescanSaveOn = 'On'
PrescanSaveOff = 'Off'


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
          GetPhotoCurrLimitCmd: PhotoCurrLimitKey,
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
          RunTestCmd : TestKey,
          GetV0Cmd : V0Key,
          SetV0Cmd : V0Key,
          GetV1Cmd : V1Key,
          SetV1Cmd : V1Key,
          GetV2Cmd : V2Key,
          SetV2Cmd : V2Key,
          GetT0Cmd : T0Key,
          SetT0Cmd : T0Key,
          GetT1Cmd : T1Key,
          SetT1Cmd : T1Key,
          GetT2Cmd : T2Key,
          SetT2Cmd : T2Key,
          GetSavePrescanCmd : PrescanKey,
          SetSavePrescanCmd : PrescanKey,
          SetCyclesCmd : CyclesKey,
          GetCyclesCmd : CyclesKey,
          GetSamplePeriodCmd : SamplePeriodKey
         }


