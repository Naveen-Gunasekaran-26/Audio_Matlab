clear;
clear all;
clc;

FS = 48000;
TS = 1/FS;
n = 0:TS:1-TS;
factor = 24;
start = FS - (FS/factor);
from = 1;
to = 0;
length = length(n)-start;

% Manually calculated ramp curve for a given range
division = (to-from)/length;
ramp = [ones(1,start-1) from:division:to];

sinewave = sin(2*pi*330*n);

plot(ramp);