close all;
clear all;

Features = load('faetures_noise.mat');
x = Features.x;
folder = '/media/minato/Data/SEM 5/SMAI/Final_project/noise_waves/violin';
audio_files = dir(fullfile(folder,'*.wav'));
len = numel(audio_files);
% x = zeros(len,14);

for file = 1:len
    file
    filename = audio_files(file).name;
    b = (fullfile(folder,filename));

    % Reading .wav file
    [y,Fs] = audioread(b);
% figure,
% subplot(5,1,1)
% plot(y);
% size(y)

% Silence removal
y(abs(y) <= 0.009) = [];

% Computing MFCC for a frame length of p = 20 ms

a = size(y,1);
p = 882;
num_frames = floor(a/p);


w = hamming(p);
% subplot(5,1,3)
% plot(w);

y_new = y;
% subplot(5,1,2)
% plot(y_new);

for i = 1:num_frames
    t = (i-1)*p + 1 : i*p;
    interval = y_new((i-1)*p + 1 : i*p );
    filt = interval.*w;
    ftransform(t) = dct(filt);
    pp(t) = 2595*log(((abs(t))/700) + 1);
        
end
% subplot(5,1,4)
% plot(pp,(abs(ftransform)));
inv_transform = idct(log(abs(ftransform)+0.1));
% subplot(5,1,5)
k = 1:13;
% plot((inv_transform));

xx = zeros(1,14);
xx(1,1:13) = inv_transform(1,1:13);
xx(1,14) = 7;

x = vertcat(x,xx);
% figure,plot(inv_transform);

% figure,plot(inv_transform(1:20));
end

% len
% size(x)