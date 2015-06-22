/* ---------------------------------------------------------
 AUDIO VISUALIZER
 Inspired by and designed for Kaskade's album Atmosphere
 -------------------------------------------------------- */

// import libraries
import ddf.minim.analysis.*;
import ddf.minim.*;

// global variables
Minim minim;
AudioPlayer[] album; 
AudioPlayer song;
AudioMetaData meta;
FFT fft;
PFont font;
PImage fade; // screenshot of sketch at each frame for fading effects
float radius = 1; // multiplier for star size/frequency
int countS = 0; // counter for background stars
float temp_x, temp2_x;
float temp_y, temp2_y;
color blue = color(70, 255, 255);
color pink = color(203, 13, 73);
color purple = color(86, 1, 95);
int track = 7; // current track

// setup the sketch
void setup() {

  minim = new Minim(this);
  
  // load album - change track number to change song playing
  album = new AudioPlayer[13];
  album[0] = minim.loadFile( "01 Last Chance (Feat. Project 46).mp3", 1024 );
  album[1] = minim.loadFile( "02 Why Ask Why (Feat. Late Night Alumni).mp3", 1024 );
  album[2] = minim.loadFile( "03 MIA To LAS.mp3", 1024 );
  album[3] = minim.loadFile( "04 No One Knows Who We Are (Feat. LIGHTS) (Kaskade's Atmosphere Mix).mp3", 1024 );
  album[4] = minim.loadFile( "05 Feeling The Night (Feat. Becky Jean Williams).mp3", 1024 );
  album[5] = minim.loadFile( "06 Take Your Mind Off.mp3", 1024 );
  album[6] = minim.loadFile( "07 LAX To JFK.mp3", 1024 );
  album[7] = minim.loadFile( "08 Atmosphere.mp3", 1024 );
  album[8] = minim.loadFile( "09 Missing You (Feat. School Of Seven Bells).mp3", 1024 );
  album[9] = minim.loadFile( "10 Something Something (Feat. Zip Zip Through The Night).mp3", 1024 );
  album[10] = minim.loadFile( "11 SFO To ORD.mp3", 1024 );
  album[11] = minim.loadFile( "12 Floating (Feat. Haley).mp3", 1024 );
  album[12] = minim.loadFile( "13 How It Is (Feat. Debra Fotheringham).mp3", 1024 );
  song = album[track];
  meta = song.getMetaData();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(60, 7); 
  font = loadFont("Avenir.vlw");

  size(displayWidth, displayHeight);
  noCursor();
  background(0);
  fade = get(0, 0, width, height);
  song.play();
}

void draw() {

  // perform fft on mix of left and right channels
  fft.forward(song.mix);

  // fades out the image of the previous drawing
  // increase/decrease alpha value to make fade out slower/faster
  background(0);
  tint(255, 255, 255, 248);
  image(fade, 0, 0);
  noTint();

  // iterate through array of frequency bands
  // and draw according to frequency size
  for ( int i = 0; i < fft.avgSize (); i++) {
    float r = fft.getAvg(i);
    temp_x = width/2;
    temp2_x = width/2;
    temp_y = height/2;
    temp2_y = height/2;

    // draw small frequencies as starts in the background
    if ( r <= 25) {
      if (countS % 100 == 0) {
        float x = random( 0, width );
        float y = random( 0, height );
        stroke(blue);
        fill(blue);
        ellipse(x, y, r/4, r/4);
        countS++;
      } else {
        countS++;
      }
    } else {
      // draw pink stars
      if ( r <= 290) {
        temp_x = random((width/2)-(r/4), (width/2)+(r/4));
        temp_y = random((height/2)-(r/4), (height/2)+(r/4));
        stroke(pink);
        fill(pink);
        ellipse(temp_x, temp_y, r*radius, r*radius);
      } 
      // draw purple stars
      else if ( r > 290 && r <= 310) {
        temp_x = random((width/2)-(r/4), (width/2)+(r/4));
        temp_y = random((height/2)-(r/4), (height/2)+(r/4));
        stroke(purple);
        fill(purple);
        ellipse(temp_x, temp_y, r*radius, r*radius);
      } 
      // draw blue stars
      else {
        temp_x = random((width/2)-(r/4), (width/2)+(r/4));
        temp_y = random((height/2)-(r/4), (height/2)+(r/4));
        temp2_x = random((width/2)-(r/4), (width/2)+(r/4));
        temp2_y = random((height/2)-(r/4), (height/2)+(r/4));
        stroke(blue);
        fill(blue);
        ellipse(temp_x, temp_y, r*radius, r*radius);
        ellipse(temp2_x, temp_y, r*radius, r*radius);
      }
    }
  }
  
  displayMeta();

  // take picture of sketch
  fade = get(0, 0, width, height);
  
}

// display song meta data
void displayMeta() {
  fill(200);
  textFont(font, 16);
  textAlign(LEFT);
  text( meta.author() + " - " + meta.album(), 50, 50);
  textAlign(RIGHT);
  text( meta.title(), width-50, 50);
}

// allow full screen sketches
boolean sketchFullScreen() {
  return true;
}

// key events
void keyPressed() {
  if (key==' ')exit();
  if (key=='s')saveFrame("visualizer.jpeg");
}

