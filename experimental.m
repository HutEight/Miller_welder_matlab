clc
close all
clear all

%% Load CSV data

% Input
file_path = 
csv = csvread(file_path);

% Delete the first row
csv(1,:) = [];

seq = csv(:, 1);
% Normalise
seq = ((seq - seq(1)) / 100);

voltage_cmd = csv(:, 2);
wire_feed_speed_cmd = csv(:, 3);
actual_current = csv(:, 4);
actual_voltage = csv(:, 5);
acutal_wire_speed = csv(:, 6);





