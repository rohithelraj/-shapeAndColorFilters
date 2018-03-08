function simg = greysmooth(img, n)

  % convert the image with imono
  grey = imono(img);

  % create kernel
  K = ones(n,n) / n^2;

  % perform convolution
  simg = iconvolve(K, grey);

end