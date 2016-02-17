%---------------------------------------------------
%Author:    Nathan Crookston, Seung Wook Lee, Jaymin Patel
%           Department of Biomedical Engineering
%           Johns Hopkins University, Baltimore, MD.
%E-mail:    nathan.crookston@gmail.com, slee333@jhu.edu, jpatel18@jhmi.edu
%Revision:  02/10/16
%---------------------------------------------------
%Laboratory 2.

C = Camera(0);
pixelclock = 7; %Set the speed of pixel readout.

% %Part 1: Measuring spatial covariance in your imaging system.
%     aoi = [462 590 100 100]; %AOI.
%     exposure = 25; %Exposure time in milliseconds.
%     pixel = [50 50]; %Pixel within AOI to measure spatial covariance of.
%     frames = 5000; %Number of frames to capture.
%     %A. Empty.
%         if ~exist('empty','var')
%             empty = capture_frames({'pixelclock',pixelclock},{'aoi',aoi},{'exposure',exposure},{'frames',frames});
%             empty_cov = cov_pixel(empty,pixel);
%             empty_nps = fftshift(fft2(empty_cov));
%         end
%         h = disp_image(empty_cov,['No Scene: Covariance of Pixel at ' mat2str(pixel)]);
%         h = disp_image(real(empty_nps),['No Scene: Noise Power Spectrum of Pixel at ' mat2str(pixel)]);
%     %B. Uniform Patch.
%         %B-1. Focused.
%             if ~exist('focus','var')
%                 focus = capture_frames({'pixelclock',pixelclock},{'aoi',aoi},{'exposure',exposure},{'frames',frames});
%                 focus_cov = cov_pixel(focus,pixel);
%                 focus_nps = fftshift(fft2(focus_cov));
%             end
%             h = disp_image(focus_cov,['Focused Uniform Patch: Covariance of Pixel at ' mat2str(pixel)]);
%             h = disp_image(real(focus_nps),['Focused Uniform Patch: Noise Power Spectrum of Pixel at ' mat2str(pixel)]);
%         %B-2. Defocused.
%             if ~exist('defocus','var')
%                 defocus = capture_frames({'pixelclock',pixelclock},{'aoi',aoi},{'exposure',exposure},{'frames',frames});
%                 defocus_cov = cov_pixel(defocus,pixel);
%                 defocus_nps = fftshift(fft2(defocus_cov));
%             end
%             h = disp_image(defocus_cov,['Defocused Uniform Patch: Covariance of Pixel at ' mat2str(pixel)]);
%             h = disp_image(real(defocus_nps),['Defocused Uniform Patch: Noise Power Spectrum of Pixel at ' mat2str(pixel)]);
%         
%Part 2: Measuring spatial resolution properties of your imaging system.
%Aperture = 16.
    exposure = 25; %Exposure time in milliseconds.
    frames = 100; %Number of frames to capture.
    %A. Line pair target 2 lp/mm to 10 lp/mm.
        if ~exist('line2','var')
            [line2,line2_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('star2','var')
            [star2,star2_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('edge2_angle1','var')
            [edge2_angle1,edge2_angle1_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('edge2_angle2','var')
            [edge2_angle2,edge2_angle2_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        
    %B. Line pair target so that 4 lp/mm is blurred (e.g. flat).
        if ~exist('line4','var')
            [line4,line4_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('star4','var')
            [star4,star4_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('edge4_angle1','var')
            [edge4_angle1,edge4_angle1_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('edge4_angle2','var')
            [edge4_angle2,edge4_angle2_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
    
    %C. Line pair target so that 8 lp/mm is blurred (e.g. flat).
        if ~exist('line8','var')
            [line8,line8_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('star8','var')
            [star8,star8_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('edge8_angle1','var')
            [edge8_angle1,edge8_angle1_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        if ~exist('edge8_angle2','var')
            [edge8_angle2,edge8_angle2_mean] = capture_frames(C,{'pixelclock',pixelclock},{'exposure',exposure},{'frames',frames});
        end
        
%Part 3: Obtain the sharpest possible image of the star pattern target.

    