float G = 0.1; // gravitational constant
float MAX_SPEED = 10;

class Asteroid {
  float mass;
  int size;
  float radius;
  PVector pos;
  PVector velocity;
  PVector acceleration = new PVector(0,0);
  color colour = color(random(50,255),random(50,255),random(50,255));
   
  Asteroid(float mass, int size, PVector velocity, PVector pos) {
    this.mass = mass;
    this.velocity = velocity;
    this.pos = pos;
    this.size = size;
    this.radius = this.size / 2;
  }
  
  void display() {
    fill(colour);
    circle(pos.x, pos.y, this.size);
  }
  
  void updatePos() {
    this.pos.add(this.velocity);
  }
  
  // method to loop through all other asteroids in the arrayList and apply their gravitational force on this asteroid
  // using Newton's gravitational law.
  void gravForce() {
    PVector total_force = new PVector(0,0);
    
    for( Asteroid other : asteroids) {
      if (this != other) { // skips check against itself
        // get direction vector from other asteroid to this asteroid
        PVector direction = PVector.sub(other.pos, this.pos);
        direction.normalize();
        float distance = PVector.dist(this.pos, other.pos);
        float scalar = newtonsLawGrav(this.mass, other.mass, distance);
        PVector force = PVector.mult(direction, scalar);
        total_force.add(force); 
      }
    }
      PVector acceleration = PVector.div(total_force, this.mass);
      this.velocity.add(acceleration);
  }
  
  float newtonsLawGrav(float mass1, float mass2, float distance) {
    float result = mass1 * mass2;
    distance += 1; // prevents distance from becoming too small so that forces do not fling asteroids
    result /= (distance * distance);
    result *= G;
    return result;
  }
  
  // method to wrap around bounds
  void checkBounds() {
    if (this.pos.x > width + this.radius) {
      this.pos.x = -this.radius;
    } 
    else if (this.pos.x < -this.radius) {
      this.pos.x = width + this.radius;
    } 
    if (this.pos.y > height + this.radius) {
      this.pos.y = -this.radius;
    } 
    else if (this.pos.y < -this.radius) {
      this.pos.y = height + this.radius; 
    }
  }
  
  void checkCollision() {
    // the for loop has to go backwards through the array as some asteroids might get skipped
    // this is because when an item is remove from somewhere in the list, all items to the right are shifted to the left by one index
    // if the next asteroid was also supposed to be removed, it has moved into the currently looked at index, meaning it will be skipped
    // as the check is already done
    for (int i = asteroids.size() - 1; i >= 0; i--) {
        Asteroid other = asteroids.get(i);
        if (this != other) { // check that this asteroid is not checking itself
            float distance = PVector.dist(this.pos, other.pos);
            if (distance < this.radius + other.radius) { // combine asteroids if they touch
                // combine asteroid propeties
                float new_mass = this.mass + other.mass;
                // conservation of momentum
                // calculate mass x velocity for both asteroids
                PVector mv_1 = PVector.mult(this.velocity, this.mass);
                PVector mv_2 = PVector.mult(other.velocity, other.mass);
                // add results together
                PVector new_velocity = PVector.add(mv_1, mv_2);
                // divide by mass total
                new_velocity.div(this.mass + other.mass);
                
                // add both positions together then divide by 2 (to get the mid point position of the two position vectors)
                PVector new_pos = PVector.add(this.pos, other.pos);
                new_pos.div(2);
                
                int new_size = this.size + other.size;
                new_size = min(new_size, 100); // cap size so that asteroids dont take up entire screen
                
                // spawn particle effects for explosions
                for (int j = 0; j < 20; j++) { 
                    particles.add(new Particle(new_pos.copy())); // have to use copy or they will share a pos vector with an asteroid which links their velocities in weird ways
                }
                
                // create new asteroid using the new parameter made from the old two asteroids
                Asteroid new_asteroid = new Asteroid(new_mass, new_size, new_velocity, new_pos);
                asteroids.add(new_asteroid);  
                asteroids.remove(other);     
                asteroids.remove(this);      
                
            }
        }
    }
  }
}
