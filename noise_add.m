folder = '/media/minato/Data/SEM 5/SMAI/Final_project/Waves/trumpet';
audio_files = dir(fullfile(folder,'*.wav'));
len = numel(audio_files);

for i = 1:len
    filename = audio_files(i).name;
    b = (fullfile(folder,filename));

    % Reading .wav file
    [y,Fs] = audioread(b);
    zz = randn(size(y))/50;
    yy = y + zz;
    c = ['/media/minato/Data/SEM 5/SMAI/Final_project/noise_waves/trumpet/',filename];
    audiowrite(c,yy,Fs);
end