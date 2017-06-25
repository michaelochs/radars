## Summary:

When using `+[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:]` the radii are clamped too early when not all corners should be rounded.

When a rect of size 10.0, 20.0 is provided and a radii of 10.0, 10.0 is specified and only the top left and bottom left corner should be rounded it is not necessary for the bezier path to clip the width-radius to half the width of the frame, as there is no corner on the right that would need this space.

## Steps to Reproduce:

0. Open the attached playground and make sure the live view is visible
1. Run it
2. Move the slider

This will make the radii change between the bezier path’s width to double it’s width.

## Expected Results:

As only the left corners are rounded, the corner radii should not be clipped and the left side of the shape should always be a nice circle half.

## Actual Results:

The radius is clipped.