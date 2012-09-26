% This function mxNiCreateContext, connects to the Microsoft Kinect-hardware 
% or stored Kinect movie. And initializes objects  such as image, IR 
% and Depth streams.
%
% KinectHandles = mxNiCreateContext(XMLfilename,filename);
%
% inputs,
%   XMLfilename : Name of the XML file with avaiable kinect-nodes 
%   (optional)
%   ONIfilename : Create Objects not from the Kinect Hardware, but stored
%                   Kinect movie
% outputs,
%   KinectHandles : Array with pointers to kinect node objects generated by
%          mxNiCreateContext, such as main, image, IR, Depth and User node.
%
% Note, 
%   You always have to close the Kinect-Hardware Connection and remove
%   the Kinect Objects after usage. By running DeleteContext(KinectHandles);
%
%
% See also mxNiUpdateContext, mxNiDepth, mxNiPhoto, mxNiInfrared, 
%		mxNiSkeleton, mxNiDepthRealWorld, mxNiDeleteContext, compile_cpp_files
%
% Mex-Wrapper is written by D.Kroon University of Twente (February 2011)  
