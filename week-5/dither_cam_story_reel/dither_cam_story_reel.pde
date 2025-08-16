import processing.video.*;

Capture cam;
color colorA;
color colorB;

void setup() {
  size(640, 480);
  // blue/yellow tones
  colorA = color(2,65,166);
  colorB = color(250,182,47);

  // this code sets up `cam` as a Capture device, using the first camera
  // on your computer.
  // if this doesn't work: speak to Tom
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, 640,480,cameras[0], 30);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }

  loadPixels();
  cam.loadPixels();
  for(int i = 0; i < cam.pixels.length; i++) { 
    pixels[i] = cam.pixels[i];
  }
  for(int i = 0; i < pixels.length; i++) {
        float greyValue = red(pixels[i]);
    
    // set a pixel to black or white based on its current greyscale value
    float newPixelValue = 0; 
    if (greyValue > 127) {
      newPixelValue = 255;
    }
    // error is the difference between the greyscale colour value taken from the red channel, and the thresholded new pixel value
    // e.g. if the greyscale was 188, and it got thresholded to 255, the error is 188 - 255 =  -67
    float error = greyValue - newPixelValue;
    pixels[i] = color(newPixelValue);
    fsDither(i, error);
  }
  for(int i = 0; i < pixels.length; i++) {
      pixels[i] = duotone(pixels[i], colorA, colorB);
  }
  updatePixels();
}

void keyPressed() {
  // pressing S will save the current frame to disk
  if(key == 's') {
    saveFrame("frame-######.jpg");
  }
}

color duotone(color pixel, color colorA, color colorB) {
  float tone = red(pixel);
  
  float lerpAmount = norm(tone,0,255);
  
  return lerpColor(colorA, colorB, lerpAmount);
}
void fsDither(int i, float error) {
  // Floyd-Steinberg Dithering
  // 7/16 of error goes to pixel to the right
  // 3/16 goes to pixel below and left
  // 5/16 goes directly below
  // 1/16 goes below and right
  
  // create an array of offsets
  int[] offsets = {
    1, width - 1, width, width + 1
  };
  
  float[] ditherRatios = {
    7/16.0, 3/16.0, 5/16.0, 1/16.0
  };
  
  for (int j = 0; j < offsets.length; j++) {
    int neighbourIndex = i + offsets[j];
    if (neighbourIndex < pixels.length) {
      float neighbourGrey = red(pixels[neighbourIndex]);
      pixels[neighbourIndex] = color(neighbourGrey + (error * ditherRatios[j]));
    }
  }
}
