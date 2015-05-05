%%% PRACTICING WAYS TO FILTER DATA

%%%%%%%%%%%%%%%%%% 1. CREATE A SIGNAL TO DO THINGS TO %%%%%%%%%%%%%%%%%%%%%
% make time vector
T = 0.005;
t = T:T:2; % 0 to 3 seconds, in steps of 5 ms. 
Fs = 200; %sampling freq = 200 Hz
L = numel(t);  %number of samples

% make this a mixture of cosines 
signal = 5*cos(2*pi*8*t)+2*cos(2*pi*1*t)+1*cos(2*pi*50*t)+1*cos(2*pi*0.5*t);

% add 60-cycle noise and some other random noise
signal = signal + 5*cos(2*pi*60*t)+ randn(size(t));

% plot this signal
plot(t,signal,'k','linewidth',3)
box off
xlabel('Time (s)')
ylabel('Signal')

%%%%%%%%%%%%%%%%%% 1. WAYS YOU CAN SMOOTH YOUR DATA %%%%%%%%%%%%%%%%%%%%%%%
% USE SMOOTHING FUNCTION (FILTER IS A SQUARE WAVE)

% use the smooth function
smooth_signal = smooth(signal,5);
plot(t,signal,'k','linewidth',3)
box off
xlabel('Time (s)')
ylabel('Signal')
hold on
plot(t,smooth_signal,'r','linewidth',4)
hold off

% use the conv function
filter = (1/5)*ones(1,5);
smooth_signal = conv(signal,filter,'same'); %returns vector same size as original
plot(t,signal,'k','linewidth',3)
box off
xlabel('Time (s)')
ylabel('Signal')
hold on
plot(t,smooth_signal,'r','linewidth',4)
hold off

% use a gaussian filter
filter = gaussmf([-1 0 1],[5 0]);
filter = filter/sum(filter);
smooth_signal = conv(signal,filter,'same'); %returns vector same size as original
plot(t,signal,'k','linewidth',3)
box off
xlabel('Time (s)')
ylabel('Signal')
hold on
plot(t,smooth_signal,'r','linewidth',4)
hold off

%%%%%%%%%%%%%%%%%% 2. COMPUTE POWER SPECTRUM %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ps = abs(fft(signal)).^2; %compute fft of signal
Ps =Ps(1:length(signal)/2+1); %take first half of signal
freqs = linspace(0,Fs/2,length(Ps)); %Hz from 0 to Nyquist freq

% plot frequency
plot(freqs,Ps,'k','linewidth',3)
xlabel('Frequency (Hz)')
ylabel('Power')
box off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% use other filters (butterworth filter)
% implement butterworth filter
[b,a] = butter(3,[4 12]/(Fs/2)); %bandpass between 4 and 12 Hz (how many pi radians/sample)
smooth_signal = filtfilt(b,a,signal)+mean(signal); %command that will implement a zero-phase filter
plot(t,signal,'k','linewidth',3)
box off
xlabel('Time (s)')
ylabel('Signal')
hold on
plot(t,smooth_signal,'r','linewidth',4)
hold off

%%% look at frequencies of filtered data
Ps_filt = abs(fft(smooth_signal)).^2; %compute fft of signal
Ps_filt =Ps_filt(1:length(smooth_signal)/2+1);
freqs_filt = linspace(0,Fs/2,length(Ps_filt));

% plot to check
plot(freqs,Ps,'k','linewidth',3)
xlabel('Frequency (Hz)')
ylabel('Power')
box off
hold on
plot(freqs_filt,Ps_filt,'r','linewidth',3)
xlabel('Frequency (Hz)')
ylabel('Power')
box off


