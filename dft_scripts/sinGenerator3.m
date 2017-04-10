function [out_noise, out_clear] = sinGenerator3()
  max_amp = 1;
  amp_factor = 0.8;
  A1 = rand * max_amp;
  A2 = A1 * amp_factor;
    
  f1 = randi([180, 200]);
  f2 = randi([150, 170]);
   
  f1
  f2
  
  sin1 = sinSignal( f1, A1);
  sin2 = sinSignal( f2, A2);
  
  out_noise = @(t) pulseFunc(t, sin1, sin2, 1);
  out_clear = @(t) pulseFunc(t, sin1, sin2, 0);
end

function result = pulseFunc(t, sin1, sin2, noise_factor)
  result = zeros(1,length(t));
  noise = randn;
  for n=1:length(t)
    result(n) = sin1(t(n)) + sin2(t(n))+ noise*noise_factor;
    noise = noise + randn*0.2;
  end
end