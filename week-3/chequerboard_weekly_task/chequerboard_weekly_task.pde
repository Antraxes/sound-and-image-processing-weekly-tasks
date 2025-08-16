int circleSize = 100; //used to control size of circle and also how much to step for next circle
float r = random(0, 255);
float g = random(0, 255);
float b = random(0, 255);
int alternator; // used to alternate colours based on y position
  
void setup()
{
  size(400, 600);
}

void draw()
{
  background(0);
  translate(circleSize / 2, circleSize / 2);
  circle(0, 0, circleSize);

  for(int y = 0; y < height / circleSize; y++)
  {
    for(int x = 0; x < width / circleSize; x++)
    {
      if (y % 2 == 0) {
        alternator = 0;
      }
      else {
        alternator = 1;
      }
      if (x % 2 == alternator)
        {
          fill(r, g, b);
        }
      else
        {
          fill(255);
        }

      circle(x * circleSize, y * circleSize, circleSize);
    }
  } 
}
void keyPressed() {
  if (keyCode == ENTER){
    saveFrame("screenshot-####.png");
  }

}
