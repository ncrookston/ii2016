classdef MockCamera
    properties (Access = private)
        I
    end
    properties(Dependent = true)
        capture
    end
    properties
        pixelclock = 10
        framerate = 10
        exposure = 10
        aoi = [0 0 1280 1024]
    end
    properties(Constant)
        allowedpixelclock = [7 1 50]
        exposurerange = [1 10 101]
        frameraterange = [10 20]
    end
    methods (Access = private)
        function img = subimage(obj, I)
            a = obj.aoi;
            img = I(a(1)+1:a(1)+a(4),a(2)+1:a(2)+a(3));
%            img = reshape(img,1,size(img,1), size(img,2));
        end
    end
    methods
        function obj = MockCamera(~,~)
            if nargin <= 1
                obj.I = rgb2gray(imread('saturn.png'))';
            else
                obj.I = zeros(obj.aoi(4), obj.aoi(3));
            end
        end
        function img = get.capture(obj)
            img = imnoise(obj.subimage(obj.I), 'gaussian');
        end
        
        function delete(obj)
            %Do nothing for the mock.
        end
    end

end

