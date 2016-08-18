function [fileindex] = getFileIndex(filename)
    %pattern = '[0-9]{2}$'; %match last two alphanumerical symbols within a filename
    token =  strtok(filename, '.' )
    disp(token);
    pattern1 = '([0-9]{2})$';
  
    %fileindex = regexp(filename, pattern, 'match');
    strindex = regexp(token, pattern1, 'match');
   
    if strcmp(strindex,'01')
        fileindex = 1;
    elseif strcmp(strindex,'02')
        fileindex = 2;
    elseif strcmp(strindex,'03')
        fileindex = 3;
    elseif strcmp(strindex,'04')
        fileindex = 4;
    elseif strcmp(strindex,'05')
        fileindex = 5;
    elseif strcmp(strindex,'06')
        fileindex = 6;
    elseif strcmp(strindex,'07')
        fileindex = 7;
    elseif strcmp(strindex,'08')
        fileindex = 8;
    elseif strcmp(strindex,'09')
        fileindex = 9;
    elseif strcmp(strindex,'10')
        fileindex = 10;
    elseif strcmp(strindex,'11')
        fileindex = 11;
    elseif strcmp(strindex,'12')
        fileindex = 12;
    elseif strcmp(strindex,'13')
        fileindex = 13;
    elseif strcmp(strindex,'14')
        fileindex = 14;
    elseif strcmp(strindex,'15')
        fileindex = 15;
    elseif strcmp(strindex,'16')
        fileindex = 16;
    elseif strcmp(strindex,'17')
        fileindex = 17;
    elseif strcmp(strindex,'18')
        fileindex = 18;
    elseif strcmp(strindex,'19')
        fileindex = 19;
    elseif strcmp(strindex,'20')
        fileindex = 20;
    elseif strcmp(strindex,'21')
        fileindex = 21;
    end
    return
    