clc;
clear all;
close all;
warning('off','all');
f2 = [];
a = dir('ROI_images\*.jpg');
for i = 1:length(a)
    a1 = a(i).name;
    im = imread(fullfile('ROI_images',a1));
    gray = im2double(rgb2gray(im));
    p1 = detectHarrisFeatures(gray);
    [f1,valid_points1] = extractFeatures(gray,p1);
    f3 = f1.Features;
    [r,c] = size(f3);
    if r > 1
        f4 = mean(f3);
    elseif r == 1
        f4 = f3;
    end
    f2 = [f2;f4];
end
% f22 = cell2mat(f2);
save('final_feature2','f2')