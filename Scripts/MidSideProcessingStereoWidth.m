clc;
clear;
clear all;
close all;

fileName = "Sounds/Dream within a Dream Sample.wav";
[audio, FS] = audioread(fileName);
audio = 0.3 * audio;

t = [0:length(audio)-1]*(1/FS);
t = t(:);

left = audio(:,1);
right = audio(:,2);

% Mid-side encoding
sideChannel = (1/2) * (left-right);
midChannel = (1/2) * (left+right);

% Mid-Side processing
% Width - Range 0(Narrow) to 2(Wide)
width = 2;
sideChannel = sideChannel * width;
midChannel = midChannel * (2-width);

% Mide-side decoding
newLeft = midChannel + sideChannel;
newRight = midChannel - sideChannel;

decodedSignal = [newLeft, newRight];
sound(decodedSignal, FS);