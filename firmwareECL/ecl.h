#ifndef ECL_H
#define ECL_H

#include <Arduino.h>
#include <ADC.h>
#include <EEPROM.h>

// ECL pins

// Teensy 3.x / Teensy LC have the LED on pin 13
const int ledPin = 13;

// Analogue input
// A2 is photo current (can be either ADC)
// A3 is pot voltage (can be either ADC)
// A5 is pot current (must be ADC0)
const int photoPin = A2;
const int voltPin = A3;
const int currentPin = A5;
//const int readPin0 = A5; // ADC0 (A5 pin 19) Can be  A9, A8, A7, A6, A5, A4
//const int readPin1 = A3; // ADC1 (A3 pin 17) Can be  A3, A2

// CMOS switch to change between voltage and current feedback
const int modePin = 6;

// Turn cell on and off
const int cellPin = 3;

// Current gain for pot
const int range1Pin = 21;
const int range2Pin = 20;
const int range3Pin = 14;

// PMT current gain (not used)
const int range4Pin = 23;
const int range5Pin = 22;

const int potvoltagePin = A22;
const int hvPin = A21;


const int adc_avg = 16;
const float bits_per_volt = 2048.0 / (3.3/2.0*240.0/75.0) / 0.995;  // scale correction 1/0.995
const float bits_per_hv = 4095 / (3.3/3.0*1000.0);  
const int v_offset = 2022; // measured
const float adc_ref = 3.3 * (75000.0 - 470.0)/75000.0;
const float v_scale = 240.0/75.0;
const float i_scale[4] = {1.001e-4, 1.01e-5, 1.1e-6, 1e-7};
const float p_scale = 1.0/510e3;

#define MAX_V (5.20)
#define MIN_V (-5.20)
#define MAX_S (1.0)
#define MIN_S (0.01)
#define MAX_HV (900.0)
#define MIN_HV (0.0)

#define STOP (0)
#define RUN (1)
#define CELL_OFF (0)
#define CELL_ON (1)
#define HV_OFF (0)
#define HV_ON (1)
#define VOLTAGE (0)
#define CURRENT (1)
#define IP (0)
#define IV (1)
#define PV (2)

// variables shared between interrupt context and main program
// context must be declared "volatile".
volatile int readPin0 = A5; // ADC0 (A5 pin 19) Can be  A9, A8, A7, A6, A5, A4
volatile int readPin1 = A3; // ADC1 (A3 pin 17) Can be  A3, A2
volatile int test_type = 0;
volatile int mode; //STOP, RUN
volatile int fb_mode; // VOLTAGE, CURRENT
volatile int cell_mode; //CELL_ON, CELL_OFF
volatile int hv_mode; //HV_ON, HV_OFF
volatile int measure_mode; // IP, IV, PV
volatile int i_gain = 0;
volatile int samples;
volatile int led_mode = 0;
volatile int led_cnt = 0;
volatile float pot_v = 0.0;
volatile float v_start = 0.0;
volatile float v_end = 1.0;
volatile float scan_rate = 1.0;
volatile float hv = 0.0;
volatile int n_samples;
volatile float v_step;
volatile int n_parts;

ADC *adc = new ADC(); // adc object
ADC::Sync_result adc_result;

// control teensy led for debug
// time=0 turns led off
void led_flash(int flash_on_off_time);

// Write ECL version to flash
void write_version(byte Y,  byte M, byte D, char V, byte board);
void read_version(char *s);
void set_cell(int i);
void set_fb(int i);
float set_voltage(float v);
float set_v_start(float v);
float set_v_end(float v);
float set_scan_rate(float v);
void set_measure(int i);
void set_i_gain(int i);
float set_hv(float v);
void set_hv_enable(int i);

#endif
