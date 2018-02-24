dirlist = dir('/Users/Pranav/Desktop/rois/');
X = length(dirlist)
patient_images = []
total_patient_images = []
k = 0
emptyCell = cell(1,2)

for i = 1:X
    
    add_string = strcat('/Users/Pranav/Desktop/rois/',(dirlist(i).name));
    list_images = dir(strcat(add_string,'/*.dcm'))
    Z = length(list_images)
    
    if Z > 0 
        k = k+1

        for t = 1:Z
            read_image = dicomread(strcat(add_string,'/',list_images(t).name));
            patient_images = [patient_images; read_image]

        end
        
        emptyCell{k} = patient_images
        patient_images = [];
    end
end
disp total_patient_images