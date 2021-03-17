#include <FrequencyTimer2.h>
#include "ecl.h"

volatile int testcnt;
volatile uint16_t pcnt;
volatile float new_voltage;
uint16_t *adc0_values;
uint16_t *adc1_values;
float *time_values;
volatile int adc_write_ptr;
volatile int adc_read_ptr;
volatile unsigned long start_time;


void run_control(){
  switch(mode){
    //stopped 
    case STOP: {
      led_flash(1000);  
      testcnt = 0;
      pcnt = 0;
      break;
    }
    //running
    case RUN: {
      led_flash(100);  
      if(test_type==0){
        if(adc_write_ptr<samples) {
           adc_result = adc->readSynchronizedContinuous();
          // if using 16 bits and single-ended is necessary to typecast to unsigned,
          // otherwise values larger than 3.3/2 will be interpreted as negative        
          adc_result.result_adc0 = (uint16_t)adc_result.result_adc0;
          adc_result.result_adc1 = (uint16_t)adc_result.result_adc1;
          adc0_values[adc_write_ptr] = adc_result.result_adc0;
          adc1_values[adc_write_ptr] = adc_result.result_adc1;  
          time_values[adc_write_ptr] = 1e-3*(float)(micros()-start_time);  
          adc_write_ptr++;
        }
        else {
          //wait for all data to be sent before returning to stopped mode
          if(adc_read_ptr==adc_write_ptr) mode=0;
        }
      }
      else if(test_type==1){
        if(adc_write_ptr<n_samples*n_parts) {  
           
          if(v_end>v_start) {
            if ((pcnt&0x0001)==0x0000) {
              new_voltage = v_start + testcnt * v_step;
            } else {
              new_voltage = v_end - testcnt * v_step; 
            }
            
          } else {
            if ((pcnt&0x0001)==0x0000) {
              new_voltage = v_start - testcnt * v_step;
            } else {
              new_voltage = v_end + testcnt * v_step; 
            }
          }
          set_voltage(new_voltage);
  
          if(testcnt<n_samples){
            testcnt += 1;
          } 
          else 
          {         
            if(pcnt<n_parts) {
              pcnt += 1;
              testcnt = 0;
            }
          }
          adc_result = adc->readSynchronizedContinuous();
          // if using 16 bits and single-ended is necessary to typecast to unsigned,
          // otherwise values larger than 3.3/2 will be interpreted as negative        
          adc_result.result_adc0 = (uint16_t)adc_result.result_adc0;
          adc_result.result_adc1 = (uint16_t)adc_result.result_adc1;
          adc0_values[adc_write_ptr] = adc_result.result_adc0;
          adc1_values[adc_write_ptr] = adc_result.result_adc1;  
   
          adc_write_ptr++;
        }
        else {
          //wait for all data to be sent before returning to stopped mode
          if(adc_read_ptr==adc_write_ptr) {
            set_cell(CELL_OFF);
            set_hv_enable(HV_OFF);       
            mode=0;
          }
        }
      }      
      break;
    }
    default: led_flash(10); 
  }  
}

int read_command(){
  char s[64];
  char p[120];
  char r[120];
  char *token;
  char com[50]="";
  char* v[5];
  int values;
  int i;
  int bytes_read;
  float f1, f2;

  if(Serial.available()>0) {
    bytes_read = Serial.readBytesUntil('\r',s,64);
    if(bytes_read==0) return 0;

    // Split string on white space
    // com is the first string (command)
    // the number of other strings is values
    // the other strings have pointers in v
    token = strtok(s," ");
    values = 0;
//    i = strlen(token)-1;
//    // for commands without values remove \r
//    if (token[i]=='\r'){
//      strncpy(com,token,i);
//    } else {
//      strcpy(com,token);
//    }
    strcpy(com,token);
    while(token!=NULL){
      token = strtok(NULL," ");
      if(token!=NULL){
        v[values] = token;
        values += 1;
      }        
    }
    
//    sprintf(p,"Command: _%s_  Length:%i", com, strlen(com));
//    Serial.print(p);
//    for (i=0; i<values; i++) {
//      sprintf(p," Value(%i): %s",i, v[i]);
//      Serial.print(p);
//    }
//    Serial.println("     ... end of test");  

    if(strcmp(com,"getVersion")==0){
      read_version(r);
      Serial.println(r);
    }

    if(strcmp(com,"getVariant")==0){
      read_variant(r);
      Serial.println(r);
    }  

    if(strcmp(com,"getCell")==0){
      if(cell_mode==CELL_ON){
        Serial.println("On");
      } 
      else if(cell_mode==CELL_OFF){
        Serial.println("Off");
      }   
      else {
        sprintf(r,"Error: Cell not ON or OFF (%i)",cell_mode);
        Serial.println(r);    
      }
    }       

    if(strcmp(com,"setCell")==0){
      if(strcmp(v[0],"On")==0){
        cell_mode=CELL_ON;
        set_cell(cell_mode);
        Serial.println("Cell On");  
      }
      else if(strcmp(v[0],"Off")==0){
        cell_mode=CELL_OFF;
        set_cell(cell_mode);
        Serial.println("Cell Off");  
      }      
      else {
        sprintf(r,"No change: Incorrect argument: %s",v[0]);
        Serial.println(r);
      }
    }              

    if(strcmp(com,"getFeedback")==0){
      if(fb_mode==CURRENT){
        Serial.println("Current");
      } 
      else if(fb_mode==VOLTAGE){
        Serial.println("Voltage");
      }   
      else {
        sprintf(r,"Error: Mode not Current or Voltage (%i)",fb_mode);
        Serial.println(r);    
      }
    }    

    if(strcmp(com,"setFeedback")==0){
      if(strcmp(v[0],"Current")==0){
        fb_mode=CURRENT;
        set_fb(fb_mode);
        Serial.println("Feedback Current");  
      }
      else if(strcmp(v[0],"Voltage")==0){
        fb_mode=VOLTAGE;
        set_fb(fb_mode);
        Serial.println("Feedback Voltage");  
      }      
      else {
        sprintf(r,"No change: Incorrect argument: %s",v[0]);
        Serial.println(r);
      }
    }          

    if(strcmp(com,"setVolt")==0){
      f1 = atof(v[0]);
      if(f1>MAX_V){
        sprintf(r,"No change: Voltage out of range: %f > %f",f1, MAX_V);
        Serial.println(r);  
      }
      else if(f1<MIN_V){
        sprintf(r,"No change: Voltage out of range: %f < %f",f1, MIN_V);
        Serial.println(r);  
      }   
      else {
        f2 = set_voltage(f1);  
        sprintf(r,"%.3f",f2);
        Serial.println(r);        
      }   
    }

    if(strcmp(com,"setVstart")==0){
      f1 = atof(v[0]);
      if(f1>MAX_V){
        sprintf(r,"No change: Voltage out of range: %f > %f",f1, MAX_V);
        Serial.println(r);  
      }
      else if(f1<MIN_V){
        sprintf(r,"No change: Voltage out of range: %f < %f",f1, MIN_V);
        Serial.println(r);  
      }   
      else {
        f2 = set_v_start(f1);  
        sprintf(r,"%.3f",f2);
        Serial.println(r);        
      }   
    }   

    if(strcmp(com,"getVstart")==0){
      f2 = set_v_start(v_start);  
      sprintf(r,"%.3f",f2);
      Serial.println(r);          
    }     

    if(strcmp(com,"setVend")==0){
      f1 = atof(v[0]);
      if(f1>MAX_V){
        sprintf(r,"No change: Voltage out of range: %f > %f",f1, MAX_V);
        Serial.println(r);  
      }
      else if(f1<MIN_V){
        sprintf(r,"No change: Voltage out of range: %f < %f",f1, MIN_V);
        Serial.println(r);  
      }   
      else {
        f2 = set_v_end(f1);  
        sprintf(r,"%.3f",f2);
        Serial.println(r);        
      }   
    }   

    if(strcmp(com,"getVend")==0){
      f2 = set_v_start(v_end);  
      sprintf(r,"%.3f",f2);
      Serial.println(r);          
    }        

    if(strcmp(com,"setScanrate")==0){
      f1 = atof(v[0]);
      if(f1>MAX_S){
        sprintf(r,"No change: Voltage out of range: %f > %f",f1, MAX_S);
        Serial.println(r);  
      }
      else if(f1<MIN_S){
        sprintf(r,"No change: Voltage out of range: %f < %f",f1, MIN_S);
        Serial.println(r);  
      }   
      else {
        f2 = set_scan_rate(f1);  
        sprintf(r,"%.3e",f2);
        Serial.println(r);        
      }   
    }      

    if(strcmp(com,"getScanrate")==0){
      f2 = set_scan_rate(scan_rate);  
      sprintf(r,"%.3e",f2);
      Serial.println(r);        
    }   

    if(strcmp(com,"setMeasure")==0){
      if(strcmp(v[0],"IP")==0){
        measure_mode=IP;
        set_measure(measure_mode);
        Serial.println("Measure (Current,Photo)");  
      }
      else if(strcmp(v[0],"IV")==0){
        measure_mode=IV;
        set_measure(measure_mode);
        Serial.println("Measure (Current,Voltage)");  
      } 
      else if(strcmp(v[0],"PV")==0){
        measure_mode=PV;
        set_measure(measure_mode);
        Serial.println("Measure (Photo,Voltage)");  
      }           
      else {
        sprintf(r,"No change: Incorrect argument: %s",v[0]);
        Serial.println(r);
      }
    }   

    if(strcmp(com,"setGain")==0){
      i = atoi(v[0]);
      if(i<0) {
        sprintf(r,"No change: Incorrect argument: %i < 0",i);
        Serial.println(r);          
      }
      if(i>3) {
        sprintf(r,"No change: Incorrect argument: %i > 3",i);
        Serial.println(r);          
      }   
      set_i_gain(i); 
      sprintf(r,"Gain %i (%e)",i_gain,i_scale[i_gain]);
      Serial.println(r);        
    }    

    if(strcmp(com,"getGain")==0){
      sprintf(r,"Gain %i (%e)",i_gain,i_scale[i_gain]);
      Serial.println(r);        
    }     

    if(strcmp(com,"setHV")==0){
      f1 = atof(v[0]);
      if(f1>MAX_HV){
        sprintf(r,"No change: Voltage out of range: %f > %f",f1, MAX_HV);
        Serial.println(r);  
      }
      else if(f1<MIN_HV){
        sprintf(r,"No change: Voltage out of range: %f < %f",f1, MIN_HV);
        Serial.println(r);  
      }   
      else {
        f2 = set_hv(f1);  
        sprintf(r,"%.1f",f2);
        Serial.println(r);        
      }   
    }  

    if(strcmp(com,"getHV")==0){
        f2 = set_hv(hv);  
        sprintf(r,"%.1f",f2);
        Serial.println(r);       
    }     

    if(strcmp(com,"getHVenable")==0){
      if(hv_mode==HV_ON){
        Serial.println("On");
      } 
      else if(hv_mode==HV_OFF){
        Serial.println("Off");
      }   
      else {
        sprintf(r,"Error: HV not ON or OFF (%i)",hv_mode);
        Serial.println(r);    
      }
    } 

    if(strcmp(com,"setHVenable")==0){
      if(strcmp(v[0],"On")==0){
        hv_mode=HV_ON;
        set_hv_enable(hv_mode);
        Serial.println("HV On");  
      }
      else if(strcmp(v[0],"Off")==0){
        hv_mode=HV_OFF;
        set_hv_enable(hv_mode);
        Serial.println("HV Off");  
      }      
      else {
        sprintf(r,"No change: Incorrect argument: %s",v[0]);
        Serial.println(r);
      }
    }            

    if(strcmp(com,"stopTest")==0){
      mode = 0;
      Serial.println("Stop OK");
    }

    if(strcmp(com,"runTest")==0){
      if(mode==0){
        if(values==0) { // run debug 
          test_type = 0;
          //allocate buffers
          if(adc0_values!=NULL) free(adc0_values);
          adc0_values = (uint16_t*)malloc(2*samples);
          if(adc1_values!=NULL) free(adc1_values);
          adc1_values = (uint16_t*)malloc(2*samples);  
          if(time_values!=NULL) free(time_values);
          time_values = (float*)malloc(4*samples);               
          //initialise FIFO pointers
          adc_write_ptr = 0;
          adc_read_ptr = 0;
          //start experiment if buffers are ok
          if((samples>0)&&(adc0_values!=NULL)&&(adc1_values!=NULL)&&(time_values!=NULL)) {
            Serial.println("Run debug OK");
            start_time = micros();
            mode=1; 
          }
        }
        else if(strcmp(v[0],"CV")==0){
          test_type = 1;
//          Serial.println("Run CV OK");
          v_step = scan_rate * 1e-3;
          n_samples = (int)ceil(abs(v_start - v_end)/v_step);
          n_parts = 2;

          //allocate buffers
          if(adc0_values!=NULL) free(adc0_values);
          adc0_values = (uint16_t*)malloc(2*n_samples*n_parts);
          if(adc1_values!=NULL) free(adc1_values);
          adc1_values = (uint16_t*)malloc(2*n_samples*n_parts);  
          if(time_values!=NULL) free(time_values);
          time_values = NULL;          
          //initialise FIFO pointers
          adc_write_ptr = 0;
          adc_read_ptr = 0;
          //start experiment if buffers are ok
          if((n_samples>0)&&(adc0_values!=NULL)&&(adc1_values!=NULL)) {
            set_cell(CELL_ON);
            set_fb(VOLTAGE);
            set_hv_enable(HV_ON);
            delay(10);
            mode=1; 
          }        
        }
        else {
          sprintf(r,"Test not implemented: %s",v[0]);
          Serial.println(r);
        }
      }
      else {
        Serial.println("Must stop first");
      }
    }      


    if(strcmp(com,"setSamples")==0){
      if((mode==0)&&(values==1)) {
        samples = atoi(v[0]); 
        sprintf(p,"Samples: %i",samples);
        Serial.println(p);
      }
    }

    return bytes_read;  
  } else {
    return 0;
  }
}

int write_command(){
  int bytes_available;
  float e, f;
  char s[64];

  bytes_available = Serial.availableForWrite();
  if(bytes_available>40) {
    if((adc_read_ptr<adc_write_ptr)&&(mode==1)) {
      switch (measure_mode) {
        case IP:
          e = ((adc0_values[adc_read_ptr]*adc_ref/adc->adc0->getMaxValue())-adc_ref/2.0)*i_scale[i_gain];
          f = (adc1_values[adc_read_ptr]*adc_ref/adc->adc1->getMaxValue())*p_scale;        
          break;
        case PV:
          e = (adc0_values[adc_read_ptr]*adc_ref/adc->adc0->getMaxValue())*p_scale;
          f = ((adc1_values[adc_read_ptr]*adc_ref/adc->adc1->getMaxValue())-adc_ref/2.0)*v_scale;         
          break;
        case IV:
          e = ((adc0_values[adc_read_ptr]*adc_ref/adc->adc0->getMaxValue())-adc_ref/2.0)*i_scale[i_gain];
          f = ((adc1_values[adc_read_ptr]*adc_ref/adc->adc1->getMaxValue())-adc_ref/2.0)*v_scale;         
          break;
        default:
          e = 0.0;
          f = 0.0;
      }

      sprintf(s,"%.4e %.4e",e,f);
      Serial.print(s);     
      if(test_type==0) {
        Serial.print("    Time(ms): ");
        Serial.println(time_values[adc_read_ptr],3);           
      }
      else {
        Serial.println(" "); 
      }
      Serial.flush();
      adc_read_ptr++;
    } 
    return bytes_available;
  } else {
    return 0;
  }
}

// the setup() method runs once, when the sketch starts
  void setup() {
  char s[60];
  
  Serial.begin(9600); // USB is always 12 Mbit/sec
  delay(3000); // Wait for interface to come up
  Serial.flush();
//  write_version(21, 03, 01, 'A', 1);
  Serial.println("Teensy 3.6 ECL");
  read_version(s);
  Serial.println(s);
  read_variant(s);
  Serial.println(s);
  Serial.flush();
  Serial.setTimeout(500); // Wait for 100ms (max)
  
  pinMode(ledPin, OUTPUT); // initialize the digital pin as an output.
  digitalWrite(ledPin, LOW);

  pinMode(modePin, OUTPUT); // 0=voltage f/b, 1=current f/b 
  pinMode(cellPin, OUTPUT); // 0=cell off, 1=cell on
  pinMode(range1Pin, OUTPUT); // 1k
  pinMode(range2Pin, OUTPUT); // 10k
  pinMode(range3Pin, OUTPUT); // 100k
  pinMode(range4Pin, OUTPUT); // should always be 0 (not used)
  pinMode(range5Pin, OUTPUT); // should always be 0 (not used)

  digitalWrite(range4Pin, LOW); 
  digitalWrite(range5Pin, LOW); 
  
  mode = STOP; 



  led_mode = 0;
  led_cnt = 0;

  samples = 0;

  adc0_values = NULL;
  adc1_values = NULL;
  time_values = NULL;
  adc_write_ptr = 0;
  adc_read_ptr = 0;

//  pinMode(readPin0, INPUT);
//  pinMode(readPin1, INPUT);

  pinMode(photoPin, INPUT);
  pinMode(voltPin, INPUT);
  pinMode(currentPin, INPUT);  

  adc->adc0-> setReference(ADC_REFERENCE::REF_EXT);
  adc->adc1-> setReference(ADC_REFERENCE::REF_EXT); 
  
// it can be any of the ADC_MED_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED or VERY_HIGH_SPEED
  adc->adc0->setAveraging(adc_avg); // set number of averages
  adc->adc0->setResolution(16); // set bits of resolution
  adc->adc0->setConversionSpeed(ADC_CONVERSION_SPEED::HIGH_SPEED); // change the conversion speed
  adc->adc0->setSamplingSpeed(ADC_SAMPLING_SPEED::HIGH_SPEED); // change the sampling speed

  adc->adc1->setAveraging(adc_avg); // set number of averages
  adc->adc1->setResolution(16); // set bits of resolution
  adc->adc1->setConversionSpeed(ADC_CONVERSION_SPEED::HIGH_SPEED); // change the conversion speed
  adc->adc1->setSamplingSpeed(ADC_SAMPLING_SPEED::HIGH_SPEED); // change the sampling speed

//  adc->startSynchronizedContinuous(readPin0, readPin1);

  analogWriteResolution(12);

  FrequencyTimer2::setPeriod(1000); //1000us timer2
  FrequencyTimer2::enable();  //enable timer
  FrequencyTimer2::setOnOverflow(run_control); //Call function at the end to the time period
set_hv(0.0);
  set_hv_enable(HV_OFF);
  set_measure(IP);
  set_voltage(0.0);
  set_cell(CELL_OFF);
  set_fb(VOLTAGE);
  set_i_gain(0);
  set_hv(0.0);
  set_hv_enable(HV_OFF);
  set_measure(IP);
  set_voltage(0.0);
  set_cell(CELL_OFF);
  set_fb(VOLTAGE);
  set_i_gain(0);
}

// the loop() methor runs over and over again,
// as long as the board has power
void loop() {
  read_command();
  write_command();
}
