% use ls or dir to specifically match *.avi files
files = ls('C:\Users\Lou\Documents\MATLAB\switchingtime2\*.avi')

% note that size can return more than one value
% hence size(files,1)

for n = 1:size(files,1); 

    
    filename = files(n,:);  % pick one file
    token = strtok(filename, '.');
    input= VideoReader(filename);
    a=read(input);
    frames=get(input,'numberOfFrames');
    %namev = strcat(get(input, 'name'),n);
    
    for k = 1 : frames-1
        J(k).cdata = a(:,:,:,k);
        J(k).colormap = [];
    end
    
    %sz = size(J);
    %fullJ =repmat(J, [sz(1) sz(1) sz(1) 90*sz(1)]);
    fullJ = repmat(J, [ 1 90 ]);
    
    % save('filename.mat', 'fullJ', '-v7.3')
 
    fout = ['C:\Users\Lou\Documents\MATLAB\switchingtime2\',token,'.mat'];
    save(fout,'fullJ', '-v7.3');

end