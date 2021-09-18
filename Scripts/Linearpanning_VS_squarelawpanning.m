clear;
clear all;
close all;
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
panValue = -30; 

% Linear panning
x = panValue/200 + 0.5; % A variable to maintain the range(0,1)


% The motivation for using the Square-Law functions is based on the 
% perceived strength of the signal across different panning positions. 
% By using the square-law functions, equal combined power between 
% the channels is achieved. Whereas, the linear panning functions 
% achieve equal combined amplitude. In many ways, listeners perceive 
% the strength of the signal based on the power, rather than the amplitude.
% In other words, listeners will perceive the same signal strength regardless
% of panning position when using the Square-Law functions.


% Difference b/w Linear panning and square law panning is
% the power (perceived loudness)
x = [0:0.01:1];
plot(x,x,x,1-x,x,sqrt(x),x,sqrt(1-x));
legend("LinearRightAmplitude","LinearLeftAmplitude","SqLawRightAmplitude","SqLawLeftAmplitude");
figure;

plot(x,x+(1-x),x,sqrt(x)+sqrt(1-x));
legend("LinearCombinedAmplitude","SqLawCombinedAmplitude");
figure;

plot(x,x.^2+(1-x).^2,x,(sqrt(x)).^2+(sqrt(1-x)).^2);
legend("LinearCombinedPower","SqLawCombinedPower");