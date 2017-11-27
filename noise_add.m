close all;
clear all;
prompt = 'enter directory path of the dataset of each instrument: ';
directory_in=input(prompt,'s');
%directory_in = '/home/simran/SMAI/Learning Instrument Recognition/Dataset/Waves/';

prompt2 = 'enter directory path for the noisy data of each instrument: ';
directory_noisy=input(prompt2,'s');

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
 [y,Fs] = audioread(audio_path);
 zz = randn(size(y))/50;
 yy = y + zz;
 c = [directory_noisy,[allNames{:,j}]];
 audiowrite(c,yy,Fs);
end
end
