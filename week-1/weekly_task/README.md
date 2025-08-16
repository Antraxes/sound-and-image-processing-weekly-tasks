# Week-01 Task
Edit the provided example sketch to change the direction of the gradient.
Edit the provided example sketch to create a circular gradient.
### Requirements
Written in Processing 4.3\
No special libraries required.

### Operation
Run center_gradient.pde in Processing.
Run y_axis_gradient.pde in Processing.

### Screengrab

##### y_axis_gradient
![Second Iteration](y_axis_gradient\y_axis_gradient_screenshot.png)

##### center_gradient
![Second Iteration](center_gradient\center_gradient_screenshot.png)


### Design Notes
It was difficult at first to understand how to convert a 2D x,y grid into 1D to apply the new colours to each pixel in the 1D pixel array, but once I was given the formula for it, it made more sense to me. 

##### y_axis_gradient
For this sketch, I replaced normalisedX with normalisedY and calculated it using the height variable instead of the width variable. This caused the colour gradient to go from top to bottom instead of left to right.

##### center_gradient
For this sketch, I wanted to increase the green and blue values in RGB as a pixel got closer to the center, but keep R constant. 
I calculate the maximum possible distance a pixel could be from the center, then for each pixel calculated how far it actually was. Using these two values, I could use map to normalize the range. I could then use that normalised value to increase the value of G and B up to 255 using a percentage of it. The percentage increase as a pixel gets closer to the center, up to a maximum of 100% at the center.