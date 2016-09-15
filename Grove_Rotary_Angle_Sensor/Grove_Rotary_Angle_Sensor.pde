// Demo for Grove - Starter Kit V2.0
// Edited for Processing: Arthur Bennis 2016-09-15

// Prints the value of the potentiometer to the serial console.
// Connect the Grove - Rotary Angle Sensor to the socket marked A0

// imports: serial en arduino
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Arduino arduino;

// Define the pin to which the angle sensor is connected.
int potentiometer = 0;

void setup()
{
    // Grove koppelen
    arduino = new Arduino(this, Arduino.list()[2], 57600);
    
    // Configure the angle sensor's pin for input.
    arduino.pinMode(potentiometer, Arduino.INPUT);
}

void draw()
{
    // Read the value of the sensor and print it to the serial console.
    int value = arduino.analogRead(potentiometer);
    println(value);

    // Wait 0.1 seconds between readings.
    delay(100);
}

