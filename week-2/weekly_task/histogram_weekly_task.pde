PImage sample;
void setup()
{
 size(720, 720);
 sample = loadImage("Ryo Asuka.jpg");
}

void draw()
{
 loadPixels(); 
 sample.loadPixels();
 
 // create an array for each colour channel
 int[] redHistogram = new int[256]; // from 0 to 255, which is 256 values in total. In java, fills each position with a 0 value, not NULL
 int[] greenHistogram = new int[256]; 
 int[] blueHistogram = new int[256]; 
 
 for (int i = 0; i < sample.pixels.length; i++)
 {
   int redPixelShade = int(red(sample.pixels[i]));
   int greenPixelShade = int(green(sample.pixels[i]));
   int bluePixelShade = int(blue(sample.pixels[i]));
   pixels[i] = color(sample.pixels[i]); // draw each pixel on the canvas using the image pixels in the same position    
   redHistogram[redPixelShade]++;
   greenHistogram[greenPixelShade]++;
   blueHistogram[bluePixelShade]++;
 }
 
 updatePixels();
 // made drawHistogram function to reuse code instead of having multiple blocks of the same code
 drawHistogram(redHistogram, color(255, 0, 0));
 drawHistogram(greenHistogram, color(0, 255, 0));
 drawHistogram(blueHistogram, color(0, 0, 255));
 
}

void drawHistogram(int[] histogram, color strokeColour)
{
  for (int i = 0; i < histogram.length; i++)
 {
   stroke(strokeColour);
   float startHeight = map(histogram[i], 0, max(histogram), height, height - (height / 2));
   line(i, startHeight, i, height);
 }
}
void keyPressed() {
  if (keyCode == ENTER){
    saveFrame("screenshot-####.png");
  }

}
