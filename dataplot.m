data=load('Gesture_Points_1(test).txt','r');
z=(data(:,1));
X=(data(:,6));
y=(data(:,7));


plot3(X,y,z);