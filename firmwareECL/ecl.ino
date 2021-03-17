#include "ecl.h"

void led_flash(int flash_on_off_time){
  led_cnt++;
  if(led_mode==1) {
    digitalWrite(ledPin, HIGH);   // set the LED on  
    if(led_cnt>=flash_on_off_time) {led_mode=0; led_cnt=0;}          
  }
  else {
    digitalWrite(ledPin, LOW);    // set the LED off
    if(led_cnt>=flash_on_off_time) {led_mode=1; led_cnt=0;}  
  }
}

void write_version(byte Y,  byte M, byte D, char V, byte board){
  int i;
  byte v[5];

  v[0] = Y;
  v[1] = M;
  v[2] = D;
  v[3] = V;
  v[4] = board;

  for (i=0; i<5; i++){
    EEPROM.write(i,v[i]);
  }  
}

void read_version(char *s){
  int i;
  byte v[5];

  for (i=0; i<5; i++){
    v[i] = EEPROM.read(i);
  }

  sprintf(s,"Version: 20%i_%i_%i_%c", v[0],  v[1],  v[2], v[3]);
}

void read_variant(char *s){
  int i;
  byte v[5];

  for (i=0; i<5; i++){
    v[i] = EEPROM.read(i);
  }

  sprintf(s,"Variant: ECL Measurement Device %i",v[4]);
}

void set_cell(int i){
  if(i==CELL_ON) {
    cell_mode = CELL_ON;
    digitalWrite(cellPin, HIGH); 
  } else {
    cell_mode = CELL_OFF;
    digitalWrite(cellPin, LOW); 
  }
}

void set_fb(int i){
  if(i==CURRENT) {
    fb_mode = CURRENT;
    digitalWrite(modePin, HIGH); 
  } 
  else {
    fb_mode = VOLTAGE;
    digitalWrite(modePin, LOW); 
  }
}

float set_voltage(float v){
  int i;
  float f;

  pot_v = v;
  i = v_offset + (int) round(bits_per_volt * v);
  f = (i - v_offset)/bits_per_volt;
  analogWrite(potvoltagePin, i); //DAC1
  return f;
}

float set_v_start(float v){
  int i;
  float f;

  v_start = v;
  i = v_offset + (int) round(bits_per_volt * v);
  f = (i - v_offset)/bits_per_volt;
  return f;
}

float set_v_end(float v){
  int i;
  float f;

  v_end = v;
  i = v_offset + (int) round(bits_per_volt * v);
  f = (i - v_offset)/bits_per_volt;
  return f;
}

float set_scan_rate(float v){
  scan_rate = v;
  return v;
}

void set_measure(int i){
  if(i==IP) {
    measure_mode = IP;
    adc->startSynchronizedContinuous(currentPin, photoPin);
  } 
  else if(i==PV) {
    measure_mode = PV;
    adc->startSynchronizedContinuous(photoPin, voltPin);
  } 
  else {
    measure_mode = IV;
    adc->startSynchronizedContinuous(currentPin, voltPin);
  }
}

void set_i_gain(int i){
  switch (i) {
    case (3):
      i_gain = 3;
      digitalWrite(range1Pin, LOW);
      digitalWrite(range2Pin, LOW);
      digitalWrite(range3Pin, LOW);       
      break;
    case (2):
      i_gain = 2;
      digitalWrite(range1Pin, LOW);
      digitalWrite(range2Pin, LOW);
      digitalWrite(range3Pin, HIGH);       
      break;
    case (1):
      i_gain = 1;
      digitalWrite(range1Pin, LOW);
      digitalWrite(range2Pin, HIGH);
      digitalWrite(range3Pin, LOW);       
      break;            
    case (0):
    default:
      i_gain = 0;
      digitalWrite(range1Pin, HIGH);
      digitalWrite(range2Pin, LOW);
      digitalWrite(range3Pin, LOW);      
  }
}

float set_hv(float v){
  int i;
  float f;

  hv = v;
  i = (int) round(bits_per_hv * v);
  f = i/bits_per_hv;
//  analogWrite(hvPin, i); //DAC0
  return f;
}

void set_hv_enable(int i){
  int j;
    
  if (i == HV_OFF) {
    hv_mode = i;
    analogWrite(hvPin, 0); //DAC0
  }
  else if (i == HV_ON) {
      hv_mode = i;
      j = (int) round(bits_per_hv * hv);
      analogWrite(hvPin, j); //DAC0
  }
  
}
