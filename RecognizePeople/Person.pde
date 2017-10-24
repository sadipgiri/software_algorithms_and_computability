//import ddf.minim.*;

//Minim sound;
//AudioPlayer player1;

public class Person {
  PImage photo;
  
  //int currentPicture = 0;
  void showImage(String name) {  // this is mine
     photo = loadImage(name + "/" + name + ".png"); // Is the Processing function
  }
  
  /*void playSound(String name) {
    Minim sound;
    AudioPlayer player1;
    sound = new Minim(this);
    player1 = sound.loadFile(name + "/" + name + ".mp3");
    player1.play();
  }*/
  
  void draw() {
    image(photo, 230, 8, 350, 400);
    //player1.play();
    //player1.isPlaying();
  }
}

String getSoundFileName(String name) {
    return name + "/" + name + ".mp3";
}