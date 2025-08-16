#### This sketch was expanded upon for the final submission

# Week-09 Task
Create an interactive sketch implementing Particle Systems and ArrayLists. The sketch should have:

- at least 3 vectors (PVector) for each particle: location, velocity, acceleration,
- at least one type of user interaction impacting the system,
- at least 1 randomised force impacting the system (e.g. wind).

### Requirements
Written in Processing 4.3\
import java.util.ArrayList

### Operation
Run weekly_task_asteroid_collision.pde in Processing.
Click in the sketch to spawn more asteroids.

### Screengrab

### Design Notes
A simulation using gravity as the main force for asteroids to move.
- I want the user to be able to place asteroids into the sketch
- I will need to find the equations for gravity and use numbers that can create at least a semi-realistic simulation of planetary bodies affecting one another through gravity

### Extra Changes for Final Assessment
- I added the ability for asteroids to be able to combine once they touch, forming a new asteroid with more mass and size
- I also used conservation of momemtum for the resulting new asteroid to have a realistic velocity which is the result of the mass and velocity of the colliding asteroids
- I added a particle effect that fades out over time when asteroids collide