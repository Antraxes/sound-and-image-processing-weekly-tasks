void setup() {
  size(400, 300);
}

void draw() {
  
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      // Calculate a color based on the x-coordinate.
      // You can adjust these values to change the gradient's appearance.
      float normalizedY = map(y, 0, height - 1, 0, 1); // Normalize x to 0-1
      int red = int(255 * normalizedY);            // Red increases with x
      int green = 0;                             // Green stays at 0
      int blue = int(255 * (1 - normalizedY));     // Blue decreases with x

      // Create the color
      color c = color(red, green, blue);

      // Set the pixel
      pixels[x + y * width] = c; // Correctly index the 1D pixel array
    }
  }
  updatePixels();
}
void keyPressed() {
  if (keyCode == ENTER){
    saveFrame("screenshot-####.png");
  }

}
