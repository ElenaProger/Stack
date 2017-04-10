rand_state = 1;
rand('state', rand_state);

x = rand(1,16);
y = fft(x);

figure('name', 'Circular shift');
subplot(3,1,1); stem(x); title('x[k]'); xlabel('k'); ylabel('x[k]');
subplot(3,1,2); stem(abs(y)); title('X[n] = |FFT(x)|'); xlabel('n'); ylabel('X[n]');
subplot(3,1,3); stem(angle(y)); title('arg[n] = arg(FFT(x))'); xlabel('n'); ylabel('arg[n]');