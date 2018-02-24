Y = dicomread(('/Users/Pranav/Desktop/dicomimages/IM-0001-0001-0001.dcm'));

Av = mean2(Y);
disp(Av)
SD = std2(Y);
PIC = mat2gray(Y);
Con = imadjust(Y);
imshowpair(PIC,Con,'montage');

