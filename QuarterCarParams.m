%% QuarterCarParams.m script loads the parameters required by the Simulink model
%
clear; close all; clc;

%% Physical parameters
g = 9.81;       % gravity

%% Controller parameters
Ts = 0.005;     % Sample rate of discrete controller
Kp = 1200;      % Controller configuration parameter
Ki = 100000;    % Controller configuration parameter
Kd = 0;         % Controller configuration parameter
dPole = 1000;   % Pole of non-idealized derivative

%% Vehicle parameters
Wr = 0.32;      % Wheel radius 
J = 1;          % Wheel moment 
v0 = 30;        % Initial velocity = 30
m = 450;        % 1/4 car mass = 450
m0 = m;         % Initial mass (used in the EKF mass estimation)

%% Road surface parameters
% Burckhardt model for dry asphalt

roadCoeffs = [1.2801 23.99 0.523 0.03];

%% Actuator parameters
actuatorPole = 70;      % Filter pole location
actuatorSat = 4000;     % Torque Saturation
actuatorDelay = 0.005;  % Time delay

%% Reference signal
lambda_ref = 0.1;       % Slip (lambda = 0.1)

