Grove System Starterkit examples for Processing
===========================

A port of the examples provided by SEEED for their Grove System Starterkit for Arduino. In this configuration, the Arduino is configured as a Firmata device, passing the sensor data through to Processing.

Getting started
======
1. Download the repository
2. Install the Arduino IDE from arduino.cc
3. Open the Arduino IDE and select File > Open > "StandardFirmata_Grove.ino" from the downloaded repository in the folder "StandardFirmata_Grove"
4. Under Tools > select board and port
5. Upload the code to the Arduino board - this should yield no errors

Try out the Button, LED, LightSensor etc examples from the repository. These examples are build for Processing

The LCD code is in the "Processing_start" folder. This folder contains an edited Firmata library in the form of two java files. Local library files supersede global library files. If you'd like to reuse the LCD functionality, copy these two java files to the folder containing your project files. 
