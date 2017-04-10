%начальное состояние ГПСЧ
rand_state = 1;

% Частота дискретизации, в герцах (>200Гц)
Fd = 400;
dt=1/Fd;

% Длительность измерений, в секундах
RunToTime = 1;

%Число отсчетов, которые требуется отфильтровать
zeroed_up_to = 0;

% Отсчеты времени, в которых вычисляются значения сигналов
% от 0 до RunToTime секунд с шагом dt
t=[0:dt:RunToTime-dt];

rand('state', [rand_state, 4]);

[input_generator, clear_generator] = sinGenerator3;

input_signal = input_generator(t);
input_signal_clear = clear_generator(t);

out_fft = fft(input_signal);
df = Fd/length(out_fft);
out_f = [0:df:Fd-df];

filtered_fft = out_fft;
filtered_fft(1) = 0;
for n=1:zeroed_up_to
  filtered_fft(n+1) = 0;
  filtered_fft(length(filtered_fft) - n + 1) = 0;
end  


filtered_signal = real(ifft(filtered_fft));

MSE = sqrt(sum((input_signal_clear-filtered_signal).^2))

figure('name','Task 4: Frequency filtering');
subplot(3,1,1); plot(t, input_signal_clear); title('Intput signal without noise'); xlabel('t, s');
subplot(3,1,2); plot(t, input_signal); title('Input Singnal'); xlabel('t, s'); ylabel('Vin');
subplot(3,1,3); stem(out_f, abs(out_fft)); title('|DFT|'); xlabel('f, Hz');


figure('name','Task 4: Filter result');
subplot(3,1,1); stem(out_f, abs(filtered_fft)); title('Filtered |DFT|'); xlabel('f, Hz');
subplot(3,1,2); plot(t, filtered_signal); title('Output signal (|IDFT|)'); xlabel('t, s');
subplot(3,1,3); plot(t, input_signal_clear-filtered_signal); title('Error (Signal without noise - output'); xlabel('t, s');




