%t = time_history; y = voltage_history;
y = out.rc_data.signals.values;
t = out.rc_data.time;


% Plot response 
figure; 
plot(t,y, 'b', 'LineWidth', 2); 
xlabel('Time (s)'); 
ylabel('Output Voltage (V)'); 
title('RC Circuit Step Response'); 
grid on; 

k_guess = 3.275;  % steady-state gain (This should be the voltage  
                % you measured from the digital output pin of the  
                % Blackpill with your voltmeter during your experiment) 
                
tau_guess = 5.1599587;%5.4;    % start with the value you got above 
%tt = 0:0.01:23.5;
y_theory = k_guess * (1 - exp(-t/tau_guess)); 

hold on; 
plot(t, y_theory, 'r--', 'LineWidth', 2);
xlim([0 49]);
ylim([0 4]);
legend('Experimental', 'Theoretical');


