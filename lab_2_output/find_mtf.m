function mtfA = find_mtf(A,type,angle)
%FIND_MTF Find the MTF from an line pair, edge, or star for ... camera.
%
%Syntax:    mtfA = FIND_MTF(A,type,angle)
%
%Input:     A     - An image array.
%           type  - Image type.
%                   {'line'}    Line pair.
%                    'edge'     Edge.
%                    'star'     Star.
%           orientation - {'vertical'}
%
%           angle - Angle of line.
%
%Output:    mtfA - Modulation transfer function of array A.
%
%---------------------------------------------------
%Author:    Nathan Crookston, Seung Wook Lee, Jaymin Patel
%           Department of Biomedical Engineering
%           Johns Hopkins University, Baltimore, MD.
%E-mail:    nathan.crookston@gmail.com, slee333@jhu.edu, jpatel18@jhmi.edu
%Revision:  02/12/16
%---------------------------------------------------

%SET INPUTS
%---------------------------------------------------
%Check A.
    if ~isnumeric(A) || size(A,3)<1
        throw(MException([mfilename ':in_A'],'\t"A" must be a 2 dimensional numeric array.'));
    end
%Check type.
    if ~any(strcmp(type,{'line','edge','star'}))
        throw(MException([mfilename ':in_type'],'\t"type" must ''line'', ''edge'', or ''star''.'));
    end
%Check angle.
    
%---------------------------------------------------
%RUN FUNCTION
%---------------------------------------------------
    pixel_size = 1/55; %mm.
    aoi = define_aoi(A);
    aoiA = A(aoi(1):aoi(1)+aoi(3),aoi(2):aoi(2)+aoi(4));
    lineA = aoiA(:,round(size(aoi,2)/2));
    fftA = fftshift(fft(lineA));
    [X,Y] = meshgrid(-size(aoiA,1)/2:size(aoiA,1)/2,-size(aoiA,1)/2:size(aoiA,1)/2);
    T = (0:1/4:2)*pi;
    R = 0:5;
    [T, R] = meshgrid(T,R);
    [Xq,Yq] = pol2cart(T,R);
    psfA = interp2(X,Y,repmat(real(fftA),1,numel(fftA)),Xq,Yq);
    mtfA = aoiA;
end