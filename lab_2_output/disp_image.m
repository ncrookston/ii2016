function h = disp_image(A,titleA)
%DISP_IMAGE Display an image.
%
%Syntax:    DISP_IMAGE(A,titleA)
%           h = DISP_IMAGE(...)
%
%Input:     A      - An image array; the 3rd dimension can contain frames.
%           titleA - Figure title.
%
%Output     h - Figure handle.
%
%---------------------------------------------------
%Author:    Nathan Crookston, Seung Wook Lee, Jaymin Patel
%           Department of Biomedical Engineering
%           Johns Hopkins University, Baltimore, MD.
%E-mail:    nathan.crookston@gmail.com, slee333@jhu.edu, jpatel18@jhmi.edu
%Revision:  02/10/16
%---------------------------------------------------

%SET INPUTS
%---------------------------------------------------
%Check the number of inputs.
    narginchk(1,2);
%Check A.
    if ~isnumeric(A) || size(A,1)<2 || size(A,2)<2
        throw(MException([mfilename ':in_A'],'\t"A" must be at least a 2 dimensional numeric array.'));
    end
%---------------------------------------------------
%RUN FUNCTION
%---------------------------------------------------
if nargout==1
    h = figure;
end
colormap('gray'); 
imagesc(A');
axis('image');
colorbar;
if exist('titleA','var')
    title(titleA);
end
end