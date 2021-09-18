clear;
close all;
clc;

addpath("../Functions");

FS = 48000;
TS = 1/FS;
t = 0:TS:1-TS;
t = t(:);


f = 160;
input = sin(2*pi*f*t);


amount = 1;  % Range 0 to 1
alpha = 5;   % Range 1 to 10
nBits = 4;   % Bit reduction


fullWaveRectifiedSignal = Distortion.fullWaveRectification(input);
halfWaveRectifiedSignal = Distortion.halfWaveRectification(input);
cubicClippedSignal      = Distortion.cubicSoftClipping(input,amount);
arcTanClippedSignal     = Distortion.arctanSoftClipping(input,alpha);
bitCrushedSignal        = Distortion.bitCrushing(input,nBits);
infiniteClippedSignal   = Distortion.infiniteClipping(input);
emptyBuffer             = zeros(length(input)/2,1);



% Merging to Audio Buffer
soundWave = [   
    input;
    emptyBuffer;
    fullWaveRectifiedSignal;
    emptyBuffer;
    halfWaveRectifiedSignal;
    emptyBuffer;
    cubicClippedSignal;
    emptyBuffer;
    arcTanClippedSignal;
    emptyBuffer;
    bitCrushedSignal;
    emptyBuffer;
    infiniteClippedSignal;
    ];
soundWave = 0.2 * soundWave;
sound(soundWave, FS);



% Plotting the time-domain representation
subplot(4,2,1);
plot(t,sin(2*pi*3*t));
xlabel("Input");

subplot(4,2,2);
plot(t,Distortion.fullWaveRectification(sin(2*pi*3*t)));
xlabel("Fullwave-Rectified Signal");

subplot(4,2,3);
plot(t,Distortion.halfWaveRectification(sin(2*pi*3*t)));
xlabel("Halfwave-Rectified Signal");

subplot(4,2,4);
plot(t,Distortion.cubicSoftClipping(sin(2*pi*3*t),amount));
xlabel("Cubic-SoftClipped Signal (Amount : " + amount + ")");

subplot(4,2,5);
plot(t,Distortion.arctanSoftClipping(sin(2*pi*3*t),alpha));
xlabel("Arctan-SoftClipped Signal (Alpha : " + alpha + ")");

subplot(4,2,6);
plot(t,Distortion.bitCrushing(sin(2*pi*3*t),nBits));
xlabel("BitCrushed Signal (nBits : " + nBits + ")");

subplot(4,2,7);
plot(t,Distortion.infiniteClipping(sin(2*pi*3*t)));
xlabel("Infinite-Clipped Signal");

