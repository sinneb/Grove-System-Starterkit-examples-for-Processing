// Demo for Grove - Starter V2.0
// Author: Loovee  2013-3-10
// Edited for Processing: Arthur Bennis 2016-09-14

// Uses the Grove - Button to control the Grove - LED.
// Connect the Grove - Button to the socket marked D3
// Connect the Grove - LED to D7

// imports: serial en arduino
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Arduino arduino;

// Defines the pins to which the button and LED are connected.
int pinButton = 3;
int pinLed    = 7;

void setup()
{
    // Grove koppelen
    arduino = new Arduino(this, Arduino.list()[2], 57600);
    
    // Configure the button's pin for input signals.
    arduino.pinMode(pinButton, Arduino.INPUT);

    // Configure the LED's pin for output.
    arduino.pinMode(pinLed, Arduino.OUTPUT);
    
    size(500, 500);
}

void draw()
{
    if (arduino.digitalRead(pinButton) == Arduino.HIGH)
    {
        // When the button is pressed, turn the LED on.
        arduino.digitalWrite(pinLed, Arduino.HIGH);
    }
    else
    {
        // Otherwise, turn the LED off.
        arduino.digitalWrite(pinLed, Arduino.LOW);
    }
    
    delay(10);
}