history -c;
clc;
clear all;

FS = 48000;
f = 440;
t = 0:1/FS:1-1/FS;
t = t(:);

impulseTrain = zeros(size(t));
impulseTime = round(FS/f);
impulseTrain(1:impulseTime:end) = 1;

audiowrite("IMPULSE_TRAIN.wav", impulseTrain, FS);