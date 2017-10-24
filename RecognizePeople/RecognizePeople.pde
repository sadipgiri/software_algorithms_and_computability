/*Everest Team: Sadip Giri*/

/* A little app that has a data set where the data is a pair:  
   a picture and a sound - and for implementation purposes 
   I need a name to identify the datum I am currently refering to.
   
   So I need a data folder that has a sequence of?
   Since I have a collection of folders (hmmm, why did I make you put is in folders,
   I can ITERATE through the names of the folders.
   
   PImage photo; // I declare a variable that is a PImage.
  photo = loadImage("laDefense.jpg");// I can specify a path name.
  
  How am I going to impement buttons?
  
  
}
*/

//Person [] people = new Person[20];
//Person [] people = new Person[3];
//import ddf.minim.*;

Person people1 = new Person();
//SoundFile file;

// This is temporary, its just for testing //
String [] names = {"NIDESHCHITRAKAR","NATEGUEVIN","OLIVERWODUNNE"};
int currentPicture = 0;

//AudioPlayer[] players = new AudioPlayer[3];


void setup() {
   size(800,600);
   background(0, 0, 0);
   people1.showImage(names[currentPicture]);
   //people1.playSound(names[currentPicture]);
//   Minim m = new Minim(this);
//   for (int i = 0; i < players.length; i++) {
//     players[i] = m.loadFile(names[currentPicture] + "/" + names[currentPicture] + ".mp3");   
// }
  //people1.playSound(names[currentPicture]);
}

void displayPictureAndSound() {
  //  showNextPlayButton();
 //  showNextPicture();
} 
void showNextButton() {
  /* not sure how I want to do this yet.... for now maybe just
  look for a keypress */
}
/* Draw is only going to be implemented when the button tells it to. */
void draw() {
  //image(photo, 0, 0);
  //people1.draw();
  people1.draw();
  //players[currentPicture].play();
  //people1.playSound(names[currentPicture]);
}


void keyPressed () {
  
  switch (keyCode) {
    
    case RIGHT:
      changePhotoToRight();
      break;
      
    case LEFT:
      changePhotoToLeft();
      break;
  }

}

void changePhotoToRight() {
  if (currentPicture < 3) {
    //players[currentPicture].play();
    currentPicture = currentPicture + 1;
    people1.showImage(names[currentPicture]);
    //people1.playSound(names[currentPicture]);
    /*if(!players[currentPicture].isPlaying())
    players[currentPicture = (currentPicture + 1) % players.length].play();
    //people1.playSound(names[currentPicture]);*/
  };
}

void changePhotoToLeft() {
  if (currentPicture > 0) {
    //players[currentPicture].play();
    currentPicture = currentPicture - 1;
    people1.showImage(names[currentPicture]);
    //people1.playSound(names[currentPicture]);
    /*if(!players[currentPicture].isPlaying())
    players[currentPicture = (currentPicture + 1) % players.length].play();
    //people1.playSound(names[currentPicture]);*/
  };
}