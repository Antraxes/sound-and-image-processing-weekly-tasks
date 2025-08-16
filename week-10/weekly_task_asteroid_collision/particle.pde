class Particle {
  PVector pos;
  PVector velocity;
  int lifespan;
  color colour;

  Particle (PVector pos) {
    this.pos = pos;
    this.velocity = new PVector(random(-4,4), random(-4,4));
    this.lifespan = int(random(150, 1000));
    this.colour = color(random(150,255),random(150,255),random(150,255));
  }
  
  void display() {
    noStroke();
    // makes sure that particle starts fully opaque and then goes transparent over time
    float alpha_amount = map(this.lifespan, 150, 255, 0, 255); 
    fill(colour, alpha_amount);
    circle(pos.x, pos.y, 4);
  }
  
  void update() {
    this.pos.add(this.velocity);
    this.lifespan -= 5;
  }
}
