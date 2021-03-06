clearvars; close all; clc;
%% inicjalizacja zmiennych
i1 = imread("lena.bmp");

%% imresize

% 256x256
i11 = imresize(i1, 0.5);
figure(1);
imshow(i11, 'InitialMagnification', 200);

% 128x128
i22 = imresize(i11, 0.5);
figure(2);
imshow(i22, 'InitialMagnification', 400);

% 64x64
i33 = imresize(i22, 0.5);
figure(3);
imshow(i33, 'InitialMagnification', 800);
