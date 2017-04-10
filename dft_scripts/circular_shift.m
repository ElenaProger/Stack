function y = circular_shift(x, K)
  y = circshift(x, [0 K]);
end