close all;
clear all;

wave_folder=input('enter directory path of the dataset of each instrument');
%directory_in = '/home/simran/SMAI/Learning Instrument Recognition/Dataset/Waves/';
directory_in = wave_folder;

dataset_filename=input('enter filename of the dataset file');
%directory_dataset = '/home/simran/SMAI/Learning Instrument Recognition/dataset.csv';
directory_dataset = dataset_filename;

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
    y = y/abs(max(y));
    
%     dt = 1/Fs;
%     t = 0:dt:(length(y)*dt)-dt;
%     plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
%     figure
%     %plot(psd(spectrum.PERIODOGRAM,y,'Fs',Fs,'NFFT',length(y)));
    
    indices = find(abs(y)<0.03);
    y(indices) = [];
    %disp(indices);
    %size(indices)    
    %size(y)
    %disp(y)
    
%     dt = 1/Fs;
%     t = 0:dt:(length(y)*dt)-dt;
%     plot(t,y); xlabel('Seconds'); ylabel('Amplitude');
%     figure
     
    y_fft = fft(y, length(y));
    %y_fft = abs(fft(y, length(y)))/length(y);
    %y_fft = abs(fft(y).^2);
    
    %disp(y_fft);
    fftLength = length(y);
    %class(y_fft)
    %size(y_fft)
    
    freq = [0:fftLength-1].*(Fs/fftLength);
    freqsYouCareAbout = freq(freq < Fs/2);
    y_fft_YouCareAbout = abs(y_fft(1:round(fftLength/2)));
    %size(y_fft_YouCareAbout)
    %size(freqsYouCareAbout)
    %disp(y_fft_YouCareAbout);
    
    [sort_y_fft, sortIndex] = sort(y_fft_YouCareAbout(:),'descend');
    %disp(sort_y_fft(1:10));
    maxIndex = sortIndex(1:10);
    %disp(maxIndex);
    %disp(sort_y_fft(maxIndex));
    maxFreq = freqsYouCareAbout(maxIndex);
    %disp(maxFreq(1,1));
    
    maxFreq(1,11) = i;
    %maxFreq(1,12) = [allNames{:,j}];
    dlmwrite(directory_dataset,maxFreq,'delimiter',',','-append');
    
%     P2 = abs(y_fft/length(y));
%     P1 = P2(1:length(y)/2+1);
%     P1(2:end-1) = 2*P1(2:end-1);
    
%     f = Fs*(0:(length(y)/2))/length(y);
%     plot(f,P1)
%     title('Single-Sided Amplitude Spectrum of X(t)')
%     xlabel('f (Hz)')
%     ylabel('|P1(f)|')
%     xlim([0 1000])
end    
end




