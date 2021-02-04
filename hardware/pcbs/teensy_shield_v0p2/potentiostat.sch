EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 17000 17500
encoding utf-8
Sheet 1 1
Title ""
Date "19 dec 2018"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L mea1d05xxsc:MEA1D05XXSC U6
U 1 1 573678C5
P 7025 18450
F 0 "U6" H 7025 18900 60  0000 C CNN
F 1 "MEA1D05XXSC" H 7025 18000 60  0000 C CNN
F 2 "~" H 6925 18350 60  0000 C CNN
F 3 "~" H 6925 18350 60  0000 C CNN
	1    7025 18450
	1    0    0    -1  
$EndComp
Text Label 7725 18600 0    60   ~ 0
GND
Text Label 7725 18500 0    60   ~ 0
-12V
Text Label 7725 18700 0    60   ~ 0
+12V
Text Label 7725 18200 0    60   ~ 0
5V
Text Notes 6600 19150 0    60   ~ 0
+/- 12V Supply for OPAMPs
Wire Wire Line
	7425 18300 7525 18300
Wire Wire Line
	7525 18300 7525 18600
Wire Wire Line
	7425 18600 7525 18600
Connection ~ 7525 18600
Wire Wire Line
	7425 18500 7725 18500
Wire Wire Line
	7425 18700 7725 18700
Wire Wire Line
	7425 18200 7725 18200
Text Notes 11325 17875 0    60   ~ 0
Expanson Headers
Wire Wire Line
	14500 18225 14600 18225
Wire Wire Line
	14600 18225 14600 18275
Wire Wire Line
	14600 18325 14500 18325
Wire Wire Line
	14600 18275 14800 18275
Connection ~ 14600 18275
Wire Wire Line
	14000 18225 13800 18225
Wire Wire Line
	13800 18325 14000 18325
Text Label 13800 18225 2    60   ~ 0
5V
Text Label 13800 18325 2    60   ~ 0
3V3
Text Label 14800 18275 0    60   ~ 0
VUEXT
Text Notes 13475 17900 0    60   ~ 0
Expansion header power selection
Text Notes -3850 16900 0    60   ~ 0
Electrode Connectors
Text Label 5050 3050 2    60   ~ 0
GND
Text Label 5050 3350 2    60   ~ 0
AGND
Text Label -2000 11350 2    60   ~ 0
REF_0V6
Text Notes 5050 3650 0    60   ~ 0
GND test points 
Text Notes -4550 3650 0    60   ~ 0
DAC test points
Text Notes 26925 4875 0    60   ~ 0
bipolor/unipolar transimpedance \namplifier output test points
Text Label -2000 10800 2    60   ~ 0
REF_NEG_0V6
Text Notes 24150 6900 0    60   ~ 0
counter electrode test point
Text Label 6150 18050 1    60   ~ 0
5V
Text Label 6150 18800 3    60   ~ 0
GND
Wire Wire Line
	5525 725  5525 875 
Wire Wire Line
	5975 725  5975 875 
Text Label 5075 875  3    60   ~ 0
5V
Text Label 5525 875  3    60   ~ 0
GND
Text Label 5975 875  3    60   ~ 0
AGND
Wire Wire Line
	11450 19100 11250 19100
Wire Wire Line
	11250 19200 11450 19200
Wire Wire Line
	11450 19300 11250 19300
Wire Wire Line
	11450 19400 11250 19400
Wire Wire Line
	11450 19500 11250 19500
Wire Wire Line
	11950 19100 12150 19100
Wire Wire Line
	11950 19200 12150 19200
Wire Wire Line
	11950 19300 12150 19300
Wire Wire Line
	11950 19400 12150 19400
Wire Wire Line
	11950 19500 12150 19500
Text Label 11250 19100 2    60   ~ 0
VEXP
Text Label 12150 19100 0    60   ~ 0
GND
Text Label 11250 19200 2    60   ~ 0
D24
Text Label 12150 19200 0    60   ~ 0
D25
Text Label 11250 19300 2    60   ~ 0
D26
Text Label 12150 19300 0    60   ~ 0
D27
Text Label 11250 19400 2    60   ~ 0
D28
Text Label 12150 19400 0    60   ~ 0
D29
Text Label 11250 19500 2    60   ~ 0
D30
Text Label 12150 19500 0    60   ~ 0
D31
Wire Wire Line
	14500 18775 14600 18775
Wire Wire Line
	14600 18775 14600 18825
Wire Wire Line
	14600 18875 14500 18875
Wire Wire Line
	14600 18825 14800 18825
Connection ~ 14600 18825
Wire Wire Line
	14000 18775 13800 18775
Wire Wire Line
	13800 18875 14000 18875
Text Label 13800 18775 2    60   ~ 0
5V
Text Label 13800 18875 2    60   ~ 0
3V3
Text Label 14800 18825 0    60   ~ 0
VEXP
Wire Wire Line
	12700 18925 12700 19125
Wire Wire Line
	13000 18925 13000 19125
Text Label 12700 19125 3    60   ~ 0
SCL
Text Label 13000 19125 3    60   ~ 0
SDA
Wire Wire Line
	12700 18500 12850 18500
Wire Wire Line
	12850 18500 12850 18300
Connection ~ 12850 18500
Text Label 12850 18300 0    60   ~ 0
VUEXT
Wire Wire Line
	7525 18600 7725 18600
Wire Wire Line
	14600 18275 14600 18325
Wire Wire Line
	14600 18825 14600 18875
Wire Wire Line
	12850 18500 13000 18500
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 60466A62
P -8600 7500
F 0 "U?" H -8450 7400 50  0000 L CNN
F 1 "OP07" H -8450 7600 50  0000 L CNN
F 2 "" H -8550 7550 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H -8550 7650 50  0001 C CNN
	1    -8600 7500
	1    0    0    1   
$EndComp
NoConn ~ -8600 7200
NoConn ~ -8500 7200
Text Label -8700 7100 1    60   ~ 0
-12V
Text Label -8700 7900 3    60   ~ 0
+12V
Wire Wire Line
	-8700 7200 -8700 7100
Wire Wire Line
	-8700 7800 -8700 7900
$Comp
L Device:R R?
U 1 1 60741FB7
P -9500 7400
F 0 "R?" V -9600 7400 50  0000 C CNN
F 1 "12k" V -9500 7400 50  0000 C CNN
F 2 "" V -9570 7400 50  0001 C CNN
F 3 "~" H -9500 7400 50  0001 C CNN
	1    -9500 7400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6078CF54
P -8650 6750
F 0 "R?" V -8750 6750 50  0000 C CNN
F 1 "20k" V -8650 6750 50  0000 C CNN
F 2 "" V -8720 6750 50  0001 C CNN
F 3 "~" H -8650 6750 50  0001 C CNN
	1    -8650 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60870522
P -9500 7600
F 0 "R?" V -9400 7600 50  0000 C CNN
F 1 "12k" V -9500 7600 50  0000 C CNN
F 2 "" V -9570 7600 50  0001 C CNN
F 3 "~" H -9500 7600 50  0001 C CNN
	1    -9500 7600
	0    1    1    0   
$EndComp
Wire Wire Line
	-9650 7600 -9900 7600
Wire Wire Line
	-9350 7600 -9100 7600
$Comp
L Device:R R?
U 1 1 6095CC8C
P -9100 7950
F 0 "R?" H -9250 7950 50  0000 L CNN
F 1 "20k" V -9100 7900 50  0000 L CNN
F 2 "" V -9170 7950 50  0001 C CNN
F 3 "~" H -9100 7950 50  0001 C CNN
	1    -9100 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	-9100 7600 -9100 7800
Connection ~ -9100 7600
Wire Wire Line
	-9100 7600 -8900 7600
Wire Wire Line
	-9100 8100 -9100 8300
Text Label -9100 8300 3    60   ~ 0
AGND
Text Label -9900 7600 2    60   ~ 0
REF_0V6
Text Label -9900 7400 2    60   ~ 0
DAC_UNI
Text Label -7750 7250 1    60   ~ 0
DAC_BIP
Wire Wire Line
	-9350 7400 -9100 7400
Wire Wire Line
	-8300 7500 -8100 7500
Wire Wire Line
	-8800 6750 -9100 6750
Wire Wire Line
	-9100 6750 -9100 7400
Connection ~ -9100 7400
Wire Wire Line
	-9100 7400 -8900 7400
Wire Wire Line
	-8500 6750 -8100 6750
Wire Wire Line
	-8100 6750 -8100 7500
Connection ~ -8100 7500
$Comp
L 74HC138:74HC138 U?
U 1 1 6035EC77
P -10950 2800
F 0 "U?" H -11200 3400 50  0000 C CNN
F 1 "74HC138" V -10950 2850 50  0000 C CNN
F 2 "" H -10950 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc238.pdf" H -10950 2800 50  0001 C CNN
	1    -10950 2800
	1    0    0    -1  
$EndComp
Text Label -10950 2000 1    50   ~ 0
3V3
Wire Wire Line
	-10950 3300 -10950 3500
Text Label -10950 3500 3    50   ~ 0
GND
Wire Wire Line
	-10950 2000 -10950 2200
Wire Wire Line
	-11350 3000 -11500 3000
Wire Wire Line
	-11500 2800 -11350 2800
Text Label -11700 2800 2    50   ~ 0
GND
Text Label -11700 3100 2    50   ~ 0
3V3
Wire Wire Line
	-11500 2800 -11500 2600
Wire Wire Line
	-11500 2600 -11350 2600
Connection ~ -11500 2800
Wire Wire Line
	-11500 2800 -11500 3000
Wire Wire Line
	-11700 2800 -11500 2800
Wire Wire Line
	-11700 3100 -11350 3100
Wire Wire Line
	-11350 2400 -11700 2400
Wire Wire Line
	-11350 2500 -11700 2500
Text Label -11700 2400 2    60   ~ 0
DAC_GAIN_A0
Text Label -11700 2500 2    60   ~ 0
DAC_GAIN_A1
NoConn ~ -10550 2800
NoConn ~ -10550 2900
NoConn ~ -10550 3000
NoConn ~ -10550 3100
Wire Wire Line
	-10550 2400 -10300 2400
Wire Wire Line
	-10550 2500 -10300 2500
Wire Wire Line
	-10550 2600 -10300 2600
Wire Wire Line
	-10550 2700 -10300 2700
Text Label -10300 2400 0    60   ~ 0
SW_GAIN_1X
Text Label -10300 2500 0    60   ~ 0
SW_GAIN_2X
Text Label -10300 2600 0    60   ~ 0
SW_GAIN_5X
Text Label -10300 2700 0    60   ~ 0
SW_GAIN_10X
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 609F0791
P -6450 7600
F 0 "U?" H -6300 7500 50  0000 L CNN
F 1 "OP07" H -6300 7700 50  0000 L CNN
F 2 "" H -6400 7650 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H -6400 7750 50  0001 C CNN
	1    -6450 7600
	1    0    0    1   
$EndComp
Text Label -6550 8000 3    60   ~ 0
+12V
Wire Wire Line
	-6550 7900 -6550 8000
Text Label -6550 7200 1    60   ~ 0
-12V
Wire Wire Line
	-6550 7300 -6550 7200
NoConn ~ -6450 7300
NoConn ~ -6350 7300
Wire Wire Line
	-6750 7700 -6950 7700
Wire Wire Line
	-6950 7700 -6950 8000
Text Label -6950 8000 3    60   ~ 0
AGND
$Comp
L Device:R R?
U 1 1 60C56CD8
P -7350 7500
F 0 "R?" V -7450 7500 50  0000 C CNN
F 1 "10k" V -7350 7500 50  0000 C CNN
F 2 "" V -7420 7500 50  0001 C CNN
F 3 "~" H -7350 7500 50  0001 C CNN
	1    -7350 7500
	0    1    1    0   
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 2 1 60CB16D2
P -5500 5150
F 0 "U?" H -5500 5417 50  0000 C CNN
F 1 "DG411xY" H -5500 5326 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -5500 5050 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -5500 5150 50  0001 C CNN
	2    -5500 5150
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 3 1 60CB5288
P -5500 5850
F 0 "U?" H -5500 6117 50  0000 C CNN
F 1 "DG411xY" H -5500 6026 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -5500 5750 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -5500 5850 50  0001 C CNN
	3    -5500 5850
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 4 1 60CB6A1B
P -5500 6550
F 0 "U?" H -5500 6817 50  0000 C CNN
F 1 "DG411xY" H -5500 6726 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -5500 6450 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -5500 6550 50  0001 C CNN
	4    -5500 6550
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 5 1 60CB7E20
P -9000 2750
F 0 "U?" H -8720 2796 50  0000 L CNN
F 1 "DG411xY" H -8720 2705 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -9000 2650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -9000 2750 50  0001 C CNN
	5    -9000 2750
	1    0    0    -1  
$EndComp
Wire Notes Line
	-5500 5050 -5450 5050
$Comp
L Analog_Switch:DG411xY U?
U 1 1 60CAFCD1
P -5500 4450
F 0 "U?" H -5500 4717 50  0000 C CNN
F 1 "DG411xY" H -5500 4626 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -5500 4350 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -5500 4450 50  0001 C CNN
	1    -5500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	-5500 4650 -5500 4750
Wire Wire Line
	-5500 4750 -5750 4750
Text Label -5750 4750 2    60   ~ 0
SW_GAIN_1X
Wire Wire Line
	-5500 5350 -5500 5450
Wire Wire Line
	-5500 5450 -5750 5450
Text Label -5750 5450 2    60   ~ 0
SW_GAIN_2X
Wire Wire Line
	-5500 6050 -5500 6150
Wire Wire Line
	-5500 6150 -5750 6150
Text Label -5750 6150 2    60   ~ 0
SW_GAIN_5X
Wire Wire Line
	-5500 6750 -5500 6850
Wire Wire Line
	-5500 6850 -5750 6850
Text Label -5750 6850 2    60   ~ 0
SW_GAIN_10X
$Comp
L Device:R R?
U 1 1 61255DE0
P -6200 4450
F 0 "R?" V -6300 4450 50  0000 C CNN
F 1 "10k" V -6200 4450 50  0000 C CNN
F 2 "" V -6270 4450 50  0001 C CNN
F 3 "~" H -6200 4450 50  0001 C CNN
	1    -6200 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	-6050 4450 -5800 4450
$Comp
L Device:R R?
U 1 1 612B6E2D
P -6200 5150
F 0 "R?" V -6300 5150 50  0000 C CNN
F 1 "20k" V -6200 5150 50  0000 C CNN
F 2 "" V -6270 5150 50  0001 C CNN
F 3 "~" H -6200 5150 50  0001 C CNN
	1    -6200 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	-6050 5150 -5800 5150
$Comp
L Device:R R?
U 1 1 61316B8E
P -6200 5850
F 0 "R?" V -6300 5850 50  0000 C CNN
F 1 "50k" V -6200 5850 50  0000 C CNN
F 2 "" V -6270 5850 50  0001 C CNN
F 3 "~" H -6200 5850 50  0001 C CNN
	1    -6200 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	-6050 5850 -5800 5850
$Comp
L Device:R R?
U 1 1 613791EC
P -6200 6550
F 0 "R?" V -6300 6550 50  0000 C CNN
F 1 "100k" V -6200 6550 50  0000 C CNN
F 2 "" V -6270 6550 50  0001 C CNN
F 3 "~" H -6200 6550 50  0001 C CNN
	1    -6200 6550
	0    1    1    0   
$EndComp
Wire Wire Line
	-6050 6550 -5800 6550
Wire Wire Line
	-6950 7500 -6950 6550
Wire Wire Line
	-6950 4450 -6350 4450
Wire Wire Line
	-6950 7500 -6750 7500
Wire Wire Line
	-6350 5150 -6950 5150
Connection ~ -6950 5150
Wire Wire Line
	-6950 5150 -6950 4450
Wire Wire Line
	-6350 5850 -6950 5850
Connection ~ -6950 5850
Wire Wire Line
	-6950 5850 -6950 5150
Wire Wire Line
	-6350 6550 -6950 6550
Connection ~ -6950 6550
Wire Wire Line
	-6950 6550 -6950 5850
Wire Wire Line
	-5200 6550 -4900 6550
Wire Wire Line
	-4900 6550 -4900 7600
Wire Wire Line
	-4900 7600 -6150 7600
Wire Wire Line
	-5200 5850 -4900 5850
Wire Wire Line
	-4900 5850 -4900 6550
Connection ~ -4900 6550
Wire Wire Line
	-5200 5150 -4900 5150
Wire Wire Line
	-4900 5150 -4900 5850
Connection ~ -4900 5850
Wire Wire Line
	-4900 4450 -4900 5150
Connection ~ -4900 5150
Wire Wire Line
	-5200 4450 -4900 4450
Connection ~ -6950 7500
Wire Wire Line
	-7200 7500 -6950 7500
Wire Wire Line
	-4900 7600 -4600 7600
Connection ~ -4900 7600
Text Label -4600 7600 0    60   ~ 0
DAC_BIP_NX
Wire Wire Line
	-9000 3250 -9000 3500
Wire Wire Line
	-8900 3250 -8900 3500
Text Label -9000 3500 3    60   ~ 0
AGND
Text Label -8900 3500 3    60   ~ 0
-12V
Wire Wire Line
	-9000 2250 -9000 2000
Text Label -9000 2000 1    60   ~ 0
+12V
Wire Wire Line
	-8900 2250 -8900 2000
Text Label -8900 2000 1    60   ~ 0
3V3
Wire Wire Line
	-8100 7500 -7750 7500
Wire Wire Line
	-7750 7500 -7750 7250
Connection ~ -7750 7500
Wire Wire Line
	-7750 7500 -7500 7500
Text Notes -8250 2800 0    60   ~ 0
LCSC#: C17218
Text Notes -10700 3400 0    60   ~ 0
LCSC#: C5602
Text Notes -9850 6825 0    50   ~ 0
OP07\nLCSC# C7433
Text Label -9125 10550 1    60   ~ 0
3V3
Text Label -9125 11550 3    60   ~ 0
AGND
$Comp
L Device:C C?
U 1 1 62166DD1
P -9125 11050
F 0 "C?" H -9010 11096 50  0000 L CNN
F 1 "4.7uF" H -9010 11005 50  0000 L CNN
F 2 "" H -9087 10900 50  0001 C CNN
F 3 "~" H -9125 11050 50  0001 C CNN
	1    -9125 11050
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8175 11050 -7925 11050
$Comp
L Device:C C?
U 1 1 6230ECA5
P -7925 11400
F 0 "C?" H -7810 11446 50  0000 L CNN
F 1 "4.7uF" H -7810 11355 50  0000 L CNN
F 2 "" H -7887 11250 50  0001 C CNN
F 3 "~" H -7925 11400 50  0001 C CNN
	1    -7925 11400
	1    0    0    -1  
$EndComp
Wire Wire Line
	-7925 11050 -7925 11250
Connection ~ -7925 11050
Wire Wire Line
	-7925 11550 -7925 11800
Text Label -7925 11800 3    60   ~ 0
AGND
Wire Wire Line
	-8875 10800 -9125 10800
Wire Wire Line
	-9125 10800 -9125 10550
Wire Wire Line
	-9125 11200 -9125 11300
Wire Wire Line
	-9125 11300 -8875 11300
Wire Wire Line
	-9125 10900 -9125 10800
Connection ~ -9125 10800
Wire Wire Line
	-9125 11300 -9125 11550
Connection ~ -9125 11300
Text Label -7925 10750 1    60   ~ 0
REF_3V
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 626D3619
P -6675 11150
F 0 "U?" H -6525 11250 50  0000 L CNN
F 1 "OP07" H -6525 11050 50  0000 L CNN
F 2 "" H -6625 11200 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H -6625 11300 50  0001 C CNN
	1    -6675 11150
	1    0    0    1   
$EndComp
NoConn ~ -6675 10850
NoConn ~ -6575 10850
Text Label -6775 11550 3    60   ~ 0
+12V
Wire Wire Line
	-6775 11450 -6775 11550
Text Label -6775 10750 1    60   ~ 0
-12V
Wire Wire Line
	-6775 10850 -6775 10750
Wire Wire Line
	-7925 11050 -7925 10750
Text Notes -8850 11950 0    60   ~ 0
3V reference \n\nLCSC#: C140329\nREF3330AIDBZR
Text Notes 650  -1300 0    200  ~ 0
Notes:\n\n1.) Don't forget the bypass capacitors!!!\n2.) Maybe change DC converter from  +/-12V  to +/-15V \n3.) Add switch to working electrode ( and counter and reference?)\n4.) Add low pass filters to inputs  (DAC) and outputs (ADC)\n
NoConn ~ 21700 7400
NoConn ~ 21800 7400
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 63AACB4F
P 21700 7700
F 0 "U?" H 21800 7800 50  0000 L CNN
F 1 "OP07" H 21800 7600 50  0000 L CNN
F 2 "" H 21750 7750 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H 21750 7850 50  0001 C CNN
	1    21700 7700
	1    0    0    1   
$EndComp
Text Label 21250 7800 2    60   ~ 0
AGND
$Comp
L Device:R R?
U 1 1 63DF03EB
P 20500 7900
F 0 "R?" H 20550 7900 50  0000 L CNN
F 1 "10k" V 20500 7850 50  0000 L CNN
F 2 "" V 20430 7900 50  0001 C CNN
F 3 "~" H 20500 7900 50  0001 C CNN
	1    20500 7900
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 63DF1A32
P 20500 7300
F 0 "R?" H 20550 7300 50  0000 L CNN
F 1 "10k" V 20500 7250 50  0000 L CNN
F 2 "" V 20430 7300 50  0001 C CNN
F 3 "~" H 20500 7300 50  0001 C CNN
	1    20500 7300
	1    0    0    1   
$EndComp
Wire Wire Line
	20500 7750 20500 7600
Wire Wire Line
	20500 7600 21250 7600
Wire Wire Line
	20500 7600 20500 7450
Connection ~ 20500 7600
Wire Wire Line
	20500 8050 20500 8200
Wire Wire Line
	20500 7150 20500 7000
Wire Wire Line
	20200 7000 20500 7000
Text Label 20200 7000 2    60   ~ 0
DAC_BIP_NX
Wire Wire Line
	21250 7800 21400 7800
Text Label 21600 7250 1    60   ~ 0
-12V
Text Label 21600 8150 3    60   ~ 0
+12V
Wire Wire Line
	21600 8150 21600 8000
Wire Wire Line
	21600 7400 21600 7250
Connection ~ 21250 7600
Wire Wire Line
	21250 7600 21400 7600
$Comp
L Device:C C?
U 1 1 6422F50E
P 21750 6650
F 0 "C?" V 21600 6650 50  0000 C CNN
F 1 "10nF" V 21900 6650 50  0000 C CNN
F 2 "" H 21788 6500 50  0001 C CNN
F 3 "~" H 21750 6650 50  0001 C CNN
	1    21750 6650
	0    1    -1   0   
$EndComp
Wire Wire Line
	21250 6650 21600 6650
Wire Wire Line
	21250 7600 21250 6650
Wire Wire Line
	22000 7700 22200 7700
Wire Wire Line
	22200 7700 22200 6650
Wire Wire Line
	22200 6650 21900 6650
Wire Wire Line
	22200 7700 22500 7700
Connection ~ 22200 7700
Text Label 22500 7700 0    60   ~ 0
CTR_ELECT
$Comp
L 74HC138:74HC138 U?
U 1 1 64865EB3
P 26725 10000
F 0 "U?" H 26475 10600 50  0000 C CNN
F 1 "74HC138" V 26725 10050 50  0000 C CNN
F 2 "" H 26725 10000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc238.pdf" H 26725 10000 50  0001 C CNN
	1    26725 10000
	1    0    0    -1  
$EndComp
Text Label 26725 9200 1    50   ~ 0
3V3
Wire Wire Line
	26725 10500 26725 10700
Text Label 26725 10700 3    60   ~ 0
GND
Wire Wire Line
	26725 9200 26725 9400
Wire Wire Line
	26325 10200 26175 10200
Wire Wire Line
	26175 10000 26325 10000
Text Label 25975 10000 2    60   ~ 0
GND
Text Label 25975 10300 2    60   ~ 0
3V3
Wire Wire Line
	26175 10000 26175 9800
Wire Wire Line
	26175 9800 26325 9800
Connection ~ 26175 10000
Wire Wire Line
	26175 10000 26175 10200
Wire Wire Line
	25975 10000 26175 10000
Wire Wire Line
	25975 10300 26325 10300
Wire Wire Line
	26325 9600 25975 9600
Wire Wire Line
	26325 9700 25975 9700
Text Label 25975 9600 2    60   ~ 0
REF_GAIN_A0
Text Label 25975 9700 2    60   ~ 0
REF_GAIN_A1
NoConn ~ 27125 10000
NoConn ~ 27125 10100
NoConn ~ 27125 10200
NoConn ~ 27125 10300
Wire Wire Line
	27125 9600 27375 9600
Wire Wire Line
	27125 9700 27375 9700
Wire Wire Line
	27125 9800 27375 9800
Wire Wire Line
	27125 9900 27375 9900
Text Label 27375 9600 0    60   ~ 0
SW_GAIN_INV_1X
Text Label 27375 9700 0    60   ~ 0
SW_GAIN_INV_2X
Text Label 27375 9800 0    60   ~ 0
SW_GAIN_INV_5X
Text Label 27375 9900 0    60   ~ 0
SW_GAIN_INV_10X
Text Notes 26875 10650 0    60   ~ 0
gain select demux\nLCSC#: C5602	
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 64A04AA3
P 21775 12200
F 0 "U?" H 21925 12100 50  0000 L CNN
F 1 "OP07" H 21925 12300 50  0000 L CNN
F 2 "" H 21825 12250 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H 21825 12350 50  0001 C CNN
	1    21775 12200
	1    0    0    1   
$EndComp
Text Label 21675 12600 3    60   ~ 0
+12V
Wire Wire Line
	21675 12500 21675 12600
Text Label 21675 11800 1    50   ~ 0
-12V
Wire Wire Line
	21675 11900 21675 11800
NoConn ~ 21775 11900
NoConn ~ 21875 11900
Wire Wire Line
	21475 12300 21275 12300
Wire Wire Line
	21275 12300 21275 12600
Text Label 21275 12600 3    60   ~ 0
AGND
$Comp
L Device:R R?
U 1 1 64A0519E
P 20875 12100
F 0 "R?" V 20775 12100 50  0000 C CNN
F 1 "100k" V 20875 12100 50  0000 C CNN
F 2 "" V 20805 12100 50  0001 C CNN
F 3 "~" H 20875 12100 50  0001 C CNN
	1    20875 12100
	0    1    1    0   
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 2 1 64A051A8
P 22725 9750
F 0 "U?" H 22725 10017 50  0000 C CNN
F 1 "DG411xY" H 22725 9926 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22725 9650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22725 9750 50  0001 C CNN
	2    22725 9750
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 3 1 64A051B2
P 22725 10450
F 0 "U?" H 22725 10717 50  0000 C CNN
F 1 "DG411xY" H 22725 10626 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22725 10350 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22725 10450 50  0001 C CNN
	3    22725 10450
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 4 1 64A051BC
P 22725 11150
F 0 "U?" H 22725 11417 50  0000 C CNN
F 1 "DG411xY" H 22725 11326 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22725 11050 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22725 11150 50  0001 C CNN
	4    22725 11150
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 5 1 64A051C6
P 23975 9900
F 0 "U?" H 24255 9946 50  0000 L CNN
F 1 "DG411xY" H 24255 9855 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 23975 9800 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 23975 9900 50  0001 C CNN
	5    23975 9900
	1    0    0    -1  
$EndComp
Wire Notes Line
	22725 9650 22775 9650
$Comp
L Analog_Switch:DG411xY U?
U 1 1 64A051D1
P 22725 9050
F 0 "U?" H 22725 9317 50  0000 C CNN
F 1 "DG411xY" H 22725 9226 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22725 8950 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22725 9050 50  0001 C CNN
	1    22725 9050
	1    0    0    -1  
$EndComp
Wire Wire Line
	22725 9250 22725 9350
Wire Wire Line
	22725 9350 22475 9350
Text Label 22475 9350 2    60   ~ 0
SW_GAIN_INV_1X
Wire Wire Line
	22725 9950 22725 10050
Wire Wire Line
	22725 10050 22475 10050
Text Label 22475 10050 2    60   ~ 0
SW_GAIN_INV_2X
Wire Wire Line
	22725 10650 22725 10750
Wire Wire Line
	22725 10750 22475 10750
Text Label 22475 10750 2    60   ~ 0
SW_GAIN_INV_5X
Wire Wire Line
	22725 11350 22725 11450
Wire Wire Line
	22725 11450 22475 11450
Text Label 22475 11450 2    60   ~ 0
SW_GAIN_INV_10X
$Comp
L Device:R R?
U 1 1 64A051E7
P 22025 9050
F 0 "R?" V 21925 9050 50  0000 C CNN
F 1 "100k" V 22025 9050 50  0000 C CNN
F 2 "" V 21955 9050 50  0001 C CNN
F 3 "~" H 22025 9050 50  0001 C CNN
	1    22025 9050
	0    1    1    0   
$EndComp
Wire Wire Line
	22175 9050 22425 9050
$Comp
L Device:R R?
U 1 1 64A051F2
P 22025 9750
F 0 "R?" V 21925 9750 50  0000 C CNN
F 1 "50k" V 22025 9750 50  0000 C CNN
F 2 "" V 21955 9750 50  0001 C CNN
F 3 "~" H 22025 9750 50  0001 C CNN
	1    22025 9750
	0    1    1    0   
$EndComp
Wire Wire Line
	22175 9750 22425 9750
$Comp
L Device:R R?
U 1 1 64A051FD
P 22025 10450
F 0 "R?" V 21925 10450 50  0000 C CNN
F 1 "20k" V 22025 10450 50  0000 C CNN
F 2 "" V 21955 10450 50  0001 C CNN
F 3 "~" H 22025 10450 50  0001 C CNN
	1    22025 10450
	0    1    1    0   
$EndComp
Wire Wire Line
	22175 10450 22425 10450
$Comp
L Device:R R?
U 1 1 64A05208
P 22025 11150
F 0 "R?" V 21925 11150 50  0000 C CNN
F 1 "10k" V 22025 11150 50  0000 C CNN
F 2 "" V 21955 11150 50  0001 C CNN
F 3 "~" H 22025 11150 50  0001 C CNN
	1    22025 11150
	0    1    1    0   
$EndComp
Wire Wire Line
	22175 11150 22425 11150
Wire Wire Line
	21275 12100 21275 11150
Wire Wire Line
	21275 9050 21875 9050
Wire Wire Line
	21275 12100 21475 12100
Wire Wire Line
	21875 9750 21275 9750
Connection ~ 21275 9750
Wire Wire Line
	21275 9750 21275 9050
Wire Wire Line
	21875 10450 21275 10450
Connection ~ 21275 10450
Wire Wire Line
	21275 10450 21275 9750
Wire Wire Line
	21875 11150 21275 11150
Connection ~ 21275 11150
Wire Wire Line
	21275 11150 21275 10450
Wire Wire Line
	23025 11150 23325 11150
Wire Wire Line
	23325 12200 22550 12200
Wire Wire Line
	23025 10450 23325 10450
Wire Wire Line
	23325 10450 23325 11150
Connection ~ 23325 11150
Wire Wire Line
	23025 9750 23325 9750
Wire Wire Line
	23325 9750 23325 10450
Connection ~ 23325 10450
Wire Wire Line
	23325 9050 23325 9750
Connection ~ 23325 9750
Wire Wire Line
	23025 9050 23325 9050
Connection ~ 21275 12100
Wire Wire Line
	21025 12100 21275 12100
Wire Wire Line
	23975 10400 23975 10650
Wire Wire Line
	24075 10400 24075 10650
Text Label 23975 10650 3    50   ~ 0
AGND
Text Label 24075 10650 3    50   ~ 0
-12V
Wire Wire Line
	23975 9400 23975 9150
Text Label 23975 9150 1    50   ~ 0
+12V
Wire Wire Line
	24075 9400 24075 9150
Text Label 24075 9150 1    50   ~ 0
3V3
Text Notes 24200 10600 0    60   ~ 0
switch power\nLCSC#: C17218
Text Label 20500 8575 0    60   ~ 0
REF_ELECT_BUF
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 64DCCE7F
P 24925 12300
F 0 "U?" H 25075 12200 50  0000 L CNN
F 1 "OP07" H 25075 12400 50  0000 L CNN
F 2 "" H 24975 12350 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H 24975 12450 50  0001 C CNN
	1    24925 12300
	1    0    0    1   
$EndComp
Text Label 24825 12700 3    60   ~ 0
+12V
Wire Wire Line
	24825 12600 24825 12700
Text Label 24825 11900 1    60   ~ 0
-12V
Wire Wire Line
	24825 12000 24825 11900
NoConn ~ 24925 12000
NoConn ~ 25025 12000
$Comp
L Device:R R?
U 1 1 64E5E508
P 23825 12200
F 0 "R?" V 23725 12200 50  0000 C CNN
F 1 "20k" V 23825 12200 50  0000 C CNN
F 2 "" V 23755 12200 50  0001 C CNN
F 3 "~" H 23825 12200 50  0001 C CNN
	1    23825 12200
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6021D777
P 23825 12600
F 0 "R?" V 23725 12600 50  0000 C CNN
F 1 "12k" V 23825 12600 50  0000 C CNN
F 2 "" V 23755 12600 50  0001 C CNN
F 3 "~" H 23825 12600 50  0001 C CNN
	1    23825 12600
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 60560330
P 24975 11550
F 0 "R?" V 24875 11550 50  0000 C CNN
F 1 "12k" V 24975 11550 50  0000 C CNN
F 2 "" V 24905 11550 50  0001 C CNN
F 3 "~" H 24975 11550 50  0001 C CNN
	1    24975 11550
	0    1    1    0   
$EndComp
Wire Wire Line
	25525 12300 25225 12300
Wire Wire Line
	24625 12400 24425 12400
Wire Wire Line
	24425 12400 24425 12700
Text Label 24425 12700 3    60   ~ 0
AGND
$Comp
L REF33XX:REF33XX U?
U 1 1 602125CA
P -8525 11050
F 0 "U?" H -8525 11540 50  0000 C CNN
F 1 "REF33XX" H -8525 11449 50  0000 C CNN
F 2 "" H -8525 11050 50  0001 C CNN
F 3 "" H -8525 11050 50  0001 C CNN
	1    -8525 11050
	1    0    0    -1  
$EndComp
Text Label -3675 11250 0    60   ~ 0
REF_0V6
Wire Wire Line
	-5775 10900 -5775 11150
Connection ~ -5775 11150
Wire Wire Line
	-6125 11150 -5775 11150
$Comp
L Device:R R?
U 1 1 604DA93A
P -7525 11050
F 0 "R?" V -7625 11050 50  0000 C CNN
F 1 "100k" V -7525 11050 50  0000 C CNN
F 2 "" V -7595 11050 50  0001 C CNN
F 3 "~" H -7525 11050 50  0001 C CNN
	1    -7525 11050
	0    1    1    0   
$EndComp
Wire Wire Line
	-7925 11050 -7675 11050
Wire Wire Line
	-7375 11050 -7175 11050
$Comp
L Device:R R?
U 1 1 605FD375
P -6625 10300
F 0 "R?" V -6725 10300 50  0000 C CNN
F 1 "20k" V -6625 10300 50  0000 C CNN
F 2 "" V -6695 10300 50  0001 C CNN
F 3 "~" H -6625 10300 50  0001 C CNN
	1    -6625 10300
	0    1    1    0   
$EndComp
Wire Wire Line
	-7175 10300 -7175 11050
Connection ~ -7175 11050
Wire Wire Line
	-7175 11050 -6975 11050
Wire Wire Line
	-6125 10300 -6125 11150
Wire Wire Line
	-6125 11150 -6375 11150
Wire Wire Line
	-7175 10300 -6775 10300
Wire Wire Line
	-6475 10300 -6125 10300
Connection ~ -6125 11150
Text Label -5775 10900 1    60   ~ 0
REF_NEG_0V6
$Comp
L Device:R R?
U 1 1 60C41289
P -5375 11150
F 0 "R?" V -5475 11150 50  0000 C CNN
F 1 "20k" V -5375 11150 50  0000 C CNN
F 2 "" V -5445 11150 50  0001 C CNN
F 3 "~" H -5375 11150 50  0001 C CNN
	1    -5375 11150
	0    1    1    0   
$EndComp
Wire Wire Line
	-5775 11150 -5525 11150
Text Label -4975 11650 3    60   ~ 0
AGND
Wire Wire Line
	-4975 11350 -4975 11650
Wire Wire Line
	-4775 11350 -4975 11350
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 635E08BE
P -4475 11250
F 0 "U?" H -4375 11350 50  0000 L CNN
F 1 "OP07" H -4325 11150 50  0000 L CNN
F 2 "" H -4425 11300 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H -4425 11400 50  0001 C CNN
	1    -4475 11250
	1    0    0    1   
$EndComp
NoConn ~ -4475 10950
NoConn ~ -4375 10950
Text Label -4575 10850 1    60   ~ 0
-12V
Wire Wire Line
	-4575 10950 -4575 10850
Text Label -4575 11650 3    60   ~ 0
+12V
Wire Wire Line
	-4575 11550 -4575 11650
Wire Wire Line
	-5225 11150 -4975 11150
$Comp
L Device:R R?
U 1 1 60F15F02
P -4475 10350
F 0 "R?" V -4575 10350 50  0000 C CNN
F 1 "20k" V -4475 10350 50  0000 C CNN
F 2 "" V -4545 10350 50  0001 C CNN
F 3 "~" H -4475 10350 50  0001 C CNN
	1    -4475 10350
	0    1    1    0   
$EndComp
Wire Wire Line
	-4975 11150 -4975 10350
Wire Wire Line
	-4975 10350 -4625 10350
Connection ~ -4975 11150
Wire Wire Line
	-4975 11150 -4775 11150
Wire Wire Line
	-4325 10350 -3975 10350
Wire Wire Line
	-3975 10350 -3975 11250
Wire Wire Line
	-3975 11250 -4175 11250
Wire Wire Line
	-3975 11250 -3675 11250
Connection ~ -3975 11250
Wire Wire Line
	24175 12600 24175 12200
Wire Wire Line
	23975 12600 24175 12600
Wire Wire Line
	23675 12600 23475 12600
Text Label 23475 12600 2    60   ~ 0
REF_NEG_0V6
Connection ~ 24175 12200
Wire Wire Line
	23975 12200 24175 12200
Wire Wire Line
	23325 12200 23675 12200
Connection ~ 23325 12200
Wire Wire Line
	24175 12200 24425 12200
Wire Wire Line
	25125 11550 25525 11550
Wire Wire Line
	25525 11550 25525 12300
Wire Wire Line
	24825 11550 24425 11550
Wire Wire Line
	24425 11550 24425 12200
Connection ~ 24425 12200
Wire Wire Line
	24425 12200 24625 12200
$Comp
L potentiostat-rescue:BAS07-04 D?
U 1 1 60F4B60B
P 26525 11900
F 0 "D?" H 26625 11800 40  0000 C CNN
F 1 "BAS07-04" H 26525 12000 40  0000 C CNN
F 2 "~" H 26525 11900 60  0000 C CNN
F 3 "~" H 26525 11900 60  0000 C CNN
	1    26525 11900
	1    0    0    -1  
$EndComp
Text Label 25875 11900 2    60   ~ 0
AGND
Text Label 27125 11900 0    60   ~ 0
3V3
Text Label 27275 12300 0    60   ~ 0
REF_ELECT_UNI
$Comp
L Device:R R?
U 1 1 60FEF7F6
P 26175 12300
F 0 "R?" V 26075 12300 50  0000 C CNN
F 1 "1k" V 26175 12300 50  0000 C CNN
F 2 "" V 26105 12300 50  0001 C CNN
F 3 "~" H 26175 12300 50  0001 C CNN
	1    26175 12300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 610848A7
P 26875 12300
F 0 "R?" V 26775 12300 50  0000 C CNN
F 1 "100" V 26875 12300 50  0000 C CNN
F 2 "" V 26805 12300 50  0001 C CNN
F 3 "~" H 26875 12300 50  0001 C CNN
	1    26875 12300
	0    1    1    0   
$EndComp
Wire Wire Line
	27025 12300 27275 12300
Wire Wire Line
	26325 12300 26525 12300
Wire Wire Line
	26525 12100 26525 12300
Connection ~ 26525 12300
Wire Wire Line
	26525 12300 26725 12300
Wire Wire Line
	26925 11900 27125 11900
Wire Wire Line
	26125 11900 25875 11900
Wire Wire Line
	25525 12300 26025 12300
Connection ~ 25525 12300
Text Notes -2300 11700 0    60   ~ 0
0.6V reference test points
$Comp
L Amplifier_Operational:TL072 U?
U 1 1 6022B446
P 20850 1850
F 0 "U?" H 20850 2217 50  0000 C CNN
F 1 "TL072" H 20850 2126 50  0000 C CNN
F 2 "" H 20850 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 20850 1850 50  0001 C CNN
	1    20850 1850
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 2 1 6023185B
P 19250 8200
F 0 "U?" H 19250 7833 50  0000 C CNN
F 1 "TL072" H 19250 7924 50  0000 C CNN
F 2 "" H 19250 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 19250 8200 50  0001 C CNN
	2    19250 8200
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL072 U?
U 3 1 60234C0C
P 19525 100
F 0 "U?" H 19483 146 50  0000 L CNN
F 1 "TL072" H 19483 55  50  0000 L CNN
F 2 "" H 19525 100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 19525 100 50  0001 C CNN
	3    19525 100 
	1    0    0    -1  
$EndComp
Wire Wire Line
	19425 -200 19425 -450
Wire Wire Line
	19425 400  19425 650 
Text Label 19425 650  3    60   ~ 0
-12V
Text Label 19425 -450 1    60   ~ 0
+12V
Text Label 18350 8300 2    60   ~ 0
REF_ELECT
Wire Wire Line
	18950 8100 18650 8100
Wire Wire Line
	18650 8100 18650 7650
Wire Wire Line
	18650 7650 19850 7650
Wire Wire Line
	19850 7650 19850 8200
Wire Wire Line
	19850 8200 19550 8200
Connection ~ 19850 8200
Wire Wire Line
	18950 8300 18350 8300
Text Notes 19150 1250 0    60   ~ 0
TL072 power\nLCSC# C6961
$Comp
L Analog_Switch:DG411xY U?
U 3 1 602421C2
P 22750 750
F 0 "U?" H 22750 1017 50  0000 C CNN
F 1 "DG411xY" H 22750 926 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22750 650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22750 750 50  0001 C CNN
	3    22750 750 
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 4 1 602459B5
P 22750 1850
F 0 "U?" H 22750 2117 50  0000 C CNN
F 1 "DG411xY" H 22750 2026 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22750 1750 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22750 1850 50  0001 C CNN
	4    22750 1850
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 3 1 603D8EC2
P 24550 750
F 0 "U?" H 24550 1017 50  0000 C CNN
F 1 "DG411xY" H 24550 926 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 24550 650 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 24550 750 50  0001 C CNN
	3    24550 750 
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 4 1 603D8ECC
P 24550 1850
F 0 "U?" H 24550 2117 50  0000 C CNN
F 1 "DG411xY" H 24550 2026 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 24550 1750 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 24550 1850 50  0001 C CNN
	4    24550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	22450 750  21850 750 
Wire Wire Line
	23050 1850 23700 1850
Wire Wire Line
	23050 750  23700 750 
Wire Wire Line
	20550 1950 20250 1950
Wire Wire Line
	20250 1950 20250 2300
Text Label 20250 2300 3    60   ~ 0
AGND
Text Label 19400 1750 2    60   ~ 0
WRK_ELECT
Wire Wire Line
	21150 1850 21850 1850
Wire Wire Line
	21850 750  21850 1850
Connection ~ 21850 1850
Wire Wire Line
	21850 -300 21850 750 
Connection ~ 21850 750 
Wire Wire Line
	21850 -1450 21850 -300
Connection ~ 21850 -300
Wire Wire Line
	25350 750  25350 1850
Wire Wire Line
	25350 1850 24850 1850
Connection ~ 25350 750 
Text Label 27925 1700 1    60   ~ 0
TIA_OUT_BIP
Text Label 26625 25   3    60   ~ 0
AGND
Text Label 26725 25   3    60   ~ 0
-12V
Text Label 27650 0    3    60   ~ 0
AGND
Text Label 27750 0    3    60   ~ 0
-12V
Wire Wire Line
	19400 1750 20250 1750
Wire Wire Line
	22750 1050 22750 950 
Wire Wire Line
	24550 1050 24550 950 
Wire Wire Line
	22750 2150 22750 2050
Wire Wire Line
	24550 2150 24550 2050
$Comp
L 74HC138:74HC138 U?
U 1 1 60CF6B58
P 30100 -625
F 0 "U?" H 29850 -25 50  0000 C CNN
F 1 "74HC138" V 30100 -575 50  0000 C CNN
F 2 "" H 30100 -625 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd74hc238.pdf" H 30100 -625 50  0001 C CNN
	1    30100 -625
	-1   0    0    -1  
$EndComp
Text Label 30100 -1425 1    60   ~ 0
3V3
Wire Wire Line
	30100 -125 30100 75  
Text Label 30100 75   3    60   ~ 0
GND
Wire Wire Line
	30100 -1425 30100 -1225
Wire Wire Line
	30500 -425 30650 -425
Wire Wire Line
	30650 -625 30500 -625
Text Label 30850 -625 0    60   ~ 0
GND
Text Label 30850 -325 0    60   ~ 0
3V3
Wire Wire Line
	30650 -625 30650 -825
Wire Wire Line
	30650 -825 30500 -825
Connection ~ 30650 -625
Wire Wire Line
	30650 -625 30650 -425
Wire Wire Line
	30850 -625 30650 -625
Wire Wire Line
	30850 -325 30500 -325
Wire Wire Line
	30500 -1025 30850 -1025
Wire Wire Line
	30500 -925 30850 -925
NoConn ~ 29700 -625
NoConn ~ 29700 -525
NoConn ~ 29700 -425
NoConn ~ 29700 -325
Text Label 22850 -1150 0    60   ~ 0
SW_TIA_GAIN_1
Text Label 22850 0    0    60   ~ 0
SW_TIA_GAIN_2
Text Label 22850 1050 0    60   ~ 0
SW_TIA_GAIN_3
Text Label 22850 2150 0    60   ~ 0
SW_TIA_GAIN_4
Wire Wire Line
	21850 -1450 22450 -1450
Connection ~ 25350 -300
Wire Wire Line
	25350 -1450 25350 -300
Wire Wire Line
	25350 -300 25350 750 
Wire Wire Line
	24550 0    24550 -100
Wire Wire Line
	22750 0    22750 -100
Wire Wire Line
	24850 -300 25350 -300
Wire Wire Line
	23050 -300 23700 -300
Wire Wire Line
	21850 -300 22450 -300
$Comp
L Analog_Switch:DG411xY U?
U 2 1 603D8EB8
P 24550 -300
F 0 "U?" H 24550 -33 50  0000 C CNN
F 1 "DG411xY" H 24550 -124 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 24550 -400 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 24550 -300 50  0001 C CNN
	2    24550 -300
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 2 1 6023F00E
P 22750 -300
F 0 "U?" H 22750 -33 50  0000 C CNN
F 1 "DG411xY" H 22750 -124 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22750 -400 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22750 -300 50  0001 C CNN
	2    22750 -300
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 1 1 6023C122
P 22750 -1450
F 0 "U?" H 22750 -1183 50  0000 C CNN
F 1 "DG411xY" H 22750 -1274 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 22750 -1550 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 22750 -1450 50  0001 C CNN
	1    22750 -1450
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 1 1 603D862A
P 24550 -1450
F 0 "U?" H 24550 -1183 50  0000 C CNN
F 1 "DG411xY" H 24550 -1274 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 24550 -1550 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 24550 -1450 50  0001 C CNN
	1    24550 -1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	23050 -1450 23700 -1450
Wire Wire Line
	22750 -1150 22750 -1250
Wire Wire Line
	24850 -1450 25350 -1450
Wire Wire Line
	24550 -1150 24550 -1250
Wire Wire Line
	24850 750  25350 750 
Wire Wire Line
	21850 1850 22450 1850
$Comp
L Device:R R?
U 1 1 6241EB2D
P 20900 -2000
F 0 "R?" V 21000 -2025 50  0000 C CNN
F 1 "300k" V 20900 -2000 50  0000 C CNN
F 2 "" V 20830 -2000 50  0001 C CNN
F 3 "~" H 20900 -2000 50  0001 C CNN
	1    20900 -2000
	0    1    1    0   
$EndComp
Wire Wire Line
	29700 -1025 29350 -1025
Wire Wire Line
	29700 -925 29350 -925
Wire Wire Line
	29700 -825 29350 -825
Wire Wire Line
	29700 -725 29350 -725
Text Label 29350 -1025 2    60   ~ 0
SW_TIA_GAIN_1
Text Label 29350 -925 2    60   ~ 0
SW_TIA_GAIN_2
Text Label 29350 -825 2    60   ~ 0
SW_TIA_GAIN_3
Text Label 29350 -725 2    60   ~ 0
SW_TIA_GAIN_4
Text Label 24650 -1150 0    60   ~ 0
SW_TIA_GAIN_1
Text Label 24650 0    0    60   ~ 0
SW_TIA_GAIN_2
Text Label 24650 1050 0    60   ~ 0
SW_TIA_GAIN_3
Text Label 24650 2150 0    60   ~ 0
SW_TIA_GAIN_4
Wire Wire Line
	22750 -1150 22850 -1150
Wire Wire Line
	24550 -1150 24650 -1150
Wire Wire Line
	22750 0    22850 0   
Wire Wire Line
	24550 0    24650 0   
Wire Wire Line
	22750 1050 22850 1050
Wire Wire Line
	24550 1050 24650 1050
Wire Wire Line
	22750 2150 22850 2150
Wire Wire Line
	24550 2150 24650 2150
Wire Wire Line
	23700 1850 23700 1200
Wire Wire Line
	23700 1200 21250 1200
Connection ~ 23700 1850
Wire Wire Line
	23700 1850 24250 1850
Wire Wire Line
	23700 750  23700 150 
Wire Wire Line
	23700 150  21200 150 
Connection ~ 23700 750 
Wire Wire Line
	23700 750  24250 750 
Wire Wire Line
	23700 -300 23700 -1000
Wire Wire Line
	23700 -1000 21200 -1000
Connection ~ 23700 -300
Wire Wire Line
	23700 -300 24250 -300
Wire Wire Line
	23700 -1450 23700 -2150
Wire Wire Line
	23700 -2150 21200 -2150
Connection ~ 23700 -1450
Wire Wire Line
	23700 -1450 24250 -1450
$Comp
L Device:C C?
U 1 1 6329CA09
P 20900 -2300
F 0 "C?" V 20800 -2450 50  0000 C CNN
F 1 "56nF" V 20800 -2150 50  0000 C CNN
F 2 "" H 20938 -2450 50  0001 C CNN
F 3 "~" H 20900 -2300 50  0001 C CNN
	1    20900 -2300
	0    1    1    0   
$EndComp
Wire Wire Line
	21050 -2300 21200 -2300
Wire Wire Line
	21200 -2300 21200 -2150
Wire Wire Line
	21050 -2000 21200 -2000
Wire Wire Line
	21200 -2000 21200 -2150
Connection ~ 21200 -2150
Wire Wire Line
	20750 -2000 20600 -2000
Wire Wire Line
	20600 -2300 20600 -2150
Wire Wire Line
	20600 -2300 20750 -2300
$Comp
L Device:R R?
U 1 1 639B1B75
P 20950 1350
F 0 "R?" V 21050 1325 50  0000 C CNN
F 1 "300" V 20950 1325 50  0000 C CNN
F 2 "" V 20880 1350 50  0001 C CNN
F 3 "~" H 20950 1350 50  0001 C CNN
	1    20950 1350
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 639B2540
P 20950 1050
F 0 "C?" V 20850 900 50  0000 C CNN
F 1 "56nF" V 20850 1200 50  0000 C CNN
F 2 "" H 20988 900 50  0001 C CNN
F 3 "~" H 20950 1050 50  0001 C CNN
	1    20950 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	21100 1050 21250 1050
Wire Wire Line
	21100 1350 21250 1350
Wire Wire Line
	20800 1350 20650 1350
Wire Wire Line
	20650 1050 20650 1200
Wire Wire Line
	20650 1050 20800 1050
Wire Wire Line
	21250 1050 21250 1200
$Comp
L Device:R R?
U 1 1 63A69057
P 20900 -850
F 0 "R?" V 21000 -875 50  0000 C CNN
F 1 "30k" V 20900 -875 50  0000 C CNN
F 2 "" V 20830 -850 50  0001 C CNN
F 3 "~" H 20900 -850 50  0001 C CNN
	1    20900 -850
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 63A69731
P 20900 -1150
F 0 "C?" V 20800 -1300 50  0000 C CNN
F 1 "56nF" V 20800 -1000 50  0000 C CNN
F 2 "" H 20938 -1300 50  0001 C CNN
F 3 "~" H 20900 -1150 50  0001 C CNN
	1    20900 -1150
	0    1    1    0   
$EndComp
Wire Wire Line
	21050 -1150 21200 -1150
Wire Wire Line
	21050 -850 21200 -850
Wire Wire Line
	20750 -850 20600 -850
Wire Wire Line
	20600 -1150 20600 -1000
Wire Wire Line
	20600 -1150 20750 -1150
Wire Wire Line
	21200 -1150 21200 -1000
Connection ~ 21200 -1000
Wire Wire Line
	21200 -1000 21200 -850
$Comp
L Device:R R?
U 1 1 63B29260
P 20900 300
F 0 "R?" V 21000 275 50  0000 C CNN
F 1 "3k" V 20900 275 50  0000 C CNN
F 2 "" V 20830 300 50  0001 C CNN
F 3 "~" H 20900 300 50  0001 C CNN
	1    20900 300 
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 63B29C1A
P 20900 0
F 0 "C?" V 20800 -150 50  0000 C CNN
F 1 "56nF" V 20800 150 50  0000 C CNN
F 2 "" H 20938 -150 50  0001 C CNN
F 3 "~" H 20900 0   50  0001 C CNN
	1    20900 0   
	0    1    1    0   
$EndComp
Wire Wire Line
	21050 0    21200 0   
Wire Wire Line
	21050 300  21200 300 
Wire Wire Line
	20750 300  20600 300 
Wire Wire Line
	20600 0    20600 150 
Wire Wire Line
	20600 0    20750 0   
Wire Wire Line
	21200 0    21200 150 
Connection ~ 21200 150 
Wire Wire Line
	21200 150  21200 300 
Connection ~ 21250 1200
Wire Wire Line
	21250 1200 21250 1350
Wire Wire Line
	20250 1750 20250 1200
Wire Wire Line
	20250 1200 20650 1200
Connection ~ 20250 1750
Wire Wire Line
	20250 1750 20550 1750
Connection ~ 20650 1200
Wire Wire Line
	20650 1200 20650 1350
Wire Wire Line
	20250 1200 20250 150 
Wire Wire Line
	20250 150  20600 150 
Connection ~ 20250 1200
Connection ~ 20600 150 
Wire Wire Line
	20600 150  20600 300 
Wire Wire Line
	20250 150  20250 -1000
Wire Wire Line
	20250 -1000 20600 -1000
Connection ~ 20250 150 
Connection ~ 20600 -1000
Wire Wire Line
	20600 -1000 20600 -850
Wire Wire Line
	20250 -1000 20250 -2150
Wire Wire Line
	20250 -2150 20600 -2150
Connection ~ 20250 -1000
Connection ~ 20600 -2150
Wire Wire Line
	20600 -2150 20600 -2000
Wire Wire Line
	27750 -250 27750 0   
Wire Wire Line
	27650 -250 27650 0   
Wire Wire Line
	26725 -225 26725 25  
Wire Wire Line
	26625 -225 26625 25  
Text Label 27750 -1500 1    60   ~ 0
3V3
Wire Wire Line
	27750 -1250 27750 -1500
Text Label 27650 -1500 1    60   ~ 0
+12V
Wire Wire Line
	27650 -1250 27650 -1500
Text Label 26725 -1475 1    60   ~ 0
3V3
Wire Wire Line
	26725 -1225 26725 -1475
Text Label 26625 -1475 1    60   ~ 0
+12V
Wire Wire Line
	26625 -1225 26625 -1475
$Comp
L Analog_Switch:DG411xY U?
U 5 1 6047A1B1
P 27650 -750
F 0 "U?" H 27930 -704 50  0000 L CNN
F 1 "DG411xY" H 27930 -795 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 27650 -850 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 27650 -750 50  0001 C CNN
	5    27650 -750
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 5 1 60248F45
P 26625 -725
F 0 "U?" H 26905 -679 50  0000 L CNN
F 1 "DG411xY" H 26905 -770 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 26625 -825 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H 26625 -725 50  0001 C CNN
	5    26625 -725
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 64C04706
P 29650 2050
F 0 "U?" H 29800 1950 50  0000 L CNN
F 1 "OP07" H 29800 2150 50  0000 L CNN
F 2 "" H 29700 2100 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H 29700 2200 50  0001 C CNN
	1    29650 2050
	1    0    0    1   
$EndComp
Text Label 29550 2450 3    60   ~ 0
+12V
Wire Wire Line
	29550 2350 29550 2450
Text Label 29550 1650 1    60   ~ 0
-12V
Wire Wire Line
	29550 1750 29550 1650
NoConn ~ 29650 1750
NoConn ~ 29750 1750
$Comp
L Device:R R?
U 1 1 64C04DC4
P 28550 1950
F 0 "R?" V 28450 1950 50  0000 C CNN
F 1 "20k" V 28550 1950 50  0000 C CNN
F 2 "" V 28480 1950 50  0001 C CNN
F 3 "~" H 28550 1950 50  0001 C CNN
	1    28550 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 64C04DCE
P 28550 2350
F 0 "R?" V 28450 2350 50  0000 C CNN
F 1 "12k" V 28550 2350 50  0000 C CNN
F 2 "" V 28480 2350 50  0001 C CNN
F 3 "~" H 28550 2350 50  0001 C CNN
	1    28550 2350
	0    1    -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 64C04DD8
P 29700 1300
F 0 "R?" V 29600 1300 50  0000 C CNN
F 1 "12k" V 29700 1300 50  0000 C CNN
F 2 "" V 29630 1300 50  0001 C CNN
F 3 "~" H 29700 1300 50  0001 C CNN
	1    29700 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	30250 2050 29950 2050
Wire Wire Line
	29350 2150 29150 2150
Wire Wire Line
	29150 2150 29150 2450
Text Label 29150 2450 3    60   ~ 0
AGND
Wire Wire Line
	28900 2350 28900 1950
Wire Wire Line
	28700 2350 28900 2350
Wire Wire Line
	28400 2350 28200 2350
Text Label 28200 2350 2    60   ~ 0
REF_NEG_0V6
Connection ~ 28900 1950
Wire Wire Line
	28700 1950 28900 1950
Wire Wire Line
	28900 1950 29150 1950
Wire Wire Line
	29850 1300 30250 1300
Wire Wire Line
	30250 1300 30250 2050
Wire Wire Line
	29550 1300 29150 1300
Wire Wire Line
	29150 1300 29150 1950
Connection ~ 29150 1950
Wire Wire Line
	29150 1950 29350 1950
$Comp
L potentiostat-rescue:BAS07-04 D?
U 1 1 64C04DF4
P 31250 1650
F 0 "D?" H 31350 1550 40  0000 C CNN
F 1 "BAS07-04" H 31250 1750 40  0000 C CNN
F 2 "~" H 31250 1650 60  0000 C CNN
F 3 "~" H 31250 1650 60  0000 C CNN
	1    31250 1650
	1    0    0    -1  
$EndComp
Text Label 30600 1650 2    60   ~ 0
AGND
Text Label 31850 1650 0    60   ~ 0
3V3
$Comp
L Device:R R?
U 1 1 64C04E01
P 30900 2050
F 0 "R?" V 30800 2050 50  0000 C CNN
F 1 "1k" V 30900 2050 50  0000 C CNN
F 2 "" V 30830 2050 50  0001 C CNN
F 3 "~" H 30900 2050 50  0001 C CNN
	1    30900 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 64C04E0B
P 31600 2050
F 0 "R?" V 31500 2050 50  0000 C CNN
F 1 "100" V 31600 2050 50  0000 C CNN
F 2 "" V 31530 2050 50  0001 C CNN
F 3 "~" H 31600 2050 50  0001 C CNN
	1    31600 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	31750 2050 32000 2050
Wire Wire Line
	31050 2050 31250 2050
Wire Wire Line
	31250 1850 31250 2050
Connection ~ 31250 2050
Wire Wire Line
	31250 2050 31450 2050
Wire Wire Line
	31650 1650 31850 1650
Wire Wire Line
	30850 1650 30600 1650
Wire Wire Line
	30250 2050 30750 2050
Connection ~ 30250 2050
Wire Wire Line
	27925 1700 27925 1950
Wire Wire Line
	27925 1950 28400 1950
$Comp
L Amplifier_Operational:OP07 U?
U 1 1 652B528B
P 26825 1950
F 0 "U?" H 26975 1850 50  0000 L CNN
F 1 "OP07" H 26975 2050 50  0000 L CNN
F 2 "" H 26875 2000 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/OP07.pdf" H 26875 2100 50  0001 C CNN
	1    26825 1950
	1    0    0    1   
$EndComp
Text Label 26725 2350 3    60   ~ 0
+12V
Wire Wire Line
	26725 2250 26725 2350
Text Label 26725 1550 1    60   ~ 0
-12V
Wire Wire Line
	26725 1650 26725 1550
NoConn ~ 26825 1650
NoConn ~ 26925 1650
$Comp
L Device:R R?
U 1 1 652B5D05
P 25900 1850
F 0 "R?" V 25800 1850 50  0000 C CNN
F 1 "10k" V 25900 1850 50  0000 C CNN
F 2 "" V 25830 1850 50  0001 C CNN
F 3 "~" H 25900 1850 50  0001 C CNN
	1    25900 1850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 652B5D19
P 26875 1200
F 0 "R?" V 26775 1200 50  0000 C CNN
F 1 "20k" V 26875 1200 50  0000 C CNN
F 2 "" V 26805 1200 50  0001 C CNN
F 3 "~" H 26875 1200 50  0001 C CNN
	1    26875 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	27425 1950 27125 1950
Wire Wire Line
	26525 2050 26325 2050
Wire Wire Line
	26325 2050 26325 2350
Text Label 26325 2350 3    60   ~ 0
AGND
Wire Wire Line
	27025 1200 27425 1200
Wire Wire Line
	27425 1200 27425 1950
Wire Wire Line
	26725 1200 26325 1200
Wire Wire Line
	26325 1850 26525 1850
Wire Wire Line
	27425 1950 27925 1950
Connection ~ 27425 1950
Wire Wire Line
	26050 1850 26325 1850
Connection ~ 26325 1850
Wire Wire Line
	25350 1850 25750 1850
Connection ~ 25350 1850
Connection ~ 27925 1950
Text Label 32000 2050 0    60   ~ 0
TIA_OUT_UNI
Wire Wire Line
	19850 8200 20175 8200
Wire Wire Line
	20175 8200 20175 8575
Wire Wire Line
	20175 12100 20725 12100
Connection ~ 20175 8200
Wire Wire Line
	20175 8200 20500 8200
Wire Wire Line
	20175 8575 20500 8575
Connection ~ 20175 8575
Wire Wire Line
	20175 8575 20175 12100
Text Label 22550 12000 0    60   ~ 0
REF_ELECT_BIP
Wire Wire Line
	23325 11150 23325 12200
Wire Wire Line
	22550 12000 22550 12200
Connection ~ 22550 12200
Wire Wire Line
	22550 12200 22075 12200
Text Notes 18125 8625 0    60   ~ 0
Uniy Gain Buffer for Reference Electrode 
Text Notes 21800 8050 0    60   ~ 0
Control Amplifier
Text Notes 21300 13150 0    60   ~ 0
scale buffered reference electrode voltage\n according to gain setting
Text Notes 26625 2700 0    60   ~ 0
scale TIA signal by 2x
Text Notes 29650 2700 0    60   ~ 0
shift TIA signal to 0-1.2V range
Text Notes 26850 -50  0    60   ~ 0
switch power\nLCSC#: C17218
Text Notes 30275 50   0    60   ~ 0
gain select demux\nLCSC#: C5602	
Text Notes -10025 8875 0    60   ~ 0
Shift and scales unipolar DAC (DAC_UNI) from [0V,1.2V] \nrange to bipolar DAC (DAC_BIP) in [-1V,1V]  range. \n 
Text Notes -7050 8800 0    60   ~ 0
Scale bipolar DAC (DAC_BIP) by gain N=1,2,5, or 10  to get DAC_BIP_NX. \nGain is selected using DAC_GAIN_A0 and DAC_GAIN_A1
Text Notes 21375 2875 0    60   ~ 0
transimpedance amplifier with selectable gain using kelvin switching\nsee http://www.analog.com/library/analogdialogue/archives/47-05/pgtia.html\n\nSet gains so that output voltage range is -0.6V to 0.6V. \nInput current ranges (+/-)  1uA, 10uA, 100uA, 1000uA \n
$Comp
L Analog_Switch:DG411xY U?
U 1 1 673EBC01
P -6400 13600
F 0 "U?" H -6400 13867 50  0000 C CNN
F 1 "DG411xY" H -6400 13776 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -6400 13500 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -6400 13600 50  0001 C CNN
	1    -6400 13600
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 2 1 673ECCF8
P -6400 14550
F 0 "U?" H -6400 14817 50  0000 C CNN
F 1 "DG411xY" H -6400 14726 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -6400 14450 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -6400 14550 50  0001 C CNN
	2    -6400 14550
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 3 1 673EE4BC
P -6400 15550
F 0 "U?" H -6400 15817 50  0000 C CNN
F 1 "DG411xY" H -6400 15726 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -6400 15450 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -6400 15550 50  0001 C CNN
	3    -6400 15550
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 4 1 673F02F3
P -8700 15550
F 0 "U?" H -8700 15817 50  0000 C CNN
F 1 "DG411xY" H -8700 15726 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -8700 15450 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -8700 15550 50  0001 C CNN
	4    -8700 15550
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:DG411xY U?
U 5 1 673F1894
P -8700 14100
F 0 "U?" H -8420 14146 50  0000 L CNN
F 1 "DG411xY" H -8420 14055 50  0000 L CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H -8700 14000 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/DG411-DG413.pdf" H -8700 14100 50  0001 C CNN
	5    -8700 14100
	1    0    0    -1  
$EndComp
Wire Wire Line
	-8700 13600 -8700 13350
Text Label -8700 13350 1    60   ~ 0
+12V
Wire Wire Line
	-8600 13600 -8600 13350
Text Label -8600 13350 1    60   ~ 0
3V3
Wire Wire Line
	-8700 14600 -8700 14850
Wire Wire Line
	-8600 14600 -8600 14850
Text Label -8700 14850 3    60   ~ 0
AGND
Text Label -8600 14850 3    60   ~ 0
-12V
Text Label -7000 13600 2    60   ~ 0
CTR_ELECT
Text Label -6800 13950 2    60   ~ 0
SW_CTR_ELECT
Wire Wire Line
	-7000 13600 -6700 13600
Wire Wire Line
	-6800 13950 -6400 13950
Wire Wire Line
	-6400 13950 -6400 13800
Text Label -6100 13600 0    60   ~ 0
CTR_ELECT_OUT
Text Label -7000 14550 2    60   ~ 0
REF_ELECT
Wire Wire Line
	-7000 14550 -6700 14550
Text Label -6800 14900 2    60   ~ 0
SW_REF_ELECT
Wire Wire Line
	-6800 14900 -6400 14900
Wire Wire Line
	-6400 14900 -6400 14750
Text Label -6100 14550 0    60   ~ 0
REF_ELECT_OUT
Text Label -7000 15550 2    50   ~ 0
WRK_ELECT
Wire Wire Line
	-7000 15550 -6700 15550
Text Label -6800 15900 2    50   ~ 0
SW_WRK_ELECT
Wire Wire Line
	-6800 15900 -6400 15900
Wire Wire Line
	-6400 15900 -6400 15750
Text Label -6050 15550 0    60   ~ 0
WRK_ELECT_OUT
$Comp
L Connector_Generic:Conn_01x02 P1
U 1 1 602750A0
P -3350 13600
F 0 "P1" H -3270 13592 50  0000 L CNN
F 1 "Conn_01x02" H -3270 13501 50  0000 L CNN
F 2 "" H -3350 13600 50  0001 C CNN
F 3 "~" H -3350 13600 50  0001 C CNN
	1    -3350 13600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P2
U 1 1 602785EF
P -3350 14550
F 0 "P2" H -3270 14542 50  0000 L CNN
F 1 "Conn_01x02" H -3270 14451 50  0000 L CNN
F 2 "" H -3350 14550 50  0001 C CNN
F 3 "~" H -3350 14550 50  0001 C CNN
	1    -3350 14550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P3
U 1 1 6027A208
P -3350 15550
F 0 "P3" H -3270 15542 50  0000 L CNN
F 1 "Conn_01x02" H -3270 15451 50  0000 L CNN
F 2 "" H -3350 15550 50  0001 C CNN
F 3 "~" H -3350 15550 50  0001 C CNN
	1    -3350 15550
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3550 13700 -3750 13700
Wire Wire Line
	-3550 14650 -3750 14650
Wire Wire Line
	-3550 15650 -3750 15650
Text Label -3750 13700 2    60   ~ 0
AGND
Text Label -3750 14650 2    60   ~ 0
AGND
Text Label -3750 15650 2    60   ~ 0
AGND
$Comp
L Connector_Generic:Conn_01x03 K1
U 1 1 60AEF633
P -3350 16525
F 0 "K1" H -3270 16567 50  0000 L CNN
F 1 "Conn_01x03" H -3270 16476 50  0000 L CNN
F 2 "" H -3350 16525 50  0001 C CNN
F 3 "~" H -3350 16525 50  0001 C CNN
	1    -3350 16525
	1    0    0    -1  
$EndComp
NoConn ~ -9000 15550
NoConn ~ -8700 15750
NoConn ~ -8400 15550
Wire Wire Line
	-9900 7400 -9650 7400
$Comp
L Device:C C?
U 1 1 624F35D8
P -8650 6400
F 0 "C?" V -8750 6300 50  0000 C CNN
F 1 "3.3nF" V -8750 6550 50  0000 C CNN
F 2 "" H -8612 6250 50  0001 C CNN
F 3 "~" H -8650 6400 50  0001 C CNN
	1    -8650 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	-8500 6400 -8100 6400
Wire Wire Line
	-8100 6400 -8100 6750
Connection ~ -8100 6750
Wire Wire Line
	-8800 6400 -9100 6400
Wire Wire Line
	-9100 6400 -9100 6750
Connection ~ -9100 6750
$Comp
L Device:C C?
U 1 1 627C2704
P 29700 975
F 0 "C?" V 29600 850 50  0000 C CNN
F 1 "12nF" V 29600 1125 50  0000 C CNN
F 2 "" H 29738 825 50  0001 C CNN
F 3 "~" H 29700 975 50  0001 C CNN
	1    29700 975 
	0    1    1    0   
$EndComp
Wire Wire Line
	29550 975  29150 975 
Wire Wire Line
	29150 975  29150 1300
Wire Wire Line
	29850 975  30250 975 
Wire Wire Line
	30250 975  30250 1300
Connection ~ 29150 1300
Connection ~ 30250 1300
Wire Wire Line
	-6100 13600 -4750 13600
Wire Wire Line
	-6100 14550 -4850 14550
Wire Wire Line
	-6100 15550 -4950 15550
Wire Wire Line
	-4750 13600 -4750 16425
Connection ~ -4750 13600
Wire Wire Line
	-4750 13600 -3550 13600
Wire Wire Line
	-4850 14550 -4850 16525
Connection ~ -4850 14550
Wire Wire Line
	-4850 14550 -3550 14550
Wire Wire Line
	-4950 16625 -4950 15550
Connection ~ -4950 15550
Wire Wire Line
	-4950 15550 -3550 15550
Wire Wire Line
	-4750 16425 -3550 16425
Wire Wire Line
	-4850 16525 -3550 16525
Wire Wire Line
	-4950 16625 -3550 16625
$Comp
L Device:C C?
U 1 1 602AD77A
P -7850 5100
F 0 "C?" H -7735 5146 50  0000 L CNN
F 1 "0.1uF" H -7735 5055 50  0000 L CNN
F 2 "" H -7812 4950 50  0001 C CNN
F 3 "~" H -7850 5100 50  0001 C CNN
	1    -7850 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 602AF3D6
P -9325 5100
F 0 "C?" H -9210 5146 50  0000 L CNN
F 1 "0.1uF" H -9210 5055 50  0000 L CNN
F 2 "" H -9287 4950 50  0001 C CNN
F 3 "~" H -9325 5100 50  0001 C CNN
	1    -9325 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 602B0539
P -8825 5100
F 0 "C?" H -8710 5146 50  0000 L CNN
F 1 "0.1uF" H -8710 5055 50  0000 L CNN
F 2 "" H -8787 4950 50  0001 C CNN
F 3 "~" H -8825 5100 50  0001 C CNN
	1    -8825 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 602B170F
P -8325 5100
F 0 "C?" H -8210 5146 50  0000 L CNN
F 1 "0.1uF" H -8210 5055 50  0000 L CNN
F 2 "" H -8287 4950 50  0001 C CNN
F 3 "~" H -8325 5100 50  0001 C CNN
	1    -8325 5100
	1    0    0    -1  
$EndComp
Text Label -8825 4800 1    60   ~ 0
-12V
Text Label -9325 4800 1    60   ~ 0
-12V
Wire Wire Line
	-8825 5250 -8825 5450
Text Label -8825 5450 3    60   ~ 0
AGND
Wire Wire Line
	-9325 5250 -9325 5450
Text Label -9325 5450 3    60   ~ 0
AGND
Wire Wire Line
	-7850 5250 -7850 5450
Text Label -7850 5450 3    60   ~ 0
AGND
Wire Wire Line
	-8325 5250 -8325 5450
Text Label -8325 5450 3    60   ~ 0
AGND
Wire Wire Line
	-9325 4800 -9325 4950
Wire Wire Line
	-8825 4800 -8825 4950
Text Label -7850 4800 1    60   ~ 0
+12V
Text Label -8325 4800 1    60   ~ 0
+12V
Wire Wire Line
	-8325 4800 -8325 4950
Wire Wire Line
	-7850 4800 -7850 4950
Text Notes -9000 5900 0    60   ~ 0
op amp decoupling
$Comp
L Device:C C?
U 1 1 61A9EADC
P -10325 11025
F 0 "C?" H -10210 11071 50  0000 L CNN
F 1 "0.1uF" H -10210 10980 50  0000 L CNN
F 2 "" H -10287 10875 50  0001 C CNN
F 3 "~" H -10325 11025 50  0001 C CNN
	1    -10325 11025
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A9F54E
P -11800 11025
F 0 "C?" H -11685 11071 50  0000 L CNN
F 1 "0.1uF" H -11685 10980 50  0000 L CNN
F 2 "" H -11762 10875 50  0001 C CNN
F 3 "~" H -11800 11025 50  0001 C CNN
	1    -11800 11025
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A9F558
P -11300 11025
F 0 "C?" H -11185 11071 50  0000 L CNN
F 1 "0.1uF" H -11185 10980 50  0000 L CNN
F 2 "" H -11262 10875 50  0001 C CNN
F 3 "~" H -11300 11025 50  0001 C CNN
	1    -11300 11025
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61A9F562
P -10800 11025
F 0 "C?" H -10685 11071 50  0000 L CNN
F 1 "0.1uF" H -10685 10980 50  0000 L CNN
F 2 "" H -10762 10875 50  0001 C CNN
F 3 "~" H -10800 11025 50  0001 C CNN
	1    -10800 11025
	1    0    0    -1  
$EndComp
Text Label -11300 10725 1    60   ~ 0
-12V
Text Label -11800 10725 1    60   ~ 0
-12V
Wire Wire Line
	-11300 11175 -11300 11375
Text Label -11300 11375 3    60   ~ 0
AGND
Wire Wire Line
	-11800 11175 -11800 11375
Text Label -11800 11375 3    60   ~ 0
AGND
Wire Wire Line
	-10325 11175 -10325 11375
Text Label -10325 11375 3    60   ~ 0
AGND
Wire Wire Line
	-10800 11175 -10800 11375
Text Label -10800 11375 3    60   ~ 0
AGND
Wire Wire Line
	-11800 10725 -11800 10875
Wire Wire Line
	-11300 10725 -11300 10875
Text Label -10325 10725 1    60   ~ 0
+12V
Text Label -10800 10725 1    60   ~ 0
+12V
Wire Wire Line
	-10800 10725 -10800 10875
Wire Wire Line
	-10325 10725 -10325 10875
Text Notes -11675 11800 0    60   ~ 0
op amp decoupling 
$Comp
L Device:C C?
U 1 1 62178F03
P 20200 14500
F 0 "C?" H 20315 14546 50  0000 L CNN
F 1 "0.1uF" H 20315 14455 50  0000 L CNN
F 2 "" H 20238 14350 50  0001 C CNN
F 3 "~" H 20200 14500 50  0001 C CNN
	1    20200 14500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62179A59
P 18725 14500
F 0 "C?" H 18840 14546 50  0000 L CNN
F 1 "0.1uF" H 18840 14455 50  0000 L CNN
F 2 "" H 18763 14350 50  0001 C CNN
F 3 "~" H 18725 14500 50  0001 C CNN
	1    18725 14500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62179A63
P 19225 14500
F 0 "C?" H 19340 14546 50  0000 L CNN
F 1 "0.1uF" H 19340 14455 50  0000 L CNN
F 2 "" H 19263 14350 50  0001 C CNN
F 3 "~" H 19225 14500 50  0001 C CNN
	1    19225 14500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 62179A6D
P 19725 14500
F 0 "C?" H 19840 14546 50  0000 L CNN
F 1 "0.1uF" H 19840 14455 50  0000 L CNN
F 2 "" H 19763 14350 50  0001 C CNN
F 3 "~" H 19725 14500 50  0001 C CNN
	1    19725 14500
	1    0    0    -1  
$EndComp
Text Label 19225 14200 1    60   ~ 0
-12V
Text Label 18725 14200 1    60   ~ 0
-12V
Wire Wire Line
	19225 14650 19225 14850
Text Label 19225 14850 3    60   ~ 0
AGND
Wire Wire Line
	18725 14650 18725 14850
Text Label 18725 14850 3    60   ~ 0
AGND
Wire Wire Line
	20200 14650 20200 14850
Text Label 20200 14850 3    60   ~ 0
AGND
Wire Wire Line
	19725 14650 19725 14850
Text Label 19725 14850 3    60   ~ 0
AGND
Wire Wire Line
	18725 14200 18725 14350
Wire Wire Line
	19225 14200 19225 14350
Text Label 20200 14200 1    60   ~ 0
+12V
Text Label 19725 14200 1    60   ~ 0
+12V
Wire Wire Line
	19725 14200 19725 14350
Wire Wire Line
	20200 14200 20200 14350
Text Notes 18925 15275 0    60   ~ 0
op amp decoupling 
$Comp
L Device:C C?
U 1 1 6228B7B7
P 18225 14500
F 0 "C?" H 18340 14546 50  0000 L CNN
F 1 "0.1uF" H 18340 14455 50  0000 L CNN
F 2 "" H 18263 14350 50  0001 C CNN
F 3 "~" H 18225 14500 50  0001 C CNN
	1    18225 14500
	1    0    0    -1  
$EndComp
Text Label 18225 14200 1    60   ~ 0
-12V
Wire Wire Line
	18225 14650 18225 14850
Text Label 18225 14850 3    60   ~ 0
AGND
Wire Wire Line
	18225 14200 18225 14350
$Comp
L Device:C C?
U 1 1 62379FAB
P 20725 14500
F 0 "C?" H 20840 14546 50  0000 L CNN
F 1 "0.1uF" H 20840 14455 50  0000 L CNN
F 2 "" H 20763 14350 50  0001 C CNN
F 3 "~" H 20725 14500 50  0001 C CNN
	1    20725 14500
	1    0    0    -1  
$EndComp
Wire Wire Line
	20725 14650 20725 14850
Text Label 20725 14850 3    60   ~ 0
AGND
Text Label 20725 14200 1    60   ~ 0
+12V
Wire Wire Line
	20725 14200 20725 14350
$Comp
L Device:C C?
U 1 1 6247A1ED
P 22375 4050
F 0 "C?" H 22490 4096 50  0000 L CNN
F 1 "0.1uF" H 22490 4005 50  0000 L CNN
F 2 "" H 22413 3900 50  0001 C CNN
F 3 "~" H 22375 4050 50  0001 C CNN
	1    22375 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6247AB25
P 20900 4050
F 0 "C?" H 21015 4096 50  0000 L CNN
F 1 "0.1uF" H 21015 4005 50  0000 L CNN
F 2 "" H 20938 3900 50  0001 C CNN
F 3 "~" H 20900 4050 50  0001 C CNN
	1    20900 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6247AB2F
P 21400 4050
F 0 "C?" H 21515 4096 50  0000 L CNN
F 1 "0.1uF" H 21515 4005 50  0000 L CNN
F 2 "" H 21438 3900 50  0001 C CNN
F 3 "~" H 21400 4050 50  0001 C CNN
	1    21400 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6247AB39
P 21900 4050
F 0 "C?" H 22015 4096 50  0000 L CNN
F 1 "0.1uF" H 22015 4005 50  0000 L CNN
F 2 "" H 21938 3900 50  0001 C CNN
F 3 "~" H 21900 4050 50  0001 C CNN
	1    21900 4050
	1    0    0    -1  
$EndComp
Text Label 21400 3750 1    60   ~ 0
-12V
Text Label 20900 3750 1    60   ~ 0
-12V
Wire Wire Line
	21400 4200 21400 4400
Text Label 21400 4400 3    60   ~ 0
AGND
Wire Wire Line
	20900 4200 20900 4400
Text Label 20900 4400 3    60   ~ 0
AGND
Wire Wire Line
	22375 4200 22375 4400
Text Label 22375 4400 3    60   ~ 0
AGND
Wire Wire Line
	21900 4200 21900 4400
Text Label 21900 4400 3    60   ~ 0
AGND
Wire Wire Line
	20900 3750 20900 3900
Wire Wire Line
	21400 3750 21400 3900
Text Label 22375 3750 1    60   ~ 0
+12V
Text Label 21900 3750 1    60   ~ 0
+12V
Wire Wire Line
	21900 3750 21900 3900
Wire Wire Line
	22375 3750 22375 3900
Text Notes 21050 4850 0    60   ~ 0
op amp decoupling
$Comp
L Device:C C?
U 1 1 625CDE67
P 19550 4000
F 0 "C?" H 19665 4046 50  0000 L CNN
F 1 "0.1uF" H 19665 3955 50  0000 L CNN
F 2 "" H 19588 3850 50  0001 C CNN
F 3 "~" H 19550 4000 50  0001 C CNN
	1    19550 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 625CEAB5
P 20050 4000
F 0 "C?" H 20165 4046 50  0000 L CNN
F 1 "0.1uF" H 20165 3955 50  0000 L CNN
F 2 "" H 20088 3850 50  0001 C CNN
F 3 "~" H 20050 4000 50  0001 C CNN
	1    20050 4000
	1    0    0    -1  
$EndComp
Text Label 19550 3700 1    60   ~ 0
-12V
Wire Wire Line
	19550 4150 19550 4350
Text Label 19550 4350 3    60   ~ 0
AGND
Wire Wire Line
	20050 4150 20050 4350
Text Label 20050 4350 3    60   ~ 0
AGND
Wire Wire Line
	19550 3700 19550 3850
Text Label 20050 3700 1    60   ~ 0
+12V
Wire Wire Line
	20050 3700 20050 3850
Text Notes 19350 4850 0    60   ~ 0
op amp decoupling 
$Comp
L Device:C C?
U 1 1 602B098B
P -10950 1025
F 0 "C?" H -10835 1071 50  0000 L CNN
F 1 "0.1uF" H -10835 980 50  0000 L CNN
F 2 "" H -10912 875 50  0001 C CNN
F 3 "~" H -10950 1025 50  0001 C CNN
	1    -10950 1025
	1    0    0    -1  
$EndComp
Text Label -10950 725  1    60   ~ 0
3V3
Wire Wire Line
	-10950 1175 -10950 1375
Text Label -10950 1375 3    60   ~ 0
GND
Wire Wire Line
	-10950 725  -10950 875 
$Comp
L Device:C C?
U 1 1 604A9AAB
P 24750 14550
F 0 "C?" H 24865 14596 50  0000 L CNN
F 1 "0.1uF" H 24865 14505 50  0000 L CNN
F 2 "" H 24788 14400 50  0001 C CNN
F 3 "~" H 24750 14550 50  0001 C CNN
	1    24750 14550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 604AA16D
P 25250 14550
F 0 "C?" H 25365 14596 50  0000 L CNN
F 1 "1uF" H 25365 14505 50  0000 L CNN
F 2 "" H 25288 14400 50  0001 C CNN
F 3 "~" H 25250 14550 50  0001 C CNN
	1    25250 14550
	1    0    0    -1  
$EndComp
Text Label 25250 14250 1    60   ~ 0
3V3
Text Label 24750 14250 1    60   ~ 0
3V3
Wire Wire Line
	25250 14700 25250 14900
Text Label 25250 14900 3    60   ~ 0
GND
Wire Wire Line
	24750 14700 24750 14900
Text Label 24750 14900 3    60   ~ 0
GND
Wire Wire Line
	24750 14250 24750 14400
Wire Wire Line
	25250 14250 25250 14400
$Comp
L Device:C C?
U 1 1 605E8CC1
P 25550 4050
F 0 "C?" H 25665 4096 50  0000 L CNN
F 1 "0.1uF" H 25665 4005 50  0000 L CNN
F 2 "" H 25588 3900 50  0001 C CNN
F 3 "~" H 25550 4050 50  0001 C CNN
	1    25550 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 605E95B1
P 26050 4050
F 0 "C?" H 26165 4096 50  0000 L CNN
F 1 "1uF" H 26165 4005 50  0000 L CNN
F 2 "" H 26088 3900 50  0001 C CNN
F 3 "~" H 26050 4050 50  0001 C CNN
	1    26050 4050
	1    0    0    -1  
$EndComp
Text Label 26050 3750 1    60   ~ 0
3V3
Text Label 25550 3750 1    60   ~ 0
3V3
Wire Wire Line
	26050 4200 26050 4400
Text Label 26050 4400 3    60   ~ 0
GND
Wire Wire Line
	25550 4200 25550 4400
Text Label 25550 4400 3    60   ~ 0
GND
Wire Wire Line
	25550 3750 25550 3900
Wire Wire Line
	26050 3750 26050 3900
$Comp
L Device:C C?
U 1 1 6081D3D7
P -8400 1000
F 0 "C?" H -8285 1046 50  0000 L CNN
F 1 "0.1uF" H -8285 955 50  0000 L CNN
F 2 "" H -8362 850 50  0001 C CNN
F 3 "~" H -8400 1000 50  0001 C CNN
	1    -8400 1000
	1    0    0    -1  
$EndComp
Text Label -8400 700  1    60   ~ 0
3V3
Wire Wire Line
	-8400 1150 -8400 1350
Text Label -8400 1350 3    60   ~ 0
GND
Wire Wire Line
	-8400 700  -8400 850 
$Comp
L Device:C C?
U 1 1 60A146B7
P -9450 1000
F 0 "C?" H -9335 1046 50  0000 L CNN
F 1 "0.1uF" H -9335 955 50  0000 L CNN
F 2 "" H -9412 850 50  0001 C CNN
F 3 "~" H -9450 1000 50  0001 C CNN
	1    -9450 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60A14F1F
P -8950 1000
F 0 "C?" H -8835 1046 50  0000 L CNN
F 1 "0.1uF" H -8835 955 50  0000 L CNN
F 2 "" H -8912 850 50  0001 C CNN
F 3 "~" H -8950 1000 50  0001 C CNN
	1    -8950 1000
	1    0    0    -1  
$EndComp
Text Label -9450 700  1    60   ~ 0
-12V
Wire Wire Line
	-9450 1150 -9450 1350
Text Label -9450 1350 3    60   ~ 0
AGND
Wire Wire Line
	-8950 1150 -8950 1350
Text Label -8950 1350 3    60   ~ 0
AGND
Wire Wire Line
	-9450 700  -9450 850 
Text Label -8950 700  1    60   ~ 0
+12V
Wire Wire Line
	-8950 700  -8950 850 
$Comp
L Device:C C?
U 1 1 60D15115
P -9800 14125
F 0 "C?" H -9685 14171 50  0000 L CNN
F 1 "0.1uF" H -9685 14080 50  0000 L CNN
F 2 "" H -9762 13975 50  0001 C CNN
F 3 "~" H -9800 14125 50  0001 C CNN
	1    -9800 14125
	1    0    0    -1  
$EndComp
Text Label -9800 13825 1    60   ~ 0
3V3
Wire Wire Line
	-9800 14275 -9800 14475
Text Label -9800 14475 3    60   ~ 0
GND
Wire Wire Line
	-9800 13825 -9800 13975
$Comp
L Device:C C?
U 1 1 60D1581B
P -10850 14125
F 0 "C?" H -10735 14171 50  0000 L CNN
F 1 "0.1uF" H -10735 14080 50  0000 L CNN
F 2 "" H -10812 13975 50  0001 C CNN
F 3 "~" H -10850 14125 50  0001 C CNN
	1    -10850 14125
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60D15825
P -10350 14125
F 0 "C?" H -10235 14171 50  0000 L CNN
F 1 "0.1uF" H -10235 14080 50  0000 L CNN
F 2 "" H -10312 13975 50  0001 C CNN
F 3 "~" H -10350 14125 50  0001 C CNN
	1    -10350 14125
	1    0    0    -1  
$EndComp
Text Label -10850 13825 1    60   ~ 0
-12V
Wire Wire Line
	-10850 14275 -10850 14475
Text Label -10850 14475 3    60   ~ 0
AGND
Wire Wire Line
	-10350 14275 -10350 14475
Text Label -10350 14475 3    60   ~ 0
AGND
Wire Wire Line
	-10850 13825 -10850 13975
Text Label -10350 13825 1    60   ~ 0
+12V
Wire Wire Line
	-10350 13825 -10350 13975
$Comp
L Device:C C?
U 1 1 60E4EBEA
P 23400 14550
F 0 "C?" H 23515 14596 50  0000 L CNN
F 1 "0.1uF" H 23515 14505 50  0000 L CNN
F 2 "" H 23438 14400 50  0001 C CNN
F 3 "~" H 23400 14550 50  0001 C CNN
	1    23400 14550
	1    0    0    -1  
$EndComp
Text Label 23400 14250 1    60   ~ 0
3V3
Wire Wire Line
	23400 14700 23400 14900
Text Label 23400 14900 3    60   ~ 0
GND
Wire Wire Line
	23400 14250 23400 14400
$Comp
L Device:C C?
U 1 1 60E50872
P 22350 14550
F 0 "C?" H 22465 14596 50  0000 L CNN
F 1 "0.1uF" H 22465 14505 50  0000 L CNN
F 2 "" H 22388 14400 50  0001 C CNN
F 3 "~" H 22350 14550 50  0001 C CNN
	1    22350 14550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60E5087C
P 22850 14550
F 0 "C?" H 22965 14596 50  0000 L CNN
F 1 "0.1uF" H 22965 14505 50  0000 L CNN
F 2 "" H 22888 14400 50  0001 C CNN
F 3 "~" H 22850 14550 50  0001 C CNN
	1    22850 14550
	1    0    0    -1  
$EndComp
Text Label 22350 14250 1    60   ~ 0
-12V
Wire Wire Line
	22350 14700 22350 14900
Text Label 22350 14900 3    60   ~ 0
AGND
Wire Wire Line
	22850 14700 22850 14900
Text Label 22850 14900 3    60   ~ 0
AGND
Wire Wire Line
	22350 14250 22350 14400
Text Label 22850 14250 1    60   ~ 0
+12V
Wire Wire Line
	22850 14250 22850 14400
Text Notes 22400 15325 0    60   ~ 0
switch decoupling 
Text Notes 25375 4850 0    50   ~ 0
demux decoupling capacitors
Wire Wire Line
	26325 1825 26325 1850
Wire Wire Line
	26325 1200 26325 1850
$Comp
L Device:C C?
U 1 1 6155FBBB
P 24400 4050
F 0 "C?" H 24515 4096 50  0000 L CNN
F 1 "0.1uF" H 24515 4005 50  0000 L CNN
F 2 "" H 24438 3900 50  0001 C CNN
F 3 "~" H 24400 4050 50  0001 C CNN
	1    24400 4050
	1    0    0    -1  
$EndComp
Text Label 24400 3750 1    60   ~ 0
3V3
Wire Wire Line
	24400 4200 24400 4400
Text Label 24400 4400 3    60   ~ 0
GND
Wire Wire Line
	24400 3750 24400 3900
$Comp
L Device:C C?
U 1 1 61560351
P 23350 4050
F 0 "C?" H 23465 4096 50  0000 L CNN
F 1 "0.1uF" H 23465 4005 50  0000 L CNN
F 2 "" H 23388 3900 50  0001 C CNN
F 3 "~" H 23350 4050 50  0001 C CNN
	1    23350 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6156035B
P 23850 4050
F 0 "C?" H 23965 4096 50  0000 L CNN
F 1 "0.1uF" H 23965 4005 50  0000 L CNN
F 2 "" H 23888 3900 50  0001 C CNN
F 3 "~" H 23850 4050 50  0001 C CNN
	1    23850 4050
	1    0    0    -1  
$EndComp
Text Label 23350 3750 1    60   ~ 0
-12V
Wire Wire Line
	23350 4200 23350 4400
Text Label 23350 4400 3    60   ~ 0
AGND
Wire Wire Line
	23850 4200 23850 4400
Text Label 23850 4400 3    60   ~ 0
AGND
Wire Wire Line
	23350 3750 23350 3900
Text Label 23850 3750 1    60   ~ 0
+12V
Wire Wire Line
	23850 3750 23850 3900
Text Notes 23450 4850 0    60   ~ 0
switch decoupling
$Comp
L Device:C C?
U 1 1 61C14C4B
P 5975 1875
F 0 "C?" H 6090 1921 50  0000 L CNN
F 1 "2.2uF" H 6090 1830 50  0000 L CNN
F 2 "" H 6013 1725 50  0001 C CNN
F 3 "~" H 5975 1875 50  0001 C CNN
	1    5975 1875
	1    0    0    -1  
$EndComp
Text Label 5975 1575 1    60   ~ 0
3V3
Wire Wire Line
	5975 2025 5975 2225
Text Label 5975 2225 3    60   ~ 0
GND
Wire Wire Line
	5975 1575 5975 1725
$Comp
L Device:C C?
U 1 1 61D1D9C4
P 5425 1875
F 0 "C?" H 5540 1921 50  0000 L CNN
F 1 "2.2uF" H 5540 1830 50  0000 L CNN
F 2 "" H 5463 1725 50  0001 C CNN
F 3 "~" H 5425 1875 50  0001 C CNN
	1    5425 1875
	1    0    0    -1  
$EndComp
Text Label 5425 1575 1    60   ~ 0
3V3
Wire Wire Line
	5425 2025 5425 2225
Text Label 5425 2225 3    60   ~ 0
GND
Wire Wire Line
	5425 1575 5425 1725
$Comp
L Device:C C?
U 1 1 61F4F7EA
P 5075 18400
F 0 "C?" H 5190 18446 50  0000 L CNN
F 1 "1uF" H 5190 18355 50  0000 L CNN
F 2 "" H 5113 18250 50  0001 C CNN
F 3 "~" H 5075 18400 50  0001 C CNN
	1    5075 18400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61F4FEF4
P 5575 18400
F 0 "C?" H 5690 18446 50  0000 L CNN
F 1 "1uF" H 5690 18355 50  0000 L CNN
F 2 "" H 5613 18250 50  0001 C CNN
F 3 "~" H 5575 18400 50  0001 C CNN
	1    5575 18400
	1    0    0    -1  
$EndComp
Text Label 5075 18100 1    60   ~ 0
-12V
Wire Wire Line
	5075 18550 5075 18750
Text Label 5075 18750 3    60   ~ 0
AGND
Wire Wire Line
	5575 18550 5575 18750
Text Label 5575 18750 3    60   ~ 0
AGND
Wire Wire Line
	5075 18100 5075 18250
Text Label 5575 18100 1    60   ~ 0
+12V
Wire Wire Line
	5575 18100 5575 18250
Text Notes 8300 19150 0    60   ~ 0
+/- 12V supply test points
Text Notes 4950 19150 0    60   ~ 0
12V power decoupling caps
$Comp
L Connector_Generic:Conn_01x02 P11
U 1 1 622BFB40
P 9100 18200
F 0 "P11" H 9180 18192 50  0000 L CNN
F 1 "Conn_01x02" H 9180 18101 50  0000 L CNN
F 2 "" H 9100 18200 50  0001 C CNN
F 3 "~" H 9100 18200 50  0001 C CNN
	1    9100 18200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P12
U 1 1 622C074A
P 9100 18650
F 0 "P12" H 9180 18642 50  0000 L CNN
F 1 "Conn_01x02" H 9180 18551 50  0000 L CNN
F 2 "" H 9100 18650 50  0001 C CNN
F 3 "~" H 9100 18650 50  0001 C CNN
	1    9100 18650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 18200 8800 18200
Wire Wire Line
	8800 18200 8800 18250
Wire Wire Line
	8800 18300 8900 18300
Wire Wire Line
	8800 18250 8600 18250
Connection ~ 8800 18250
Wire Wire Line
	8800 18250 8800 18300
Wire Wire Line
	8900 18650 8800 18650
Wire Wire Line
	8800 18650 8800 18700
Wire Wire Line
	8800 18750 8900 18750
Wire Wire Line
	8800 18700 8600 18700
Connection ~ 8800 18700
Wire Wire Line
	8800 18700 8800 18750
Text Label 8600 18250 2    60   ~ 0
-12V
Text Label 8600 18700 2    60   ~ 0
+12V
$Comp
L Connector_Generic:Conn_01x02 P8
U 1 1 62B30A4B
P -1450 10750
F 0 "P8" H -1370 10742 50  0000 L CNN
F 1 "Conn_01x02" H -1370 10651 50  0000 L CNN
F 2 "" H -1450 10750 50  0001 C CNN
F 3 "~" H -1450 10750 50  0001 C CNN
	1    -1450 10750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P10
U 1 1 62B3249F
P -1450 11300
F 0 "P10" H -1370 11292 50  0000 L CNN
F 1 "Conn_01x02" H -1370 11201 50  0000 L CNN
F 2 "" H -1450 11300 50  0001 C CNN
F 3 "~" H -1450 11300 50  0001 C CNN
	1    -1450 11300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P9
U 1 1 62B3F92E
P -3900 3250
F 0 "P9" H -3820 3242 50  0000 L CNN
F 1 "Conn_01x02" H -3820 3151 50  0000 L CNN
F 2 "" H -3900 3250 50  0001 C CNN
F 3 "~" H -3900 3250 50  0001 C CNN
	1    -3900 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4100 2500 -4200 2500
Wire Wire Line
	-4200 2500 -4200 2550
Wire Wire Line
	-4200 2600 -4100 2600
Wire Wire Line
	-4200 2550 -4450 2550
Connection ~ -4200 2550
Wire Wire Line
	-4200 2550 -4200 2600
Text Label -4450 2550 2    60   ~ 0
DAC_UNI
Wire Wire Line
	-4100 2900 -4200 2900
Wire Wire Line
	-4200 2900 -4200 2950
Wire Wire Line
	-4200 3000 -4100 3000
Wire Wire Line
	-4200 2950 -4500 2950
Connection ~ -4200 2950
Wire Wire Line
	-4200 2950 -4200 3000
Text Label -4500 2950 2    60   ~ 0
DAC_BIP
$Comp
L Connector_Generic:Conn_01x02 P7
U 1 1 62B3CDA8
P -3900 2900
F 0 "P7" H -3820 2892 50  0000 L CNN
F 1 "Conn_01x02" H -3820 2801 50  0000 L CNN
F 2 "" H -3900 2900 50  0001 C CNN
F 3 "~" H -3900 2900 50  0001 C CNN
	1    -3900 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P6
U 1 1 62B38B6F
P -3900 2500
F 0 "P6" H -3820 2492 50  0000 L CNN
F 1 "Conn_01x02" H -3820 2401 50  0000 L CNN
F 2 "" H -3900 2500 50  0001 C CNN
F 3 "~" H -3900 2500 50  0001 C CNN
	1    -3900 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4100 3250 -4200 3250
Wire Wire Line
	-4200 3250 -4200 3300
Wire Wire Line
	-4200 3300 -4450 3300
Connection ~ -4200 3300
Wire Wire Line
	-4200 3300 -4200 3350
Text Label -4450 3300 2    60   ~ 0
DAC_BIP_NX
Wire Wire Line
	-4200 3350 -4100 3350
Wire Wire Line
	-1650 10850 -1750 10850
Wire Wire Line
	-1750 10850 -1750 10800
Wire Wire Line
	-1750 10750 -1650 10750
Wire Wire Line
	-1650 11300 -1750 11300
Wire Wire Line
	-1750 11300 -1750 11350
Wire Wire Line
	-1750 11400 -1650 11400
Wire Wire Line
	-1750 10800 -2000 10800
Connection ~ -1750 10800
Wire Wire Line
	-1750 10800 -1750 10750
Wire Wire Line
	-1750 11350 -2000 11350
Connection ~ -1750 11350
Wire Wire Line
	-1750 11350 -1750 11400
$Comp
L power:PWR_FLAG #FLG?
U 1 1 64DBA0E9
P 5075 725
F 0 "#FLG?" H 5075 800 50  0001 C CNN
F 1 "PWR_FLAG" H 5075 898 50  0000 C CNN
F 2 "" H 5075 725 50  0001 C CNN
F 3 "~" H 5075 725 50  0001 C CNN
	1    5075 725 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6530E014
P 5525 725
F 0 "#FLG?" H 5525 800 50  0001 C CNN
F 1 "PWR_FLAG" H 5525 898 50  0000 C CNN
F 2 "" H 5525 725 50  0001 C CNN
F 3 "~" H 5525 725 50  0001 C CNN
	1    5525 725 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 6530E761
P 5975 725
F 0 "#FLG?" H 5975 800 50  0001 C CNN
F 1 "PWR_FLAG" H 5975 898 50  0000 C CNN
F 2 "" H 5975 725 50  0001 C CNN
F 3 "~" H 5975 725 50  0001 C CNN
	1    5975 725 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 725  5075 875 
$Comp
L Connector_Generic:Conn_01x02 P4
U 1 1 65A7D907
P 5600 3000
F 0 "P4" H 5680 2992 50  0000 L CNN
F 1 "Conn_01x02" H 5680 2901 50  0000 L CNN
F 2 "" H 5600 3000 50  0001 C CNN
F 3 "~" H 5600 3000 50  0001 C CNN
	1    5600 3000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P5
U 1 1 65A7EAED
P 5600 3300
F 0 "P5" H 5680 3292 50  0000 L CNN
F 1 "Conn_01x02" H 5680 3201 50  0000 L CNN
F 2 "" H 5600 3300 50  0001 C CNN
F 3 "~" H 5600 3300 50  0001 C CNN
	1    5600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3000 5300 3000
Wire Wire Line
	5300 3000 5300 3050
Wire Wire Line
	5300 3100 5400 3100
Wire Wire Line
	5400 3300 5300 3300
Wire Wire Line
	5300 3300 5300 3350
Wire Wire Line
	5300 3400 5400 3400
Wire Wire Line
	5300 3050 5050 3050
Connection ~ 5300 3050
Wire Wire Line
	5300 3050 5300 3100
Wire Wire Line
	5300 3350 5050 3350
Connection ~ 5300 3350
Wire Wire Line
	5300 3350 5300 3400
$Comp
L teensy3:TEENSY3.1 U2
U 1 1 5733FC56
P 2775 2025
F 0 "U2" H 2775 3375 60  0000 C CNN
F 1 "TEENSY3.1" H 2775 375 60  0000 C CNN
F 2 "~" H 2475 2225 60  0000 C CNN
F 3 "~" H 2475 2225 60  0000 C CNN
	1    2775 2025
	1    0    0    -1  
$EndComp
Text Label 3975 825  0    60   ~ 0
DAC_UNI
Text Label 1525 3425 2    60   ~ 0
AGND
Text Label 3975 1125 0    60   ~ 0
3V3
Text Label 1525 925  2    60   ~ 0
DAC_GAIN_A0
Text Label 1525 1025 2    60   ~ 0
DAC_GAIN_A1
Text Label 3975 1025 0    60   ~ 0
GND
Text Label 1525 3525 2    60   ~ 0
5V
Wire Wire Line
	3775 825  3975 825 
Wire Wire Line
	1725 3425 1525 3425
Wire Wire Line
	3775 1125 3975 1125
Wire Wire Line
	1725 925  1525 925 
Wire Wire Line
	1725 1025 1525 1025
Wire Wire Line
	3775 1025 3975 1025
Wire Wire Line
	1725 3525 1525 3525
NoConn ~ 3775 925 
NoConn ~ 3775 1225
NoConn ~ 3775 1525
NoConn ~ 3775 1625
NoConn ~ 3775 1725
Text Label 1525 2425 2    60   ~ 0
TIA_OUT_UNI
Wire Wire Line
	1525 1425 1725 1425
Wire Wire Line
	1525 1525 1725 1525
Wire Wire Line
	1725 825  1525 825 
Text Label 1525 825  2    60   ~ 0
GND
NoConn ~ 1725 2625
NoConn ~ 3775 2175
NoConn ~ 3775 2275
NoConn ~ 3775 2375
NoConn ~ 3775 2475
NoConn ~ 3775 3425
NoConn ~ 3775 3525
Wire Wire Line
	1725 1225 1525 1225
Wire Wire Line
	1725 1325 1525 1325
Text Label 1525 1225 2    60   ~ 0
D3
Text Label 1525 1325 2    60   ~ 0
D4
Wire Wire Line
	1525 1925 1725 1925
Wire Wire Line
	1525 2025 1725 2025
Wire Wire Line
	1525 2125 1725 2125
Wire Wire Line
	1725 2225 1525 2225
Text Label 1525 1925 2    60   ~ 0
CS
Text Label 1525 2025 2    60   ~ 0
MOSI
Text Label 1525 2125 2    60   ~ 0
MISO
Text Label 1525 2225 2    60   ~ 0
SCK
Wire Wire Line
	1725 2725 1525 2725
Wire Wire Line
	1725 2825 1525 2825
NoConn ~ 3775 1825
Text Label 1525 2725 2    60   ~ 0
SDA
Text Label 1525 2825 2    60   ~ 0
SCL
NoConn ~ 1725 3325
Wire Wire Line
	1525 2425 1725 2425
NoConn ~ 1725 2325
Wire Wire Line
	1725 2525 1525 2525
Text Label 1525 2525 2    60   ~ 0
REF_ELECT_UNI
Wire Wire Line
	3775 3325 4025 3325
Wire Wire Line
	3775 3225 4025 3225
Wire Wire Line
	3775 3125 4025 3125
Wire Wire Line
	3775 3025 4025 3025
Wire Wire Line
	3775 2925 4025 2925
Wire Wire Line
	3775 2775 4025 2775
Wire Wire Line
	3775 2675 4025 2675
Wire Wire Line
	3775 2575 4025 2575
Text Label 4025 2575 0    60   ~ 0
D31
Text Label 4025 2675 0    60   ~ 0
D30
Text Label 4025 2775 0    60   ~ 0
D29
Text Label 4025 2925 0    60   ~ 0
D28
Text Label 4025 3025 0    60   ~ 0
D27
Text Label 4025 3125 0    60   ~ 0
D26
Text Label 4025 3225 0    60   ~ 0
D25
Text Label 4025 3325 0    60   ~ 0
D24
Text Label 1525 1425 2    60   ~ 0
TIA_GAIN_A0
Text Label 1525 1525 2    60   ~ 0
TIA_GAIN_A1
Wire Wire Line
	1725 2925 1525 2925
Wire Wire Line
	1725 3025 1525 3025
Text Label 1525 2925 2    50   ~ 0
REF_GAIN_A0
Text Label 1525 3025 2    50   ~ 0
REF_GAIN_A1
Wire Wire Line
	1725 1625 1525 1625
Wire Wire Line
	1725 1725 1525 1725
NoConn ~ 1725 1125
NoConn ~ 1725 3125
NoConn ~ 1725 3225
Wire Wire Line
	1725 1825 1525 1825
Text Label 1525 1825 2    60   ~ 0
SW_WRK_ELECT
Text Label 1525 1625 2    60   ~ 0
SW_CTR_ELECT
Text Label 1525 1725 2    60   ~ 0
SW_REF_ELECT
$Comp
L Device:C C?
U 1 1 668AE80C
P 4875 1875
F 0 "C?" H 4990 1921 50  0000 L CNN
F 1 "2.2uF" H 4990 1830 50  0000 L CNN
F 2 "" H 4913 1725 50  0001 C CNN
F 3 "~" H 4875 1875 50  0001 C CNN
	1    4875 1875
	1    0    0    -1  
$EndComp
Text Label 4875 1575 1    60   ~ 0
5V
Wire Wire Line
	4875 2025 4875 2225
Text Label 4875 2225 3    60   ~ 0
GND
Wire Wire Line
	4875 1575 4875 1725
$Comp
L Connector_Generic:Conn_01x02 P17
U 1 1 67FDB608
P 28000 3800
F 0 "P17" H 28080 3792 50  0000 L CNN
F 1 "Conn_01x02" H 28080 3701 50  0000 L CNN
F 2 "" H 28000 3800 50  0001 C CNN
F 3 "~" H 28000 3800 50  0001 C CNN
	1    28000 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 P18
U 1 1 67FDF739
P 28000 4400
F 0 "P18" H 28080 4392 50  0000 L CNN
F 1 "Conn_01x02" H 28080 4301 50  0000 L CNN
F 2 "" H 28000 4400 50  0001 C CNN
F 3 "~" H 28000 4400 50  0001 C CNN
	1    28000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	27800 3800 27700 3800
Wire Wire Line
	27700 3800 27700 3850
Wire Wire Line
	27700 3900 27800 3900
Wire Wire Line
	27800 4400 27700 4400
Wire Wire Line
	27700 4400 27700 4450
Wire Wire Line
	27700 4500 27800 4500
Wire Wire Line
	27700 3850 27450 3850
Connection ~ 27700 3850
Wire Wire Line
	27700 3850 27700 3900
Wire Wire Line
	27700 4450 27450 4450
Connection ~ 27700 4450
Wire Wire Line
	27700 4450 27700 4500
Text Label 27450 4450 2    60   ~ 0
TIA_OUT_UNI
Text Label 27450 3850 2    60   ~ 0
TIA_OUT_BIP
$Comp
L Connector_Generic:Conn_01x02 P19
U 1 1 68B05D71
P 25150 7150
F 0 "P19" H 25230 7142 50  0000 L CNN
F 1 "Conn_01x02" H 25230 7051 50  0000 L CNN
F 2 "" H 25150 7150 50  0001 C CNN
F 3 "~" H 25150 7150 50  0001 C CNN
	1    25150 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	24950 7150 24850 7150
Wire Wire Line
	24850 7150 24850 7200
Wire Wire Line
	24850 7250 24950 7250
Wire Wire Line
	24850 7200 24600 7200
Connection ~ 24850 7200
Wire Wire Line
	24850 7200 24850 7250
Text Label 24600 7200 2    60   ~ 0
REF_ELECT_BUF
$Comp
L Connector_Generic:Conn_01x02 P?
U 1 1 68E24A8C
P 25150 7500
F 0 "P?" H 25230 7492 50  0000 L CNN
F 1 "Conn_01x02" H 25230 7401 50  0000 L CNN
F 2 "" H 25150 7500 50  0001 C CNN
F 3 "~" H 25150 7500 50  0001 C CNN
	1    25150 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	24950 7500 24850 7500
Wire Wire Line
	24850 7500 24850 7550
Wire Wire Line
	24850 7600 24950 7600
Wire Wire Line
	24850 7550 24600 7550
Connection ~ 24850 7550
Wire Wire Line
	24850 7550 24850 7600
Text Label 24600 7550 2    60   ~ 0
REF_ELECT_BIP
Text Notes 24300 8250 0    60   ~ 0
Reference electrode test points
$Comp
L Connector_Generic:Conn_01x02 P20
U 1 1 6901ED51
P 25150 6600
F 0 "P20" H 25230 6592 50  0000 L CNN
F 1 "Conn_01x02" H 25230 6501 50  0000 L CNN
F 2 "" H 25150 6600 50  0001 C CNN
F 3 "~" H 25150 6600 50  0001 C CNN
	1    25150 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	24950 6600 24850 6600
Wire Wire Line
	24850 6600 24850 6650
Wire Wire Line
	24850 6700 24950 6700
Wire Wire Line
	24850 6650 24600 6650
Connection ~ 24850 6650
Wire Wire Line
	24850 6650 24850 6700
Text Label 24600 6650 2    60   ~ 0
CTR_ELECT
$Comp
L Connector_Generic:Conn_01x02 P21
U 1 1 6958CFB7
P 25150 7850
F 0 "P21" H 25230 7842 50  0000 L CNN
F 1 "Conn_01x02" H 25230 7751 50  0000 L CNN
F 2 "" H 25150 7850 50  0001 C CNN
F 3 "~" H 25150 7850 50  0001 C CNN
	1    25150 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	24950 7850 24850 7850
Wire Wire Line
	24850 7850 24850 7900
Wire Wire Line
	24850 7950 24950 7950
Wire Wire Line
	24850 7900 24600 7900
Connection ~ 24850 7900
Wire Wire Line
	24850 7900 24850 7950
Text Label 24600 7900 2    60   ~ 0
REF_ELECT_UNI
$Comp
L Device:C C?
U 1 1 69CC15B4
P 6150 18400
F 0 "C?" H 6265 18446 50  0000 L CNN
F 1 "0.1uF" H 6265 18355 50  0000 L CNN
F 2 "" H 6188 18250 50  0001 C CNN
F 3 "~" H 6150 18400 50  0001 C CNN
	1    6150 18400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 18050 6150 18250
Wire Wire Line
	6150 18550 6150 18800
Text Notes 24600 15350 0    60   ~ 0
demux decoupling 
$Comp
L Connector_Generic:Conn_02x05_Odd_Even P13
U 1 1 6A1CA837
P 11650 18400
F 0 "P13" H 11700 18817 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 11700 18726 50  0000 C CNN
F 2 "" H 11650 18400 50  0001 C CNN
F 3 "~" H 11650 18400 50  0001 C CNN
	1    11650 18400
	1    0    0    -1  
$EndComp
Text Label 12150 18600 0    60   ~ 0
CS
Text Label 12150 18500 0    60   ~ 0
MOSI
Text Label 12150 18400 0    60   ~ 0
SDA
Text Label 12150 18300 0    60   ~ 0
D4
Text Label 12150 18200 0    60   ~ 0
GND
Wire Wire Line
	11950 18600 12150 18600
Wire Wire Line
	11950 18500 12150 18500
Wire Wire Line
	11950 18400 12150 18400
Wire Wire Line
	11950 18300 12150 18300
Wire Wire Line
	11950 18200 12150 18200
$Comp
L Connector_Generic:Conn_02x05_Odd_Even P14
U 1 1 6A1CB872
P 11650 19300
F 0 "P14" H 11700 19717 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 11700 19626 50  0000 C CNN
F 2 "" H 11650 19300 50  0001 C CNN
F 3 "~" H 11650 19300 50  0001 C CNN
	1    11650 19300
	1    0    0    -1  
$EndComp
Text Label 11250 18600 2    60   ~ 0
SCK
Text Label 11250 18500 2    60   ~ 0
MISO
Text Label 11250 18400 2    60   ~ 0
SCL
Text Label 11250 18300 2    60   ~ 0
D3
Text Label 11250 18200 2    60   ~ 0
VUEXT
Wire Wire Line
	11450 18600 11250 18600
Wire Wire Line
	11450 18500 11250 18500
Wire Wire Line
	11450 18400 11250 18400
Wire Wire Line
	11250 18300 11450 18300
Wire Wire Line
	11450 18200 11250 18200
$Comp
L Device:R R?
U 1 1 6A48B84B
P 12700 18775
F 0 "R?" V 12775 18725 50  0000 L CNN
F 1 "4.7k" V 12700 18700 50  0000 L CNN
F 2 "" V 12630 18775 50  0001 C CNN
F 3 "~" H 12700 18775 50  0001 C CNN
	1    12700 18775
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6A48BFD2
P 13000 18775
F 0 "R?" V 13075 18725 50  0000 L CNN
F 1 "4.7k" V 13000 18700 50  0000 L CNN
F 2 "" V 12930 18775 50  0001 C CNN
F 3 "~" H 13000 18775 50  0001 C CNN
	1    13000 18775
	1    0    0    -1  
$EndComp
Wire Wire Line
	13000 18500 13000 18625
Wire Wire Line
	12700 18500 12700 18625
$Comp
L Connector_Generic:Conn_02x02_Odd_Even P15
U 1 1 6A6D125F
P 14200 18225
F 0 "P15" H 14250 18442 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 14250 18351 50  0000 C CNN
F 2 "" H 14200 18225 50  0001 C CNN
F 3 "~" H 14200 18225 50  0001 C CNN
	1    14200 18225
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x02_Odd_Even P16
U 1 1 6A6D1DFF
P 14200 18775
F 0 "P16" H 14250 18992 50  0000 C CNN
F 1 "Conn_02x02_Odd_Even" H 14250 18901 50  0000 C CNN
F 2 "" H 14200 18775 50  0001 C CNN
F 3 "~" H 14200 18775 50  0001 C CNN
	1    14200 18775
	1    0    0    -1  
$EndComp
$EndSCHEMATC
