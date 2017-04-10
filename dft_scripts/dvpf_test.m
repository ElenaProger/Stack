%начальное состояние ГПСЧ
rand_state = 25;

% Частота дискретизации, в герцах (>200Гц)
Fd = 200;
dt=1/Fd;

% Длительность измерений, в секундах
RunToTime = 0.5;

% Дополнительное число нулей в конце входной последовательности
padding = 80;

% Отсчеты времени, в которых вычисляются значения сигналов
% от 0 до RunToTime секунд с шагом dt
t=[0:dt:RunToTime-dt];

%rand('state', [rand_state, 2]);
input_generator = sinGenerator2;

input_signal = input_generator(t);


padded_time = [t, RunToTime:dt:RunToTime+(padding-1)*dt];
padded_signal = [input_signal, zeros(1,padding)];

out_fft = fft(padded_signal);
df = Fd/length(out_fft);
out_f = [0:df:Fd-df];

figure('name','Task 2: Frequency resolution');
subplot(2,1,1); plot(padded_time, padded_signal); title('Input Singnal'); xlabel('t, s'); ylabel('Vin');
subplot(2,1,2); plot(out_f, abs(out_fft)); title('|DFT|'); xlabel('f, Hz');




