// video met Grove

// imports: video, serial en arduino
import processing.video.*;
import processing.serial.*;
import cc.arduino.*;

// variabelen klaarzetten
Movie myMovie;
Arduino arduino;

void setup() {
  // Grove koppelen
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  // Pinnen instellen op Grove
  arduino.pinMode(6, Arduino.INPUT);
  
  //fullScreen(2);
  size(640, 480);
  
  // video inladen en starten
  myMovie = new Movie(this, "/Users/Arthur/Desktop/testmovie.mov");
  myMovie.play();
}

void draw() {
  // video tonen op scherm
  image(myMovie, 0, 0);
  //image(myMovie, mouseX-myMovie.width/2, mouseY-myMovie.height/2);
  
  // reageren op Grove gebeurtenissen
  if (arduino.digitalRead(6) == Arduino.HIGH) {
    myMovie.jump(random(myMovie.duration()));
  }
}

// nodig voor video
void movieEvent(Movie m) {
  m.read();
}

// muisgebeurtenis
void mousePressed() {
  myMovie.jump(random(myMovie.duration()));
}