function[out] = fullWaveRectification(in)
    for n = 1:length(in)
        if in(n,1) >= 0
            out(n,1) = in(n,1);
        else
            out(n,1) = -1 * in(n,1);
        end
    end
end