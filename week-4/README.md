# Week-04 Task

Generate a 2D landscape using Perlin Noise and apply 
a duotone color effect based on the terrain heights.

## Requirements

Written in Processing 4.3

No special libraries required. 

## Operation

Run `weekly_task_duotone_noise.pde` in Processing.

## Screengrab


![Gif of Perlin Noise](2D_perlin_noise.gif)



## Design notes

- The main challenge for this sketch was understanding why changing the z axis over time resulted in an animated sketch
- I had to imagine the perlin noise as a large generated cube that has been sliced many times. Each time the z axis increases, a new "face", or cross-section, is displayed. This was difficult for me as it was hard to understand traversing through a 3D object and displaying it on a 2D screen.
- It took some playing with the lerpColor function to understand how it works as well, but I now understand that it just displays a colour between two colours provided. The closer to 0 the lerpAmount is, the more the resulting colour looks like ColourA. The closer to 1 it gets, the more the resulting colour looks like ColourB.