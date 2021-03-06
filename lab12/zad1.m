clearvars; close all; clc;

i1 = imread('dwieFale.bmp');

f = fft2(i1);
fshitft = fftshift(f);
ampl = log10(abs(fshitft)+1);
ang = angle(fshitft.*(ampl>0.0001));

figure;
subplot(3,1,1)
imshow(i1)
subplot(3,1,2)
imshow(ampl, [])
subplot(3,1,3)
imshow(ang, [])


