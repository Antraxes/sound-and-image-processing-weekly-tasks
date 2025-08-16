import processing.sound.*;

SawOsc oscillator;
LowPass filter;
WhiteNoise white_noise;
SinOsc ship_noise;
float amplitude;
color colourA;
color colourB;


// This sketch is my attempt to make the sound effect of a ship landing.
// I want to create the sound of depressurisation of an airlock.

void setup() {
  size(400,400);
//  colourA = color(209, 4, 128); // pink, will turn into purple (48, 0, 29)
//  colourB = color(0, 166, 255); // blue, will be much darker (0, 23, 36)
  
  amplitude = 1;
  
  white_noise = new WhiteNoise(this);
  white_noise.amp(amplitude);
  white_noise.play();
  
  // sound effect of ship powering down after landing
  ship_noise = new SinOsc(this);
  ship_noise.amp(amplitude * 0.2);
  ship_noise.play();
  
  // attaches filter to white_noise - this also makes freq() work differently
  filter = new LowPass(this);
  filter.process(white_noise);
}

void draw() {
  background(0);
  
  // make the amplitude decrease every loop
  amplitude *= 0.994; // tweaked the value so that the audio was hearable for long enough. 0.99 felt too fast, 0.999 felt too slow
  white_noise.amp(amplitude);
  ship_noise.amp(amplitude * 0.1); // 1 amplitude was way too loud, tweaked with it until I liked it
  
  // change the cutoff for the filter as amplitude decreases
  float cutoff = map(amplitude, 1, 0, 6000, 200);
  filter.freq(cutoff); // freq(parameter) parameter is the cutoff for the filter if there is a filter attached
  
  float powering_down = map(amplitude, 1, 0, 300, 50); 
  ship_noise.freq(powering_down); // freq(parameter) parameter is the frequency the oscillator has been set to, only does this if no filter is attached
                                  // you can see this in Processing Documentation as SinOsc and LowPass both have freq() as a method.
  
  colourA = color(map(amplitude, 1, 0, 209, 48), map(amplitude, 1, 0, 4, 0), map(amplitude, 1, 0, 128, 29)); // pink will turn into purple (48, 0, 29) as amp decreases
  colourB = color(0, map(amplitude, 1, 0, 166, 23), map(amplitude, 1, 0, 255, 36));
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;

    pixels[i] = color(map(noise(x * 0.01, y * 0.01, frameCount * 0.1), 0, 1, 0, 255));// set the value at each x/y
    pixels[i] = duotone(pixels[i], colourA, colourB);
  }
  
  updatePixels();

}

color duotone(color pixel, color colourA, color colourB){
  // lerp allows you to ask for a specific % value between two values
  // on a scale e.g 0.5 is halfway between the two values
  // this is because lerp only allows for a value between 0 and 1
  float tone = (red(pixel) + green(pixel) + blue(pixel)) / 3;
  // norm changes the range of a value to 0 and 1, it's like map but not for any range
  // the map equivalent would be map(tone, 0, 255, 0, 1)
  float lerpAmount = norm(tone, 0, 255);
  
  //lerpColor returns a color between two colors
  // it has parameters of first_colour, second_colour, value from 0 - 1 (like percentage)
  return lerpColor(colourA, colourB, lerpAmount);

}
