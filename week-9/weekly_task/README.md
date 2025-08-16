# Week-09 Task
Make a game using all of the below:
- at least 1 class
- at least 2 forces influencing the object movement
- at least 1 type of interaction.

### Requirements
Written in Processing 4.3\
Import Sound Library from The Processing Foundation

### Operation
Run weekly_task.pde in Processing.

### Screengrab
https://drive.google.com/file/d/1ghlGC-AG3Ztm2TRuxsJR5BbiRh_puof2/view?usp=sharing

### Design Notes
a game where the user has to throw a ball against the wall as many times as possible within a timeframe
I need to:
- Create a Ball object, which contains properties for velocity, size, position and has methods for displaying the ball, updating the velocity, and doing bounds checks for collision against the wall
    - size position and velocity can be represented as vectors
    - the user should be able to apply a force to the ball to move it
    - maybe use mouse pos when the mouse is clicked to decide on the direction of the force vector
- Implement gravity and collision dampening to simulate loss of momemtum when a wall or floor is hit
- The game needs to track how many times the ball has collided with the wall
- The game should display the score and the countdown timer
