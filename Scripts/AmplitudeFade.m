clear;
clear all;
clc;

FS = 48000;
TS = 1/FS;
t = 0:TS:1-TS;
f = 250;

% Sine wave 250 Hz
y = sin(2*pi*f*t);

% Linear fading
linearRamp = linspace(1,0,length(y));
x = y.*linearRamp;

% Smoothing Attack and Release by fading
factor = 8;
fadingLength = length(y)/factor;
% exp 2 for convex curve, exp 1/2 for concave curve
attack = [linspace(0,1,fadingLength).^(1/2) ones(1,length(y)-fadingLength)];
release = [ones(1,length(y)-fadingLength) linspace(1,0,fadingLength).^(2)];
z = y.*attack.*release;
plot(z)
sound(z,FS);