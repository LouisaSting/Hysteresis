function [percentage] = getPAway2(filename)
    pattern = '^[0-9]{2}'; %match first two alphanumerical symbols within a filename
    strdirection = regexp(filename, pattern, 'match');
    percentage = 200;
    if strcmp(strdirection,'00')
        percentage = 0;
    elseif strcmp(strdirection,'14')
        percentage = 14;
    elseif strcmp(strdirection,'29')
        percentage = 29;
    elseif strcmp(strdirection,'43')
        percentage = 43;
    elseif strcmp(strdirection,'57')
        percentage = 57;
    elseif strcmp(strdirection,'71')
        percentage = 71;
    elseif strcmp(strdirection,'86')
        percentage = 86;
    elseif strcmp(strdirection,'10')
        percentage = 100;
    end
    return
    