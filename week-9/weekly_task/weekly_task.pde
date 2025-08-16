import processing.sound.*;

Ball ball;
int countdown = 11;
boolean game_started = false;

int time = 0; // check for how many milliseconds have passed

SoundFile collide;

void setup() {
  size(1200, 800);
  background(0);
  ball = new Ball();
  textSize(30);
  
  collide = new SoundFile(this, "../sound_effects/Hit damage 1.wav");
}

void draw() {
  ball.updatePos();
  background(0);
  ball.drawBall();
  
  if (game_started) {
    if (countdown > 0) {
      if (millis() - time >= 1000) {
        countdown -= 1;
        time = millis();
      }
      text("Score:", (width / 2) - 90, 40);
      ball.displayScore();
      text("Countdown: ", 20, 40);
      text(str(countdown), 200, 40);
    }
    else {
      text("Final Score:", (width / 2) - 160, 40);
      ball.displayScore();
    }
  }
  
  else {
    text("Press Enter to start game", 20, 40);
  }
}

void mousePressed() {
  ball.applyForce(mouseX, mouseY);
}

void keyPressed() {
  if (key == ENTER) {
    game_started = true;
  }
}
