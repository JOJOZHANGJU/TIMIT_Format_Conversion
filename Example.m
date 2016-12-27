%Convert the SPHERE format to wav format.
%Using cmd: DIR /S /B *.WAV*>XXX.txt 
clear all;
fs = 16000;
[wavLoadPath] = textread('XXX.txt','%s');
[row,cols] = size(wavLoadPath);
for n = 1:row
    wavFile = wavLoadPath{n};
	
	%Conversion
    [wavConverted] = wavConversion(wavFile);
    wavwrite(wavConverted, fs, wavFile);
	
	%Checking
	[y, fs, nbits] = wavread(wavFile);
    disp(n);
    if(fs~=16000)
        fprintf('%s: fs~=16000\n', wavFile);
    end
    if(nbits ~= 16)
        fprintf('%s: nbits ~= 16\n', wavFile);
    end

end
