clc;
clear;
clear all;
close all;

[y,FS] = audioread("Sounds/Dream within a Dream Sample.wav");
left = y(:,1);
right = y(:,2);
y = 1/2 * (left+right); %MidChannel Information
t = [0:length(y)-1]*(1/FS);
t = t(:);

lfo_frequency = 0.25;
panValue = 100*sin(2*pi*lfo_frequency*t);
x = panValue/200 + 0.5;

rightAmplitude = sqrt(x);
leftAmplitude = sqrt(1-x);

stereoSignal = [leftAmplitude.*y, rightAmplitude.*y];
sound(stereoSignal,FS);