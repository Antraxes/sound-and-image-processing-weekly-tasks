PImage sample;

void setup() {
  size(517, 606);
  sample = loadImage("sample.jpg");
  noLoop();
}

void draw() {
  image(sample, 0, 0);
  
  loadPixels();
  
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
    atkinsonDither(i, error);
    

  }
  updatePixels();
    
}

void diffuseError(int i, float error) {
  if (i < pixels.length - 1) {
      float newGreyValue = red(pixels[i+1]);
      pixels[i+1] = color(newGreyValue + error);
    }
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

void atkinsonDither(int i, float error) {
  // Atkinson Dithering
  // 1/8 of the rror is applied to:
  // - 1 Pixel to the right
  // - 2 Pixels to the right
  // - 1 Pixel Below (directly, and diagonally)
  // - 2 Pixels Below
  int[] offsets = {
    1, 2, width -1, width, width + 1, 2 * width
  };
  for (int j = 0; j < offsets.length; j++) {
    int neighbourIndex = i + offsets[j];
    if (neighbourIndex < pixels.length) {
      float neighbourGrey = red(pixels[neighbourIndex]);
      pixels[neighbourIndex] = color(neighbourGrey + (error / 8.0));
    }
  }
}
