// startbestand voor werken met Processing en SEEED Grove
// versie 1, 21 september 2016
// 
// dit bestand laat de werking van het LCD, de LED en de lightsensor zien
//
// LCD -> aansluiten op een van de I2C poorten
// LED -> D7
// Lightsensor -> A0
//

// imports van libraries
import processing.serial.*;
import controlP5.*;
import cc.arduino.*;
import org.firmata.*;

// globale variabelen
Arduino arduino;
Serial serialPort;
ControlP5 cp5;
boolean running = false;
PImage img;

// settings, draait eenmalig
void settings() {
  size(470, 280);
}

// setup, draait eenmalig
void setup() {
  // Lijstje maken met porten van Arduino
  String[] arduinoPorts = Arduino.list();
  
  for (int i = 0; i < arduinoPorts.length; i++) {
    println(i + ": " + arduinoPorts[i]);
  }
  
  // vul tussen de [] het portnummer van je Arduino / Grove in
  // voor Mac vaak 2, voor PC vaak 0
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  
  // arduino digitale porten instellen
  arduino.pinMode(7, Arduino.OUTPUT);
  
  // init cp5 library
  cp5 = new ControlP5(this);
  
  // Labels plaatsen op canvas
  cp5.addTextlabel("label1")
     .setText("Processing en Grove, demo's")
     .setPosition(20,20)
     .setColorValue(0x000000)
     .setFont(createFont("Georgia",20))
     ;
  
  cp5.addTextlabel("label2")
     .setText("LCD FUNCTIES")
     .setPosition(20,80)
     .setColorValue(0x000000)
     ;

  // knoppen plaatsen op canvas
  cp5.addButton("lcdknop1")
     .setLabel("LCD aan")
     .setPosition(20,100)
     .setSize(100,19)
     ;
     
  cp5.addButton("lcdknop2")
     .setLabel("Print LCD")
     .setPosition(20,130)
     .setSize(100,19)
     ;
     
  cp5.addButton("lcdknop3")
     .setLabel("Zet positie LCD")
     .setPosition(20,160)
     .setSize(100,19)
     ;
   
  cp5.addButton("lcdknop4")
     .setLabel("Zet kleur LCD")
     .setPosition(20,190)
     .setSize(100,19)
     ;
     
  cp5.addButton("ledknop1")
     .setLabel("Zet LED aan")
     .setPosition(140,100)
     .setSize(100,19)
     ;
     
  // afbeelding inladen voor lightsensor demo
  img = loadImage("han.png");
  
}

// draw, deze functie draait continue
void draw() {
  background(255);
  running = true;
  
  // lightsensor waarde uitlezen
  int sensorValue = arduino.analogRead(0);
  // toon afbeelding met sensorValue als y coordinaat
  image(img, 300, sensorValue);
}

// function behorende bij de knoppen (knopnaam = functienaam)
public void lcdknop1() {
  if (running) {
    arduino.startLCD();
  };
}

public void lcdknop2() {
  if (running) {
    arduino.printLCD("user error");
  };
}

public void lcdknop3() {
  if (running) {
    arduino.setPositionLCD(2,4);
  };
}

public void lcdknop4() {
  if (running) {
    arduino.setRGBLCD(255,0,0);
  };
}

public void ledknop1() {
  if (running) {
    arduino.digitalWrite(7,Arduino.HIGH);
  };
}

// exit, eenmalig bij uitzetten
void exit() {
  // zet LCD uit
  arduino.stopLCD();
  // zet LED uit
  arduino.digitalWrite(7,Arduino.LOW);
  super.exit();
}