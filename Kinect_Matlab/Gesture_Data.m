%Gesture_Data: This Program will display the joints of the left and the right hand
%Also the program wil save the joint coordinates of the left hand into a text file.
%
%Written By: Andrew Mendez
% Email: mendeza@knights.ucf.edu

addpath('Mex')
SAMPLE_XML_PATH='Config/SamplesConfig.xml';

% Start the Kinect Process
filename='Example/Gesture_1c.oni';
KinectHandles=mxNiCreateContext(SAMPLE_XML_PATH,filename);
fid=fopen('Gesture_Points_1b(test).txt','w');
num=0;
% To use the Kinect hardware use :
%KinectHandles=mxNiCreateContext(SAMPLE_XML_PATH);

figure,
Pos= mxNiSkeleton(KinectHandles); 
I=mxNiPhoto(KinectHandles); I=permute(I,[3 2 1]);
h=imshow(I);
        
while(Pos(1)==0);
    mxNiUpdateContext(KinectHandles);
    I=mxNiPhoto(KinectHandles); I=permute(I,[3 2 1]);
    Pos= mxNiSkeleton(KinectHandles); 
    set(h,'Cdata',I); drawnow;
end

hh=zeros(1,9);
while(Pos(1)>0)
    mxNiUpdateContext(KinectHandles);
    I=mxNiPhoto(KinectHandles); I=permute(I,[3 2 1]);
    set(h,'Cdata',I); drawnow;
    Pos= mxNiSkeleton(KinectHandles,1); 
    if(hh(1)>0);
        for i=1:1, delete(hh(1)); end
    end
    
    hold on
    y=Pos(1:15,7);
    x=Pos(1:15,6);
    hh(1)=plot(x(3:8),y(3:8),'r.');
	%This line saves the coordinates Left arm shoulder joint,elbow joint, and  hand.
    fprintf(fid,'%d %.2f %.2f %.2f %.2f %.2f %.2f\n',num,x(6),y(6),x(7),y(7),x(8),y(8));
    num=num+1;
    %hh(2)=plot(x([13 14 15]),y([13 14 15]),'g');
    %hh(3)=plot(x([10 11 12]),y([10 11 12]),'g');
    %hh(4)=plot(x([9 10]),y([9 10]),'m');
    %hh(5)=plot(x([9 13]),y([9 13]),'m');
    %hh(6)=plot(x([2 3 4 5]),y([2 3 4 5]),'b');
    %hh(7)=plot(x([2 6 7 8]),y([2 6 7 8]),'b');
    %hh(8)=plot(x([1 2]),y([1 2]),'c');
    %hh(9)=plot(x([2 9]),y([2 9]),'c');
    drawnow
end            
    
fclose(fid);
mxNiDeleteContext(KinectHandles);


    