void setup(){
  size(400, 400);
}
// black is 0,0,0
// white is 255,255,255
void draw(){
  loadPixels();
  
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      float distanceToCenter = dist(x, y, width/2, height/2);
      float maxDistance = dist(0, 0, width/2, height/2);
      float normalisedDist = map(distanceToCenter, 0, maxDistance, 0, 1); // scaling a range into a range of 0 and 1 is called normalising
      float colourValue = 255 * (1 - normalisedDist);
      color c = color(50, colourValue, colourValue);
      pixels[x + y * width] = c; // correctly index to the 1D pixels
    }
  }
  updatePixels();
  
}

void keyPressed() {
  if (keyCode == ENTER){
    saveFrame("screenshot-####.png");
  }

}
