history -c;
clear;
clear all;

FS = 48000;
TS = 1/FS;
f = 4;
t = 0:TS:1-TS;
t = t(:);

% Sine wave 4Hz

x = sin(2*pi*f*t);


%Peak value

peakValue = max(abs(x));


%Peak Value Normalization (Linear scale) with gain factor 2.
%Generally normalized to scale of 1,-1

normalized = x * (1/peakValue);
y = 2 * normalized;


%Peak Value Normalization (Decibel scale) with gain factor 2.
%Gain factor of +2 = +6dB in dBscale
% db -> Mag
% 6  -> 2
% 3  -> 1.5
% 8  -> 2.5

pkg load control;
gainDB = db2mag(3);
z = gainDB * normalized;

plot(t,x,t,y,t,z);
legend("InitSignal", "LinearGain", "dBGain");