% Data_Plot: This Program reads the text file of the joint coordinates and plots the coordinates
% in 3d space

% Written By: Andrew Mendez
% Email: mendeza@knights.ucf.edu

data=load('Gesture_Points_1(test).txt','r');

%THis is plotting the X and Y corrdinates for the 7th joint (i.e. the left hand joint)
z=(data(:,1));
X=(data(:,6));
y=(data(:,7));


plot3(X,y,z);