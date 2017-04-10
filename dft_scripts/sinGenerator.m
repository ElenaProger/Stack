function out = sinGenerator()
  rand_freqs = 25;
  max_amp = 5;
  amp_factor = 0.3;
  noise_amp_factor = 0.3;
  
  freqs = primes(rand_freqs);
  freqs = freqs(1, 5:length(freqs));
  
  A1 = rand * max_amp;
  A2 = A1*amp_factor;
  
  f1 = freqs(randi([1, length(freqs)]));
  f2 = freqs(randi([1, length(freqs)]));
  while f2 == f1
    f2 = freqs(randi([1, length(freqs)]));
  end
  
  f1
  f2
  
  sin1 = sinSignal( f1, A1);
  sin2 = sinSignal( f2, A2);
  
  out = @(t) pulseFunc(t, sin1, sin2, A1*noise_amp_factor);
end

function result = pulseFunc(t, sin1, sin2, noise_amp)
  result = zeros(1,length(t));
  for n=1:length(t)
    result(n) = sin1(t(n)) + sin2(t(n))+ randn*noise_amp;
  end
end