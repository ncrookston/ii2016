function aoi = define_aoi(varargin)
%DEFINE_AOI Determine an area of interest (AOI) for a DCC3240M camera using the interface written by Steve Tilley.
%   Shows an image from the camera. Then the user selects one point if 
%   "dim" is set or two points if it is not.
%
%Syntax:    aoi = DEFINE_AOI()
%           aoi = DEFINE_AOI(...,C)
%           aoi = DEFINE_AOI(...,dim)
%           aoi = DEFINE_AOI(...,parameter)
%
%Input:     C         - Camera object.
%           dim       - Set AOI dimensions.
%           parameter - A cell containing {name,value}.
%
%                       Name        Value                                      Description
%                       ----        -----                                      -----------
%                       pixelclock  [1,inf) integers {7}                       Speed of pixel readout.
%                       exposure    [exposurerange(2),exposurerange(3)] double Exposure time in milliseconds.
%                       frames      [1,inf) integers {1}                       Number of frames.
%
%Output:    aoi - Area of interest.
%
%See also:
%Required   CAMERA, CAPTURE_FRAMES.
%
%---------------------------------------------------
%Author:    Ang Li, Ho Namkung, Jaymin Patel
%           Department of Biomedical Engineering
%           Johns Hopkins University, Baltimore, MD.
%E-mail:    ang.li@jhmi.edu, ho.namkung@jhmi.edu, jpatel18@jhmi.edu
%Revision:  02/09/16
%---------------------------------------------------

%SET INPUTS
%---------------------------------------------------
%Check the number of inputs.
    narginchk(0,5);
%Assign varargin.
    for n = 1:nargin
        if isnumeric(varargin{n})
            dim = varargin{n};
        end
    end
%Assign dim.
    aoi = [0 0 1280 1024];
    if exist('dim','var')
        if numel(dim)~=2 || ~isequal(round(dim),dim) || any(dim<1)
            throw(MException([mfilename ':in_aoi'],'\t"dim" must be a pair of integers greater than 1.'));
        end
        aoi(3) = dim(1);
        aoi(4) = dim(2);
    end
%---------------------------------------------------
%RUN FUNCTION
%---------------------------------------------------
    A = capture_frames(varargin{:});
%     load('define_aoi.mat');
    h = figure;
    button = 'No';    
    while strcmp(button,'No')
        colormap('gray'); imagesc(A'); axis('image'); colorbar;
        if ~exist('dim','var')
            title('Select two opposite corners.');
            [x,y] = ginput(2);
            aoi(1) = min(x);
            aoi(2) = min(y);
            aoi(3) = max(x)-min(x);
            aoi(4) = max(y)-min(y);
        else
            title('Select the top left corner.');
            [aoi(1),aoi(2)] = ginput(1);
        end
        aoi = round(aoi);
        if aoi(1)+aoi(3)>1280
            aoi(3) = 1280-aoi(1);
        end
        if aoi(2)+aoi(4)>1024
            aoi(4) = 1024-aoi(2);
        end
        aoi(3) = aoi(3)-rem(aoi(3),4);
        aoi(4) = aoi(4)-rem(aoi(4),4);
        rectangle('position',aoi,'EdgeColor','r');
        button = questdlg('Use this AOI?','','Yes','No','Yes');
        if strcmp(button,'Yes')
            close(h);
        elseif strcmp(button,'No')
            clf(h);
        end
    end
end