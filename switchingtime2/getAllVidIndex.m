function [allvidindx] = getAllVidIndex(filename)
    pattern = '^[0-9]{2}'; %match first four alphanumerical symbols within a filename
    strdirection = regexp(filename, pattern, 'match');
    allvidindx = 200;
    if strcmp(strdirection,'00')
        allvidindx = 1;
    elseif strcmp(strdirection,'14')
        allvidindx = 2;
    elseif strcmp(strdirection,'29')
        allvidindx = 3;
    elseif strcmp(strdirection,'43')
        allvidindx = 4;
    elseif strcmp(strdirection,'57')
        allvidindx = 5;
    elseif strcmp(strdirection,'71')
        allvidindx = 6;
    elseif strcmp(strdirection,'86')
        allvidindx = 7;
    elseif strcmp(strdirection,'10')
        allvidindx = 8;
    end
    return
    