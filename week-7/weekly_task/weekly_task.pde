//Using at least 4 samples, create a drum pattern. Make the pattern change in time. You could do that by:
//    - adding an element of randomness to at least one of the samples,
//    - alternate the pattern depending on time, e.g. count bars based on frameCount, seconds or milliseconds

//How to start (optional prompts):

//- Pick some samples and modify the example from class using them.
//- Pick a drum pattern or a beat from a song  and try to replicate it. If you're a beginner, replicating one of these would be a good start: Essential drum patterns (for hip hop).
//- Design your own beat using clapping, visuals, or however you like, and try to replicate it.

// A bar is a measure in beats
// 4/4, so there are 4 beats per bar

import processing.sound.*;

SoundFile percussion;
SoundFile snap;
SoundFile sub;
SoundFile clap;

int current_beat;
int bar_number;

float bpm = 228;
float myFrameRate = bpm / 60;

void setup() {
  size(500, 500);
  background(255);
  
  percussion = new SoundFile(this, "../chosen_samples/SOPHIE_percussion_01.wav");
  snap = new SoundFile(this, "../chosen_samples/SOPHIE_snap_03.wav");
  sub = new SoundFile(this, "../chosen_samples/SOPHIE_sub_with_kick_03_F.wav");
  clap = new SoundFile(this, "../chosen_samples/SOPHIE_clap_01.wav");
  
  
  frameRate(myFrameRate);
}

void draw() {
    background(random(255), random(255), random(255));
    
    // there are four beats in a bar
    // since it is currently one beat per frame, the number of bars is current frame / 4
    
    current_beat = frameCount % 4; // tracks which beat within a bar we are. 0, 1, 2, 3
    bar_number = frameCount / 4; // tracks total bars
    
    if (bar_number % 4 == 0){ // this line means, out of 4 bars, if we are in the first bar, do this. first bar is denoted by 0.
        percussion.play();
        if(current_beat == 1) {
          sub.play();
        }
    }
    else if (bar_number % 4 == 1) {
      if (current_beat % 2 == 0) {
        percussion.play();
      }
      else if (current_beat == 3) {
        clap.play();
      }
    }
    else if (bar_number % 4 == 2) { // modulo here means if the beat number is divisible by 2 with 0 remainders, result is true ie beat 0 and beat 2
      if (current_beat != 3) {
        percussion.play();
      }
      else {
        snap.play();
      }
    }
    else{
      if (current_beat % 2 == 0){
        sub.play();
      }
      else {
        clap.play();
      }
    }
}
