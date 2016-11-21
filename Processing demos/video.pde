// Processing video player

// Video library importeren en variabele maken
import processing.video.*;
Movie myMovie;

// setup draait eenmalig
void setup() {
  fullScreen(1);
  //size(500, 500);
  // video inladen
  myMovie = new Movie(this, "/Users/Arthur/Desktop/sw.mov");
  // video spelen
  myMovie.play();
}

// draw draait continue
void draw() {
  // video tonen op scherm
  image(myMovie, 1000, 0);
}

// nodig voor video
void movieEvent(Movie m) {
  m.read();
}

// muisgebeurtenis
void mousePressed() {
  myMovie.jump(random(myMovie.duration()));
}