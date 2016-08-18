function [dirname] = getdirname2(filename)
    pattern = '^[0-9]{2}'; %match first four alphanumerical symbols within a filename
    strdirection = regexp(filename, pattern, 'match');
    dirname=200;
    if strcmp(strdirection,'00')
        dirname = 'cond0\';
    elseif strcmp(strdirection,'14')
        dirname = 'cond14\';
    elseif strcmp(strdirection,'29')
        dirname = 'cond29\';
    elseif strcmp(strdirection,'43')
        dirname = 'cond43\';
    elseif strcmp(strdirection,'57')
        dirname = 'cond57\';
    elseif strcmp(strdirection,'71')
        dirname = 'cond71\';
    elseif strcmp(strdirection,'86')
        dirname =  'cond86\';
    elseif strcmp(strdirection,'10')
        dirname =  'cond100\';
    end
    return
    