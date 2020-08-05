clc;
clear all;
close all;
warning('off','all');
% % % Get The Input Image
% [filename,pathname] = uigetfile('BAN-DATASET\*.jpg');
% img = imread([pathname,filename]);
a1 = dir('images\images\*.bmp');
a2 = dir('images\images\*.png');
a3 = dir('images\images\*.jpg');
aa1 = [];aa2 = [];aa3 = [];
for kk = 1 : length(a1)
    aa1{kk,1} = a1(kk).name;
    for kk1 = 1:length(a2)
        aa2{kk1,1} = a2(kk1).name;
        for kk2 = 1:length(a3)
            aa3{kk2,1} = a3(kk2).name;
    end
end
end
a4 = unique([aa1;aa2;aa3]);
final = [];
yfit1 = [];
for k = 1 : length(a4)
    a = char(a4(k));
    img = imread(fullfile('images\images\',a));
% %  Scaling
%% SURF Feature Extraction 
imx = rgb2gray(img);
% p1 = detectSURFFeatures(imx);
% p1 = detectHarrisFeatures(imx);
% figure,
% imshow(imx);
% hold on;
% plot(selectStrongest(p1,100));
% % Extract the features.
f2 = extractHOGFeatures(imx);
f22 = mean(f2);
final = [final;f22];
%  feature1 = final_feature;
% save('image_HOGfeature','final');
% load image_HOGfeature.mat;
% lab = ones(121,1);
% lab(37:43) = 2;
% lab(44:65) = 3;
% lab(66:121) = 4;
% model = fitcknn(final,lab);
% yfit = predict(model,f22);
% yfit1 = [yfit1;yfit];
end
% % clear yfit;
% % for i = 1:length(yfit)
% % if (yfit(i)>= 1 && yfit(i) <= 4) 
% %     figure,imshow(imc{i,1});title('ROI Extraction Image');
% % end
% % if yfit(i) == 1
% %     msgbox('Negative Denoted');
% %     figure,imshow(imc{i,1});title('ROI Extraction Image');
% % elseif yfit(i) == 2
% %     msgbox('Positive Denoted');
% %     figure,imshow(imc{i,1});title('ROI Extraction Image');
% % elseif yfit(i) == 3
% %     msgbox('Warning');
% %     figure,imshow(imc{i,1});title('ROI Extraction Image');
% % elseif yfit(i) == 4
% %     msgbox('General Information');
% %     figure,imshow(imc{i,1});title('ROI Extraction Image');
% % end
% % end
% save('yfit12','yfit1')