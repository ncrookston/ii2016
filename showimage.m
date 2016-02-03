function showimage( I, fig_title )
%SHOWIMAGE Displays I, even if it's not quite the right shape
    if size(I,1) == 1
        I = reshape(I, [size(I,2), size(I,3)]);
    end
    figure;
    imagesc(I);
    colorbar;
    colormap gray;
    title(fig_title)
end

