import processing.sound.*;

SoundFile sample1;
SoundFile sample2;
SoundFile sample3;

float bpm = 120; // beats per minute

float myFrameRate = bpm / 60; // frame rate = beats per second

void setup() {
  size(640, 360);
  background(255);

  // Load a soundfile from the /data folder of the sketch and play it back
  // https://processing.org/reference/libraries/sound/SoundFile.html
  sample1 = new SoundFile(this, "../samples/Clicky wood 001.wav");
  // set amplitude
  //sample1.amp(1.0);
  // playback rate
  // * 2 for octave higher
  // -1 to pllay backwards
  //sample1.rate(1.0);
  sample2 = new SoundFile(this, "../samples/kick_w_echo_1s.wav");
  frameRate(myFrameRate);
}

void draw() {
  background(random(255), random(255), random(255));
  
  
  // play every beat
  sample1.play();
  
  //// play every fourth beat
  //if (frameCount % 4 == 0) {
  //  sample2.play();
  //}
}
