

class Ball {
  PVector position;
  PVector velocity;
  PVector gravity;
  int ball_size;
  int radius;
  float damping_amount; // how much to reduce velocity by when hitting a wall
  int score;
  boolean collidingX;
  boolean collidingY;
  
  Ball() {
    this.position = new PVector(width/2, height/2);
    this.velocity = new PVector(0,0);
    this.gravity = new PVector(0,0.5);
    this.damping_amount = 0.8; // used to simulate loss of momentum from collisions
    this.ball_size = 70;
    this.radius = ball_size/2;
    this.score = 0;
    this.collidingX = true;
    this.collidingY = true;
  }
  
  void displayScore() {
    fill(255);
    text(str(this.score), width / 2, 40);
    
  }
  
  void drawBall() {
    fill(255);
    circle(this.position.x, this.position.y, this.ball_size);
  }
  
  void updatePos() {
    // add gravity as a constant force on the ball
    this.velocity.add(this.gravity);
    // change pos of ball based on current velocity
    this.position.add(this.velocity);
    
    // check bounds
    if (this.position.x > width - this.radius) {
      this.position.x = width - this.radius; // had to clamp the pos otherwise the ball slowly sinks through the walls
      this.velocity.x *= -1 * damping_amount;
      if (collidingX) {
        collide.play();
        this.collidingX = !this.collidingX;
      }
      if (countdown > 0 && game_started == true) this.score += 1;
    }
    else if (this.position.x < this.radius) {
      this.position.x = this.radius;
      this.velocity.x *= -1 * damping_amount;
      if (collidingX) {
        collide.play();
        this.collidingX = !this.collidingX;
      }
      if (countdown > 0 && game_started == true) this.score += 1;
    }
    else this.collidingX = true;
    
    if (this.position.y > height - this.radius) {
      this.position.y = height - this.radius;
      this.velocity.y *= -1 * damping_amount;
      // this part is necessary to stop the sound from playing over and over whilst touching a wall
      if (collidingY) {
        collide.play();
        this.collidingY = !this.collidingY;
      }
    }
    else if (this.position.y < this.radius) {
      this.position.y = this.radius;
      this.velocity.y *= -1 * damping_amount;
      if (collidingY) {
        collide.play();
        this.collidingY = !this.collidingY;
      }
      if (countdown > 0 && game_started == true) this.score += 1;
    }
    else this.collidingY = true;
  }
  
  void applyForce(int x, int y) {
    float forceAmount = 10;
    PVector mouseVector = new PVector(x,y);
    // to get the vector from mouse pos to ball pos, subtract mouse pos from ball pos
    PVector direction = PVector.sub(this.position, mouseVector);
    // only the direction matters, so normalise the vector
    direction.normalize();
    
    // multiply the normalised direction with forceAmount as the scalar to create a force of magnitude forceAmount in the direction
    PVector force = PVector.mult(direction, forceAmount);
    // apply the force to the velocity
    this.velocity.add(force);
  }
}
