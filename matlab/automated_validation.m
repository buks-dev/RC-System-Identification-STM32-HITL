%t  = time_history;
%y  = voltage_history;

y  = double(out.rc_data.signals.values);
t  = double(out.rc_data.time);
  %y = {y}; single2double
%t = {t};

%% Creating Identification data object
Ts = mean(diff(t)); % sample time
u = ones(size(t));  % step input

io = iddata(y', u', Ts); 

%% Estimate Transfer function
sys = tfest(io,1,0); % 1 pole , 0 zeros

%% Display System
disp('Estimated Transfer Function: ');
sys

%% Validate Automatically
compare(io,sys)

