clc
close all
clear all

%% Load CSV data

% Input
 file_path = 'data/20180309_14_44_27_welder_data.csv';
 cfile_path = 'data/20180309_14_55_12_welder_data.csv';


% Read CSV
csv = csvread(file_path);

size_0 = size(csv, 1);

% Delete the rows with zero cmds
for n = 1 : size_0
   
   if (csv(n,2) == 0) && (csv(n,3) == 0)
   csv(n,2) = nan;
   end
       
end

csv(isnan(csv(:,2)),:)= [];

seq = csv(:, 1);
% Normalise
seq = (seq - seq(1));

% Column Names
voltage_cmd = csv(:, 2);
wire_feed_speed_cmd = csv(:, 3);
actual_current = csv(:, 4);
actual_voltage = csv(:, 5);
acutal_wire_speed = csv(:, 6);

% Polyfit Voltage Curve
p_v = polyfit(seq,actual_voltage,7);
x1_v = linspace(0,4*pi);
y1_v = polyval(p_v,x1_v);

% Polyfit Amperage Curve
p_a = polyfit(seq,actual_current,25);
x1_a = linspace(0,4*pi);
y1_a = polyval(p_a,x1_a);

figure('Name', 'Actual Voltage Fitted')
plot(seq,actual_voltage,'.')
hold on
plot(x1_v,y1_v)
hold off


figure('Name', 'Voltage Cmd vs. Actual Fitted curve');
scatter(seq,voltage_cmd,'.')
hold on;
plot(x1_v,y1_v)
hold off;


figure('Name', 'Votage Cmd vs. Actual Scatter');
scatter(seq,voltage_cmd,'.')
hold on;
scatter(seq,actual_voltage,'.')
hold off;

figure('Name', 'Wire feed speed & Current');
scatter(seq,wire_feed_speed_cmd,'.')
hold on;
scatter(seq,acutal_wire_speed,'.')
scatter(seq,actual_current,'.')

hold off;



