# Data Products Assignment Documentation
RAHM  
January 26, 2016  

This document explains how to use the shiny app I created for Coursera's Data Products course taken in January 2016



# App Overview
This simple app allows any pair of variables from the mtcars dataset to be plotted against each other.
The app itself can be found by clicking on the tab labelled "View" (near the top of this screen).

In addition it shows the linear relationship between the two variables and allows the user to see, on selection, the 95% confidence interval for that linear relationship and the 95% confidence interval for point predictions made using the linear relationship.

# Changing the Plotted Parameters

Any of the following parameters may be selected on either the x or y axis of the plot:

mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb

If you are uncertain about what any of these means, or their units of measure, please select them for either axis in the app and look at the axis and plot titles. They should be self explanatory! 

# Adding a Linear Relationship
If you wish to add a line to the figure showing the least squares best fit linear model, select the first of the three check boxes under the heading "Modelling"

# Adding Confidence Intervals

### Confidence Interval for the Best Fit Line
To see the 95% confidence interval for the best fit line in the plot, select the second check box under the heading "Modelling".

### Confidence Interval for Points Predicted with the Model
To see the 95% confidence interval for individual predictions (of the Y value) made with the model (for a specific X value), select the third check box under the heading "Modelling".

# Data Source
The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973â74 models).



