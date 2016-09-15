// Demo for Grove - Starter Kit V2.0
// Edited for Processing: Arthur Bennis 2016-09-15
//
// Uses the Grove - Light Sensor to measure the ambient light, and turns on the Grove - LED
// when the value drops below a certain threshold.
// In a bright room, try covering the Grove - Light Sensor with your hand.
// Connect the Grove - Light Sensor to the socket marked A0
// Connect the Grove - LED to D7

// imports: serial en arduino
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Arduino arduino;


// Defines the pins to which the light sensor and LED are connected.
int pinLight = 0;
int pinLed   = 7;

// Defines the light-sensor threshold value below which the LED will turn on.
// Decrease this value to make the device more sensitive to ambient light, or vice-versa.
int thresholdvalue = 400;

void setup()
{
    // Grove koppelen
    arduino = new Arduino(this, Arduino.list()[2], 57600);
    
    // Configure the LED's pin for output signals.
    arduino.pinMode(pinLed, Arduino.OUTPUT);
}

void draw()
{
    background(51);
    // Read the value of the light sensor. The light sensor is an analog sensor.
    int sensorValue = arduino.analogRead(pinLight);

    // Turn the LED on if the sensor value is below the threshold.
    if(sensorValue < thresholdvalue)
    {
        arduino.digitalWrite(pinLed, Arduino.HIGH);
    }
    else
    {
        arduino.digitalWrite(pinLed, Arduino.LOW);
    }
}

