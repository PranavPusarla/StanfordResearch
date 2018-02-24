Y = dicomread(('/Users/Pranav/Desktop/new_tumors/tW_42529388/IM-0001-0001.dcm'));
Z = mat2gray(Y)
imshow(Z)
[y1,x1,z1] = size(Y)

imshow(mat2gray(Z,[0,1]))
BW = im2bw(Z, 0.5)
imshow(BW, [])
nWhite = sum(BW(:))
nBlack = numel(BW) - nWhite
numberOfPixels = numel(BW)
