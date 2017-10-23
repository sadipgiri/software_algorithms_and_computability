import processing.sound.*;
SoundFile file;      

PImage img;

void setup() {
  size(1000, 800);
  img = loadImage("sadip" + "/myPic" + ".png");
  
  file = new SoundFile(this, "myName.mp3");
  file.play();
}

void draw() {
  image(img, 0, 0, 1000, 800);
}