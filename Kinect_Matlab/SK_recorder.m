%SK_Recorder:This Program will record the RGB and Depth videos when the Skeleton is generated

%Written By: Andrew Mendez
% Email: mendeza@knights.ucf.edu

addpath('Mex')
SAMPLE_XML_PATH='Config/SamplesConfig.xml';


KinectHandles=mxNiCreateContext(SAMPLE_XML_PATH);

figure,
Pos= mxNiSkeleton(KinectHandles); 
I=mxNiPhoto(KinectHandles); I=permute(I,[3 2 1]);
h=imshow(I);

CaptureHandle=mxNiStartCapture(KinectHandles,'Gesture_1c.oni');



        
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
        for i=1:9, delete(hh(i)); end
    end
    
    hold on
    y=Pos(1:15,7);
    x=Pos(1:15,6);

    A=x([2 3 4 5]),y([2 3 4 5]);
    hh(1)=plot(x,y,'r.');
    hh(2)=plot(x([13 14 15]),y([13 14 15]),'g');
    hh(3)=plot(x([10 11 12]),y([10 11 12]),'g');
    hh(4)=plot(x([9 10]),y([9 10]),'m');
    hh(5)=plot(x([9 13]),y([9 13]),'m');
    hh(6)=plot(x([2 3 4 5]),y([2 3 4 5]),'b');
    hh(7)=plot(x([2 6 7 8]),y([2 6 7 8]),'b');
    hh(8)=plot(x([1 2]),y([1 2]),'c');
    hh(9)=plot(x([2 9]),y([2 9]),'c');
    drawnow
end            
mxNiStopCapture(CaptureHandle)

mxNiDeleteContext(KinectHandles);