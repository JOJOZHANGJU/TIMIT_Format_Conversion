function [wavConverted] = wavConversion(wavFile)
    fileID = fopen(wavFile);
    
    head = fread(fileID, 1024, 'char*1'); 
    headStr = sprintf('%s',head(1:7));
    if(~strcmp(headStr,'NIST_1A'))
        fclose(fileID);
        continue;
    end    
    frewind(fileID);
    
    allData = fread(fileID, inf, 'short');
    fclose(fileID);
    delete(file);
	wavConverted = allData(513:end)./32768;
end