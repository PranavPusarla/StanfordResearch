dirlist = dir('/Users/Pranav/Desktop/new_tumors')
X = length(dirlist)
largest_image = ''
largest_patient = {}
patient_features = [];
all_lbp_features = [];
total_discrete_features = [];

for i = 1:X
    fprintf(dirlist(i).name)
    add_string = strcat('/Users/Pranav/Desktop/new_tumors/',(dirlist(i).name));
    list_images = dir(strcat(add_string,'/*.dcm'))
    Z = length(list_images)
    most_white_pixels = 0;
    
    for t = 1:Z
        read_image = dicomread(strcat(add_string,'/',list_images(t).name));
        image_name = strcat(add_string,'/',list_images(t).name);
%         turning matrix into gray scale image
        gray_scale_img = mat2gray(read_image)
%         finding and extracting GLCM features 
        glcm = graycomatrix(gray_scale_img)
        stats = graycoprops(glcm)
        struct_to_matrix = [stats.Contrast stats.Correlation stats.Energy stats.Homogeneity]
%         matrix of all patient features
        patient_features = [struct_to_matrix;patient_features]
%         finding largest image
        bw_img = im2bw(gray_scale_img, 0.5)
        nWhite = sum(bw_img(:));
        if most_white_pixels < nWhite
            most_white_pixels = nWhite
            largest_image = image_name;
        else 
            ;
        end  
%         extracting local binary patterns
        lbp_features = extractLBPFeatures(read_image)
        all_lbp_features = [lbp_features;all_lbp_features];
%         extracting DOST features
        discrete_features = ST.dost(read_image)
        df1 = ST.dost2(read_image)
        df2 = ST.fourier(read_image)
        df3 = ST.fourier2(read_image)
    end
    
    largest_patient = [largest_patient; {largest_image}];
end
disp(largest_patient)
disp(patient_features)
disp(all_lbp_features);

