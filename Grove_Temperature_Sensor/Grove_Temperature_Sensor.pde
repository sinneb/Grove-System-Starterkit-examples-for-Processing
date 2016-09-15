// Demo of Grove - Starter Kit V2.0
// Edited for Processing: Arthur Bennis 2016-09-15

// Reads the value of the Grove - Temperature Sensor, converts it to a Celsius temperature,
// and prints it to the serial console.
// Connect the Grove - Temperature Sensor to the socket marked A0
// Open the Serial Monitor in the Arduino IDE after uploading

// imports: serial en arduino
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Arduino arduino;

// Define the pin to which the temperature sensor is connected.
int pinTemp = 0;

// Define the B-value of the thermistor.
// This value is a property of the thermistor used in the Grove - Temperature Sensor,
// and used to convert from the analog value it measures and a temperature value.
int B = 3975;

void setup()
{
    // Grove koppelen
    arduino = new Arduino(this, Arduino.list()[2], 57600);
}

void draw()
{
    // Get the (raw) value of the temperature sensor.
    int val = arduino.analogRead(pinTemp);

    // Determine the current resistance of the thermistor based on the sensor value.
    float resistance = (float)(1023-val)*10000/val;

    // Calculate the temperature based on the resistance value.
    float temperature = 1/(log(resistance/10000)/B+1/298.15)-273.15;

    // Print the temperature to the serial console.
    println(temperature);

    // Wait one second between measurements.
    delay(1000);
}

