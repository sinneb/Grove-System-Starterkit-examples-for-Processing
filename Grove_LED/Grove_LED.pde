// Demo for Grove - Starter V2.0
// Author: Loovee  2013-3-10
// Edited for Processing: Arthur Bennis 2016-09-15

// Pulses the Grove - LED with a "breathing" effect.
// Connect the Grove - LED to the socket marked D3

// imports: serial en arduino
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Arduino arduino;

// Defines the pin to which the LED is connected.
// Any pin that supports PWM can also be used:
// 3, 5, 6, 9, 10, 11
int pinLed    = 3;

// Define the delay for the "breathing" effect; change this
// to a smaller value for a faster effect, larger for slower.
int BREATH_DELAY = 5; // milliseconds

void setup()
{
    // Grove koppelen
    arduino = new Arduino(this, Arduino.list()[2], 57600);
    
    // Configure the LED's pin for output signals.
    arduino.pinMode(pinLed, Arduino.OUTPUT);
}

void draw()
{
    for(int i=0; i<256; i++)
    {
        arduino.analogWrite(pinLed, i);
        delay(BREATH_DELAY);
    }
    delay(100);
    
    for(int i=254; i>=0; i--)
    {
        arduino.analogWrite(pinLed, i);
        delay(BREATH_DELAY);
    }
    delay(500);
}
