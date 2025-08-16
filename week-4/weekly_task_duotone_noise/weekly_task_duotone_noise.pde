PImage picture;
color colourA, colourB;

void setup() {
  size(600,600);
  colourA = color(209, 4, 128); // pink
  colourB = color(0, 166, 255); // blue
}

void draw() {
  loadPixels();
  
  for(int i = 0; i < pixels.length; i++) {
    int x = i % width;
    int y = i / width;
    
    pixels[i] = color(map(noise(x * 0.01, y * 0.01, frameCount * 0.1), 0, 1, 0, 255));// set the value at each x/y
    pixels[i] = duotone(pixels[i], colourA, colourB);
  }
  
  updatePixels();
}

void mousePressed() {
  redraw();
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
