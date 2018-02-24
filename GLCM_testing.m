Y = dicomread(('/Users/Pranav/Desktop/new_tumors/tW_42529388/IM-0001-0001.dcm'));
Z = mat2gray(Y);

glcm = graycomatrix(Z);
stats = graycoprops(glcm);

F = dicomread(('/Users/Pranav/Desktop/new_tumors/tW_42529388/IM-0001-0002.dcm'));
L = mat2gray(F);
glcms = graycomatrix(L);
statss = graycoprops(glcms);
b = [statss.Contrast statss.Correlation statss.Energy statss.Homogeneity]
a = [stats.Contrast stats.Correlation stats.Energy stats.Homogeneity]
a = [b;a]
