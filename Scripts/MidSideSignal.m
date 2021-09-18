clear;
clear all;
clc;

FS = 48000;

% Mid-Side signal

z = audioread("Sounds/Dream within a Dream Sample.wav");
left = z(:,1); % Left channel
right = z(:,2); % Right channel
side = 1/2 * (left-right);
mid = 1/2 * (left+right);
sound(side,FS);