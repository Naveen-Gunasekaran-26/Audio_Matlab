% RMS value Normalization
clear;
clear all;


FS = 48000;
TS = 1/FS;
f = 3;
t = 0:TS:1-TS;
t = t(:);


% Sine wave 3Hz
y = sin(2*pi*f*t);


% RMS on a linear scale
squared = y.^2;
meanSquared = sum(squared)/length(y);
rootMeanSquared = sqrt(meanSquared);


% RMS converted to dB scale
rootMeanSquared_dB = 20*log10(rootMeanSquared/1);


% Desired RMS Value
desiredRMS = -6;
% Desired RMS Value in dB
desiredRMS_dB = 20*log10(desiredRMS/1);


% Scaling the input by a factor
a = (desiredRMS_dB^2)/meanSquared;
z = a*y;

plot(t,y);
hold on;