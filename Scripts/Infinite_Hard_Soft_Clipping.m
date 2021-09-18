clear;
clear all;
close all;
clc;

FS = 48000;
TS = 1/FS;
t = 0:TS:1-TS;
t = t(:);
f = 3;
input = sin(2*pi*f*t);

% Infinite Clipping
infiniteClippedSignal = infiniteClipping(input);

% Hard clipping
hardClippedSignal = hardClipping(input,0.8);

% Soft clipping
% amount -> Range 0(min) to 1(max)
amount = 0.8;
cubicSoftClippedSignal = cubicSoftClipping(input,amount); 

% alpha -> Range 0(min) to 10(max)
alpha = 10;
arctanSoftClippedSignal = arctanSoftClipping(input,alpha);

subplot(3,2,1);
plot(t,input);
legend("InputSignal");
axis([0 1 -1.2 1.2]);

subplot(3,2,2);
plot(t,infiniteClippedSignal,"r");
legend("InfiniteClippedSignal");
axis([0 1 -1.2 1.2]);

subplot(3,2,3);
plot(t,hardClippedSignal,"black");
legend("HardClippedSignal");
axis([0 1 -1.2 1.2]);

subplot(3,2,4);
plot(t,cubicSoftClippedSignal,"g");
legend("SoftClippedSignal - Cubic, Amount : " + amount);
axis([0 1 -1.2 1.2]);

subplot(3,2,5);
plot(t,arctanSoftClippedSignal,"c");
legend("SoftClippedSignal - Arctan, Alpha : " + alpha);
axis([0 1 -1.2 1.2]);




function[output] = infiniteClipping(input)

    output = zeros(length(input),1);
    for n = 1:length(input)
    
        if input(n,1)>0
            output(n,1) = 1;
        elseif input(n,1)<0
            output(n,1) = -1;
        else
            output(n,1) = 0;
        end
    
    end
end


function[output] = hardClipping(input,threshold)
    output = zeros(length(input),1);
    for n = 1:length(input)
        if input(n,1) > threshold
            output(n,1) = threshold;
        elseif input(n,1) < -threshold
            output(n,1) = -threshold;
        else
            output(n,1) = input(n,1);
        end
    end
end


% Soft clipping - Cubic, Arctan
function [output] = cubicSoftClipping(input,amount)
    output = zeros(length(input),1);
    for n = 1:length(input)
        output(n,1) = input(n,1) - amount * (1/3) * input(n,1)^3;
    end
end


function [output] = arctanSoftClipping(input,alpha)
    output = zeros(length(input),1);
    for n = 1:length(input)
        output(n,1) = (2/pi) * atan(input(n,1)*alpha) ;
    end
end