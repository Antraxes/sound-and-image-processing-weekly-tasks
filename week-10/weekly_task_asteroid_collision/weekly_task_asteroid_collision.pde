import java.util.ArrayList;


ArrayList<Asteroid> asteroids;
ArrayList<Particle> particles;
int num_asteroids = 100;
int asteroid_size = 20;
int mass = 100;

void setup() {
  
  size(800, 800);
  particles = new ArrayList<Particle>();
  
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < num_asteroids; i++) {
    PVector random_position = new PVector(int(random(asteroid_size /2, width + 1)) - asteroid_size, int(random(asteroid_size /2, height + 1)) - asteroid_size);
    asteroids.add(new Asteroid(mass, asteroid_size, new PVector(0,0), random_position));
  }
}

void draw() {
  background(0); 
  fill(255);

  //// Make a copy of asteroids to safely iterate while modifying the list
  //ArrayList<Asteroid> asteroids_copy = new ArrayList<Asteroid>(asteroids);

  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid asteroid = asteroids.get(i);
    asteroid.gravForce();
    asteroid.updatePos();
    asteroid.checkBounds();
    asteroid.checkCollision();  // merges asteroids if they collide
    asteroid.display();
  }
  
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle particle = particles.get(i);
    particle.update();
    particle.display();
    if (particle.lifespan <= 0) {
      particles.remove(i);
    }
  }
}
void mouseClicked() {
  PVector position = new PVector(mouseX, mouseY);
  asteroids.add(new Asteroid(mass, asteroid_size, new PVector(0, 2), position));
}
