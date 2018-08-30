
%Extract .tsv file into .mat file
clear;clc;

fid = fopen('Letizia20180713.tsv');

% C = textscan(fid, ['%s' repmat('%f',1,25)], 'HeaderLines', 1);
% fclose(fid);

% check the number of frames from the .tsv file
tline = fgetl(fid);
A1 = regexp(tline,'\d*','Match');
A2 = [A1{:}];
TotalNum = str2double(A2);

fprintf('printing header ....\n');
for i = 1 : 10    
    disp(tline)
    tline = fgetl(fid);
end

fprintf('printing content\n');

f = 0;
JointsData = zeros(TotalNum, 3*21);


tline = fgetl(fid); 
while ischar(tline)
    f = f + 1;
    sprintf('%d frame\n',f);
    disp(tline)    
    
    numbers = str2num(tline);
    JointsData(f,1:length(numbers)) = numbers;
    
    tline = fgetl(fid); 
end
    
    
fclose(fid);

% save the data in .mat file
save('JointsLocs.mat', 'JointsData');



