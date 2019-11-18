%% Information 
% This file is only an example of how you can start the simulation. The
% sampling time decides how often you store states. The execution  time
% will increase if you reduce the sampling time.

% Please note that the file "pathplotter.m" (only used in the second part
% of the assignment) shows the ship path during the path following and
% target tracking part of the assignment. It can be clever to adjust the sampling
% time when you use that file because it draws a sketch of the ship in the
% North-East plane at each time instant. Having a small sampling time will
% lead to multiple ship drawings on top of each other. 

% You should base all of your simulink models on the MSFartoystyring model
% and extend that as you solve the assignment. For your own sake, it is
% wise to create a new model and run file for each task.

% The msfartoystyring.m file includes the ship model. You are not allowed
% to change anything within that file. You need to include that file in
% every folder where you have a simulink model based on
% "MSFartoystyring.slx". 

% WP.mat is a set of six waypoints that you need to use in the second part of
% the assignment. The north position is given in the first row and the east
% position in the second row. 


%% Simulation settings
tstart=0;           % Sim start time
tstop=10000;         % Sim stop time
tsamp=1;            % Sampling time for how often states are stored. (NOT ODE solver time step)

p0=zeros(2,1);      % Initial position (NED)
v0=[6.63 0]';       % Initial velocity (body)
psi0=0;             % Inital yaw angle
r0=0;               % Inital yaw rate
c=0;                % Current on (1)/off (0)

%%%% Input functions
sin1 = sin(0:pi/100:2*pi);

delta_c = 10*pi/180;
n_c = 7.3;

%%%% 1. order Nomoto parameters
[T, K] = nomoto1();
%K = -0.0334;% -0.001404 / 0.0008942;
%T = 54.2005; %1 / 0.0008942;

%%%% heading PID parameters

Kp = 2.5446;
Kd = 127.2314;
%Ki = 0.0102;   %Beregnet Ki
Ki = 0.022;     % manuell tuning

sim MSFartoystyring1 % The measurements from the simulink model are automatically written to the workspace.

plot14(t, r, r_d, psi, psi_d)
