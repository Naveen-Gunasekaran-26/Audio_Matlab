clear;
clear all;
clc;

FS = 48000;
TS = 1/FS;
t = 0:TS:1-TS;
f = 250;

% Sine wave 250 Hz
y = sin(2*pi*f*t);
% Converting into a column vector
y = y(:);


% Pan value Knob
% Range -100 to 100 (-100 -> completely Left, 100 -> completely right)
% 0 -> completely mono
panValue = 100; % Completely Right

x = panValue/200 + 0.5; % A variable to maintain the range(0,1)
rightAmplitude = sqrt(x);
leftAmplitude = sqrt(1-x);

% Sine-Law Law panned signal
z = [leftAmplitude.*y, rightAmplitude.*y];
sound(z,FS);

