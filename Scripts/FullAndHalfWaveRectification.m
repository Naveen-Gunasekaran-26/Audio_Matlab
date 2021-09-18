clc;
clear;
clear all;
close all;

addpath("../Functions");

FS = 48000;
TS = 1/FS;
t = 0:TS:1-TS;
t = t(:);

input = sin(2*pi*3*t);
input = input/2;
fullWaveRectifiedSignal = fullWaveRectification(input);
halfWaveRectifiedSignal = halfWaveRectification(input);

plot(t,input,"b");
legend("Input");
figure;
plot(t,fullWaveRectifiedSignal,"r");
legend("FullWaveRectifiedSignal");
figure;
plot(t,halfWaveRectifiedSignal,"magneta");
legend("HalfWaveRectifiedSignal");