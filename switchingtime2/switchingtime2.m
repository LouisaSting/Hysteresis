function [answer, time]=switchingtime2(filename)


subjname = '_';

%number of response
respnumber = 0;
eflag1 = 0;
eflag2 = 0;
 
subjname = input('Please insert the initials (of first and last names) of the participants: ', 's');
while isempty(subjname)
    subjname = input('Please insert the initials (of first and last names) of the participants: ', 's');
end
%strcat concatenates two strings
subjname = strcat(subjname,'_');


AssertOpenGL;
Screen('Preference', 'SkipSyncTests', 1) 
Screen('Preference', 'Verbosity', 0);
Screen('Preference', 'VisualDebugLevel', 3);
% stops keystrokes from being printed to the matlab workspace
ListenChar(2);
%set presentation screen
screenNumber = 0;
[res(1), res(2)] = Screen('WindowSize', screenNumber);
clrdepth = 32;

try

[wPtr, rect] = Screen('OpenWindow', screenNumber, 0);%, [100 100 res(1) res(2)], clrdepth);
black = BlackIndex( wPtr );
white = WhiteIndex( wPtr );
Screen( 'fillRect', wPtr, black );
Screen( 'TextSize', wPtr, 40 );
Screen( 'TextFont', wPtr, 'Windings3');
str='Please watch the following movies \n \n and press [SPACE] if the perceived walking direction changes.';
[nx, ny, textbounds] = DrawFormattedText(wPtr, str , 'center', 'center', [255 255 255]);
Screen('Flip', wPtr);
tic; while toc<6,end

dname0 =  'cond0';
dname14 =  'cond14';
dname29 =  'cond29';
dname43 =  'cond43';
dname57 =  'cond57';
dname71 =  'cond71';
dname86 =  'cond86';
dname100 =  'cond100';

listing0 = dir(dname0);
listing14 = dir(dname14);
listing29 = dir(dname29);
listing43 = dir(dname43);
listing57 = dir(dname57);
listing71 = dir(dname71);
listing86 = dir(dname86);
listing100= dir(dname100);



%listing(1:2) = []; %cut off references to parent folders, only keep the filenames
listing0(1:2) = [];
listing14(1:2) = [];
listing29(1:2) = [];
listing43(1:2) = [];
listing57(1:2) = [];
listing71(1:2) = [];
listing86(1:2) = [];
listing100(1:2) = [];

% x numfiles = numel(listing);
numfiles = 8;
numvideos = 20; %number of videos for each condition
numcond0 = numel(listing0);
numcond14 = numel(listing14);
numcond29 = numel(listing29);
numcond43 = numel(listing43);
numcond57 = numel(listing57);
numcond71 = numel(listing71);
numcond86 = numel(listing86);
numcond100 = numel(listing100);

durationvid = 20; %duration of each video
numberofblocks = 2; %number of trials per condition
%resp has number of rows same as number of conditions(movies) times number of trials per condition
%resp columns should be [angle, actual direction, respondent direction, time for trial] 
resp = inf(numfiles*numberofblocks, 7);
allvideos = ones(numfiles, numvideos);


respnumber = 0;

for trial = 1:numberofblocks
    
    while true
    rng('shuffle');
    rand0 = randperm(numcond0)
    indx = rand0
    
    fname0 = listing0(indx).name;
    disp(fname0);
    if allvideos(getAllVidIndex(fname0),getFileIndex(fname0))
        break
    end 
    end
    
    while true
    rng('shuffle');
    rand14 = randperm(numcond14)
    indx = rand14
    fname14 = listing14(indx).name;
    if allvideos(getAllVidIndex(fname14), getFileIndex(fname14))
        break
    end
    end
    
    while true
    rng('shuffle');
    rand29 = randperm(numcond29)
    indx = rand29
    fname29 = listing29(indx).name;
    if allvideos(getAllVidIndex(fname29), getFileIndex(fname29))
        break
    end
    end
    
    while true
    rng('shuffle');
    rand43 = randperm(numcond43)
    indx = rand43
    fname43 = listing43(indx).name;
    if allvideos(getAllVidIndex(fname43), getFileIndex(fname43))
        break
    end
    end
    
    
    while true
    rng('shuffle');
    rand57 = randperm(numcond57)
    indx = rand57
    fname57 = listing57(indx).name;
    if allvideos(getAllVidIndex(fname57), getFileIndex(fname57))
        break
    end
    end
    
    while true
    rng('shuffle');
    rand71 = randperm(numcond71)
    indx = rand71
    fname71 = listing71(indx).name;
    if allvideos(getAllVidIndex(fname71), getFileIndex(fname71))
        break
    end
    end
    
    while true
    rng('shuffle');
    rand86 = randperm(numcond86)
    indx = rand86
    fname86 = listing86(indx).name;
    if allvideos(getAllVidIndex(fname86), getFileIndex(fname86))
        break
    end
    end
    
    while true
    rng('shuffle');
    rand100 = randperm(numcond100)
    indx = rand100
    fname100 = listing100(indx).name;
    if allvideos(getAllVidIndex(fname100), getFileIndex(fname100))
        break
    end 
    end
    
    videos={fname0, fname14, fname29, fname43, fname57, fname71, fname86, fname100}
   
    rng('shuffle');
    randomlist = randperm(numfiles)
    
    for fileindex = randomlist,
        
        fname = videos{fileindex};
        recordindex = numfiles*(trial-1)+fileindex;
        disp(fname)
        dirname = getdirname2(fname);
        disp(dirname);
       
        paway = getPAway2(fname);
        resp(recordindex, 2) = paway;
       
        % NO FILEINDEX ZERO
        fileIndex = getFileIndex(fname);
        allvideos(getAllVidIndex(fname), fileIndex) = false;
        
        
        resp(recordindex, 1) = fileIndex;
        fullfname = strcat(dirname, fname);
          

        tm = load(fullfname);
        
        frames2 = {tm.J.cdata}; %{tm.J.cdata}; for short .mat files, fullJ for long files
        for k=1:1:numel(frames2)
            mov1{1, k} = Screen('MakeTexture', wPtr, frames2{1,k}); 
        end
            
        displaystart = cputime;
        keyIsDown = 0;
        
        tic; while toc < durationvid,    
        for k=1:1:numel(frames2)
            if toc>=durationvid
                displaytotal = cputime-displaystart
                str='You did not see a switch.';
                [nx, ny, textbounds] = DrawFormattedText(wPtr, str , 'center', 'center', [255 255 255]);
                Screen('Flip', wPtr);
                ystart = tic; while toc(ystart)<2,end        
                break
            end
            tstart = tic; while toc(tstart) < 0.01, end
            Screen('DrawTexture', wPtr, mov1{1,k}); 
            Screen('Flip', wPtr);
            [keyIsDown, secs, keyCode, deltasec] = KbCheck;
            if keyIsDown == 1
                displaytotal = cputime-displaystart
                break
            end
            if toc>=durationvid
                displaytotal = cputime-displaystart
                str='You did not see switching.';
                [nx, ny, textbounds] = DrawFormattedText(wPtr, str , 'center', 'center', [255 255 255]);
                Screen('Flip', wPtr);
                xstart = tic; while toc(xstart)<2,end
                
                break
            end
        end
        [keyIsDown, secs, keyCode, deltasec] = KbCheck;
           if keyIsDown == 1
                keyIsDown = 0;
                displaytotal = cputime-displaystart
                break
           end

           
        end %while toc<durationvid 
        
        
  
       
        
        for frm=1:1:numel(frames2)
            Screen('Close', mov1{1,frm});
        end
        
       
        
       
        
        %Screen('fillRect',wPtr,black);
        str='What was the last walking direction you perceived? \n \n Press [UP] key to indicate away direction and \n \n [DOWN] key to indicate it was towards';
        [nx, ny, textbounds] = DrawFormattedText(wPtr, str , 'center', 'center', [255 255 255]);
        Screen(wPtr, 'Flip');
        %tic; while toc < 4, end

        while KbCheck; end
        % Input from Kb
        t=cputime;
        ind=0;
        keyIsDown=0;
        while (keyIsDown == 0) || (ind == 0)
            [keyIsDown, secs, keyCode, deltasec] = KbCheck;
            kbNameResult = KbName(find(keyCode));
            if not(isempty(kbNameResult))==1
                answer = kbNameResult;
                time = cputime-t;
                switch kbNameResult
                    case 'up'
                        ind = 1;
                        display (kbNameResult);
                    case 'down'
                        ind = 1;    
                    case 'space'
                        display('exited');
                        Screen('CloseAll');
                        eflag1 = 1;
                        break;
                    otherwise
                        Screen('fillRect', wPtr, black);
                        err_str = 'Please retry and press either \n \n [UP] key if you saw it walking away from you and \n \n [DOWN] key if you saw it walking towards you';
                        [nx, ny, textbounds] = DrawFormattedText(wPtr, err_str , 'center', 'center', [255 255 255]);
                        Screen(wPtr, 'Flip');
                end
            end
        end
        respnumber = respnumber + 1;
        resp(recordindex, 3) = directionFromKey(answer);
        resp(recordindex, 4) = time;
        resp(recordindex, 5) = trial;
        resp(recordindex, 6) = respnumber;
        resp(recordindex, 7) = displaytotal;
        %resp(recordindex, 8) = switchingtime;
        save(strcat(subjname,'resp',num2str(respnumber),'.mat'), 'resp');
         
        if eflag1 == 1
            eflag2 = 1;
            break;
        end;
        
        %break
        
        

        
        
    end 
    if eflag2 == 1
        break;
    end 
    
    
    if trial ~= numberofblocks
        while KbCheck; end
        % Input from Kb
        keyIsDown = 0;
        
        
        while keyIsDown == 0 
            [keyIsDown, secs, keyCode, deltasec] = KbCheck;
            
            str='Time for a break. Please press any key if you want to go on.';
            [nx, ny, textbounds] = DrawFormattedText(wPtr, str , 'center', 'center', [255 255 255]);
            Screen('Flip', wPtr);
        end
     end
        

                
end %blocks 
     
Screen('CloseAll');
disp('Movie displayed successfully');
disp(answer);
ListenChar(0); 
% catch error: this is executed in case something goes wrong in the
% 'try' section due to programming error etc.
catch
    
    % do same cleanup as above
    Screen('CloseAll');
    ShowCursor;
    fclose('all');
    Priority(0);
    ListenChar(0);
    
    % output the error message that describes the error
    psychrethrow(psychlasterror);
    
    % end the experiment
    return;
end % try ... catch %
return