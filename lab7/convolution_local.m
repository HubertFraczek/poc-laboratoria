function data_filtered = convolution_local(data, local_window)
    Nx = size(data, 2);
    h = fspecial('gaussian', local_window, 25);
    
    for i=1:Nx
       p = reshape(data(:, i), local_window);
       data_filtered(i) = sum(sum(p .* h));
    end
end
