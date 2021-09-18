% Clipping
% Infinite, Hard, Soft(Cubic, Arctan), BitCrushing

classdef Distortion
    methods(Static)
        
        function[out] = fullWaveRectification(in)
            for n = 1:length(in)
                if in(n,1) >= 0
                    out(n,1) = in(n,1);
                else
                    out(n,1) = -1 * in(n,1);
                end
            end
        end
        
        
        function[out] = halfWaveRectification(in)
            for n = 1:length(in)
                if in(n,1) >= 0
                    out(n,1) = in(n,1);
                else
                    out(n,1) = 0;
                end
            end
        end
        
        
        function[output] = infiniteClipping(input)
            output = zeros(length(input),1);
            for n = 1:length(input)
                if input(n,1)>0
                    output(n,1) = 1;
                elseif input(n,1)<0
                    output(n,1) = -1;
                else
                    output(n,1) = 0;
                end
            end
        end

        
        function[output] = hardClipping(input,threshold)
            output = zeros(length(input),1);
            for n = 1:length(input)
                if input(n,1) > threshold
                    output(n,1) = threshold;
                elseif input(n,1) < -threshold
                    output(n,1) = -threshold;
                else
                    output(n,1) = input(n,1);
                end
            end
        end


        % Soft clipping - Cubic, Arctan
        function [output] = cubicSoftClipping(input,amount)
            output = zeros(length(input),1);
            for n = 1:length(input)
                output(n,1) = input(n,1) - amount * (1/3) * input(n,1)^3;
            end
        end


        function [output] = arctanSoftClipping(input,alpha)
            output = zeros(length(input),1);
            for n = 1:length(input)
                output(n,1) = (2/pi) * atan(input(n,1)*alpha) ;
            end
        end
        
        
        function [output] = bitCrushing(input,nBits)
            output = zeros(length(input),1);
            ampScale = 2 ^ (nBits-1);
            for n = 1:length(input)
                output(n,1) = ceil(input(n,1) * ampScale) * (1/ampScale);
            end
        end
        
        
    end
end