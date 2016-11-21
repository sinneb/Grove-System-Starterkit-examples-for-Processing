/*

Processing test sketch voor Arduino, Seeed Grove en Processing.
Gebruik dit programma om het portnummer van je Grove te vinden.

Windows: waarschijnlijk port 0 (com3: of com4:)
Mac: waarschijnlijk port 2 (/dev/cu.usbmodem1411 oid)

Je portnummer gebruik je in de rest van de programma's om verbinding te maken met je Grove.

*/

import processing.serial.*;
import cc.arduino.*;
Arduino arduino;


void setup() {
  size(600, 400);

  // Lijstje maken met porten van Arduino
  String[] arduinoPorts = Arduino.list();
  
  // Netjes presenteren in de serial monitor.
  for (int portnr = 0; portnr < arduinoPorts.length; portnr++) {
    println("portnummer " + portnr + " = " + arduinoPorts[portnr]);
  }
}

void draw() {
}