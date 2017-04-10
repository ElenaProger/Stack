%начальное состояние ГПСЧ
rand_state = 1;

% Частота дискретизации, в герцах (>200Гц)
Fd = 100;
dt=1/Fd;

% Длительность измерений, в секундах
RunToTime = 1;

% Отсчеты времени, в которых вычисляются значения сигналов
% от 0 до RunToTime секунд с шагом dt
t=[0:dt:RunToTime-dt];

rand('state', rand_state);
input_generator = sinGenerator;

input_signal = input_generator(t);

out_fft = fft(input_signal);

figure('name','Task 2: Frequency resolution');
subplot(2,1,1); plot(t, input_signal); title('Input Singnal'); xlabel('t, s'); ylabel('Vin');
subplot(2,1,2); stem(abs(out_fft)); title('|DFT|'); xlabel('n');




