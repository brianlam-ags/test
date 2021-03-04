%This script performs BPSK modulation on a data stream
%using the communications toolbox as opposed to 
%performing the modulation from scratch
clc
clear 
close all

n = 5000; % However many numbers you want.
nbits = int32(randi([0, 1], [1, n]));
trans = transpose(nbits);

% A = 1;
% Fc = 40; % Carrier frequency
% Fs = 200; % Sampling frequency
% carrier = A*exp(j*2*pi*(Fc/Fs)*n); %Carrier wave
% real_carrier = real(carrier);

bpskModulator = comm.BPSKModulator;
modData = bpskModulator(trans);

% bpsk = carrier.*IQ; %offset bpsk
% real_bpsk = real(bpsk);
plot(real(modData));


