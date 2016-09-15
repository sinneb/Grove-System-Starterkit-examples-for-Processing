// Demo for Grove - Starter Kit V2.0
// Edited for Processing: Arthur Bennis 2016-09-15

// Turns on the Grove - LED when the sound level measured by the Grove - Sound Sensor exceeds a certain value.
// Connect the Grove - Sound Sensor to the socket marked A0
// Connect the Grove - LED to D7

// imports: serial en arduino
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Arduino arduino;

// Define the pins to which the sound sensor and LED are connected.
int pinSound = 0;
int pinLed   = 7;

// Define the sound level above which to turn on the LED.
// Change this to a larger value to require a louder noise level.
int thresholdValue = 500;

void setup()
{
    // Grove koppelen
    arduino = new Arduino(this, Arduino.list()[2], 57600);
    
    // Configure LED's pin for output signals.
    arduino.pinMode(pinLed, Arduino.OUTPUT);
}

void draw()
{
    // Read the value of the sound sensor.
    int sensorValue = arduino.analogRead(pinSound);

    // If the measured sound level is above the threshold, blink the LED.
    if(sensorValue > thresholdValue)
    {
        // Turn the LED on for 200ms, then turn it back off.
        arduino.digitalWrite(pinLed,Arduino.HIGH);
        delay(200);
        arduino.digitalWrite(pinLed,Arduino.LOW);
    }
}

