function out = sinGenerator2()
  rand_freqs = 25;
  max_amp = 5;
  amp_factor = 0.8;
  noise_amp_factor = 1;
  
  freqs = primes(rand_freqs);
  freqs = freqs(1, 5:length(freqs));
  
  A1 = rand * max_amp;
  A2 = A1*amp_factor;
  
  f1 = freqs(randi([1, length(freqs)]));
  f2 = f1+1.5;
  
  f1 = 11
  f2 = 12.5
  
  sin1 = sinSignal( f1, A1);
  sin2 = sinSignal( f2, A2);
  
  out = @(t) pulseFunc(t, sin1, sin2);
end

function result = pulseFunc(t, sin1, sin2)
  result = zeros(1,length(t));
  for n=1:length(t)
    result(n) = sin1(t(n)) + sin2(t(n))+randn*2;
  end
end