function  NewImage = BlackAndWhiteFocus(varargin)

[imagename,imagepath,~] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
    '*.*','All Files' },'Pick file for Lift Coefficient:');
Image = imread(imagename);


figure
subplot(1,2,1)
imshow(Image)
title('Original image')
if isa(Image,'uint8');
    NewImage = rgb2gray(Image);
%     [trial,trial2] = voronoiSkel(NewImage);
    if nargin==0
        level = graythresh(NewImage);
    else
        if varargin{1}>1 || varargin{1}<0
            level = graythresh(NewImage);
            warning('level value is between 0 and 1.Graythresh was used for level as default')
        else
            level = varargin{1};
        end
    end
    NewImage = im2bw(NewImage,level);
    NewImage = im2uint8(NewImage);
    subplot(1,2,2)
    imshow(NewImage);
    title('Reproducted image')
    if nargin==2
        if varargin{2}==1
            imwrite(NewImage,[imagepath,'New_',imagename]);
        else
            warning('to print the result the second input should be set at 1')
        end
    else
        warning('to print the result the second input should be set at 1')
    end
else
    warning('Not impliment yet for this type of format')
    NewImage = 0;
end