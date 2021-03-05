%This script performs BPSK modulation on a data stream
%using the communications toolbox as opposed to 
%performing the modulation from scratch
clc
clear 
close all

n = 5000; 
bits = round(rand(1,n));
transbits = transpose(bits);

% A = 1;
% Fc = 40; % Carrier frequency
% Fs = 200; % Sampling frequency
% carrier = A*exp(j*2*pi*(Fc/Fs)*n); %Carrier wave
% real_carrier = real(carrier);

modBPSK = pskmod(transbits,2);
modQPSK = pskmod(transbits,4);
mod8_PSK = pskmod(transbits,8);
mod16_PSK = pskmod(transbits,16);

% figure()
% plot(real(modBPSK));
% title('Real part of BPSK modulated data');
% xlabel('Bits');

noisyBPSK = awgn(modBPSK,-10);
noisyQPSK = awgn(modQPSK,-10);
noisy8PSK = awgn(mod8_PSK,-10);
noisy16PSK = awgn(mod16_PSK,-10);


demodBPSK = pskdemod(noisyBPSK,2);
demodQPSK = pskdemod(noisyQPSK,4);
demod8_PSK = pskdemod(noisy8PSK,8);
demod16_PSK = pskdemod(noisy16PSK,16);
[numerrorBPSK,BER_BPSK] = biterr(transbits,demodBPSK);
[numerrorQPSK,BER_QPSK] = biterr(transbits,demodQPSK);
[numerror8PSK,BER_8PSK] = biterr(transbits,demod8_PSK);
[numerror16PSK,BER_16PSK] = biterr(transbits,demod16_PSK);












