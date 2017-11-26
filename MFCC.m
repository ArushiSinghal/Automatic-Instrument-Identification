close all;
clear all;
prompt = 'enter directory path of the dataset of each instrument: ';
directory_in=input(prompt,'s');
%directory_in = '/home/simran/SMAI/Learning Instrument Recognition/Dataset/Waves/';

prompt1 = 'enter filename of the dataset file: ';
directory_dataset =input(prompt1,'s');
%directory_dataset = '/home/simran/SMAI/Learning Instrument Recognition/dataset.csv';

fid = fopen( directory_dataset, 'w' );

dir(directory_in);
d = dir(directory_in);
isub = [d(:).isdir];
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];

for i = 1:size(nameFolds)
nums = [nameFolds{i,:}];
s = strcat(directory_in,nums);

allFiles = dir(s);
allNames = {allFiles.name};
allNames(ismember(allNames,{'.','..'})) = [];
[rows, columns] = size(allNames);
for j = 1:columns

 audio_path = strcat(s,'/',[allNames{:,j}]);
    %disp(audio_path);
[y,Fs] = audioread(audio_path);

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
xx(1,14) = i;
dlmwrite(directory_dataset,xx,'delimiter',',','-append');

% figure,plot(inv_transform);
% figure,plot(inv_transform(1:20));
% len
% size(x)
end
end
