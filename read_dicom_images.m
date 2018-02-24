dirlist = dir('/Users/Pranav/Desktop/dicomimages/*.dcm');
X = length(dirlist);
pause_time = 2
for i = 1:X
    Y = dicomread(strcat('/Users/Pranav/Desktop/dicomimages/',(dirlist(i).name)));
    fprintf(dirlist(i).name);
    disp(' ')
    Av = mean2(Y);
    disp(' ')
    disp(Av)
    SD = std2(Y);
    disp(SD)
    PIC = mat2gray(Y);
    Norm = imadjust(Y);
    imshowpair(PIC,Norm,'montage');
    pause(pause_time);
end
