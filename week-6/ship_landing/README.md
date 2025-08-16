# Week-06 Task
Using at least 3 oscillators and/or filters, try to design a sound for a sci-fi movie, when the main characters arrive onto a new planet.
Pick a sketch from one of the previous weeks. Try to use the output from an oscillator as a parameter for the sketch. You may need to map it to a different domain. You can use it for example to control colour, shape or size of elements in your sketch.

### Requirements
Written in Processing 4.3\
Import Sound Library from The Processing Foundation

### Operation
Run ship_landing.pde in Processing.

### Screengrab
![First Iteration](histogram_screenshot.png)


### Design Notes

It was difficult for me to work with the Sine oscillator as I felt it was too digital of a sound to work as intended. The use of a lowpass filter really helped to soften the intensity of the Sine oscillator and I feel content with the results. 
Using the amplitude to change the colours used in the perlin noise animation was difficult at first as I struggle to work out how you would use it to make the colours change over time. I realised that I would need to map the amplitude to each RGB value of two colours and it ended up working correctly.
